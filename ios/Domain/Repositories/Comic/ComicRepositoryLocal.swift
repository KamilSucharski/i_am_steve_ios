import Foundation

protocol ComicRepositoryLocal {
    func saveComics(comics: [Comic])
    func loadComics() -> [Comic]?
    func saveComicPanel(comicNumber: Int, panelNumber: Int, byteArray: [UInt8]) -> URL
    func loadComicPanel(comicNumber: Int, panelNumber: Int) -> URL?
}
