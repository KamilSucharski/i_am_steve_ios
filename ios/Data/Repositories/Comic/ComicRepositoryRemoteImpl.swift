import Foundation
import RxSwift

struct ComicRepositoryRemoteImpl: ComicRepositoryRemote {
    
    func getComics() -> Observable<[Comic]> {
        //todo
        return Observable.empty()
    }
    
    func getComicPanel(comicNumber: Int, panelNumber: Int) -> Observable<[UInt8]> {
        //todo
        return Observable.empty()
    }
}
