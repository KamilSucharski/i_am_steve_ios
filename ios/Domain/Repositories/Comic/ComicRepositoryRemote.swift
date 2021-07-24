import Foundation
import RxSwift

public protocol ComicRepositoryRemote {
    func getComics() -> Single<[Comic]>
    func getComicPanel(comicNumber: Int, panelNumber: Int) -> Single<[UInt8]>
}
