import Foundation
import RxSwift

struct GetComicsOperation: Operation {
    
    private let comicRepositoryLocal: ComicRepositoryLocal = Container.resolve()
    private let comicRepositoryRemote: ComicRepositoryRemote = Container.resolve()
    private let logger: Logger = Container.resolve()
    
    func execute(input: Unit) -> Single<[Comic]> {
        return getFromApi()
            .catch { error in
                logger.error(
                    string: "Could not get comics.json from the API. Trying local storage.",
                    error: error
                )
                return getFromLocalStorage()
            }
            .catch { error in
                logger.error(
                    string: "Could not get comics.json from the local storage. Trying assets.",
                    error: error
                )
                return getFromAssets()
            }
    }
    
    private func getFromApi() -> Single<[Comic]> {
        return comicRepositoryRemote
            .getComics()
            .map { comics in
                comicRepositoryLocal.saveComicsToLocalStorage(comics: comics)
                return comics
            }
    }
    
    private func getFromLocalStorage() -> Single<[Comic]> {
        return comicRepositoryLocal.getComicsFromLocalStorage()
    }
    
    private func getFromAssets() -> Single<[Comic]> {
        return comicRepositoryLocal.getComicsFromAssets()
    }
}
