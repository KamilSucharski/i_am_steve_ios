import Foundation
import RxSwift

struct ComicRepositoryRemoteImpl: ComicRepositoryRemote {
    
    private let apiClient = APIClient()
    
    func getComics() -> Observable<[Comic]> {
        return apiClient
            .send<[ComicDTO]>(apiRequest: GetComicsRequest())
            .map { ComicMapper.map($0) }
    }
    
    func getComicPanel(comicNumber: Int, panelNumber: Int) -> Observable<[UInt8]> {
        //todo
        return Observable.empty()
    }
}
