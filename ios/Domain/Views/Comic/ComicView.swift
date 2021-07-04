import Foundation

protocol ComicView {
    var comic: Comic { get }
    
    func setData(data: Data)
}

struct Data {
    public let comic: Comic
    public let comicPanels: ComicPanels
    
    public init(comic: Comic, comicPanels: ComicPanels) {
        self.comic = comic
        self.comicPanels = comicPanels
    }
}
