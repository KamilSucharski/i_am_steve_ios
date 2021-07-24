import Foundation
import RxSwift

struct ComicRepositoryLocalImpl: ComicRepositoryLocal {
    
    func getComicsFromAssets() -> Single<[Comic]> {
        
    }
    
    func getComicsFromLocalStorage() -> Single<[Comic]> {
        
    }
    
    func saveComicsToLocalStorage(comics: [Comic]) {
        
    }
    
    func getComicPanelFromAssets(comicNumber: Int, panelNumber: Int) -> Single<[UInt8]> {
        
    }
    
    func getComicPanelFromLocalStorage(comicNumber: Int, panelNumber: Int) -> Single<[UInt8]> {
        
    }
    
    func saveComicPanelToLocalStorage(comicNumber: Int, panelNumber: Int, byteArray: [UInt8]) -> [UInt8] {
        
    }
}
