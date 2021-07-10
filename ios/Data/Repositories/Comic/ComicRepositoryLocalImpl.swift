import Foundation

struct ComicRepositoryLocalImpl: ComicRepositoryLocal {
    
    func saveComics(comics: [Comic]) {
        //todo
    }
    
    func loadComics() -> [Comic]? {
        //todo
        return nil
    }
    
    func saveComicPanel(comicNumber: Int, panelNumber: Int, byteArray: [UInt8]) -> URL {
        //todo
    }
    
    func loadComicPanel(comicNumber: Int, panelNumber: Int) -> URL? {
        //todo
        return nil
    }
}
