import Foundation
import RxSwift

struct GetComicsOperation: Operation {
    
    private let comicRepositoryLocal: ComicRepositoryLocal = Container.resolve()
    private let comicRepositoryRemote: ComicRepositoryRemote = Container.resolve()
    
    func execute() -> Observable<[Comic]> {
        return comicRepositoryRemote
            .getComics()
            .map { comics in
                comicRepositoryLocal.saveComics(comics: comics)
                return comics
            }
//            .catchError { throwable ->
//                logger.error("Error getting comics", throwable)
//                comicRepositoryLocal
//                    .loadComics()
//                    ?.let { Observable.just(it) }
//                    ?: Observable.error(NoComicsException())
//            }
    }
}
