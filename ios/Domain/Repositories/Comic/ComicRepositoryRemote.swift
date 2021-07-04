import Foundation
import RxSwift

protocol ComicRepositoryRemote {
    func getComics() -> Observable<[Comic]>
    func getComicPanel(comicNumber: Int, panelNumber: Int) -> Observable<[UInt8]>
}
