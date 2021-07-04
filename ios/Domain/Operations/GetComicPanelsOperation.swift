import Foundation
import RxSwift

struct GetComicPanelsOperation: Operation {
    
    private let comicRepositoryLocal: ComicRepositoryLocal = Container.resolve()
    private let comicRepositoryRemote: ComicRepositoryRemote = Container.resolve()
    
    let comic: Comic
    
    func execute() -> Observable<ComicPanels> {
        let existingComicPanels = getExistingComicPanels()
        if existingComicPanels != nil {
            return Observable.just(existingComicPanels!)
        }

        var panelObservables: [Observable<URL>] = []
        for panelNumber in 1...4 {
            let observable = comicRepositoryRemote
                .getComicPanel(
                    comicNumber: comic.number,
                    panelNumber: panelNumber
                )
                .map { byteArray in
                    comicRepositoryLocal.saveComicPanel(
                        comicNumber: comic.number,
                        panelNumber: panelNumber,
                        byteArray: byteArray
                    )
                }
            panelObservables[panelNumber] = observable
        }

        return Observable<ComicPanels>.zip(
            panelObservables[0],
            panelObservables[1],
            panelObservables[2],
            panelObservables[3],
            resultSelector: { panel1, panel2, panel3, panel4 in
                return ComicPanels(
                    panel1: panel1,
                    panel2: panel2,
                    panel3: panel3,
                    panel4: panel4
                )
            })
    }

    private func getExistingComicPanels() -> ComicPanels? {
        let panel1 = comicRepositoryLocal.loadComicPanel(comicNumber: comic.number, panelNumber: 1)
        let panel2 = comicRepositoryLocal.loadComicPanel(comicNumber: comic.number, panelNumber: 2)
        let panel3 = comicRepositoryLocal.loadComicPanel(comicNumber: comic.number, panelNumber: 3)
        let panel4 = comicRepositoryLocal.loadComicPanel(comicNumber: comic.number, panelNumber: 4)
        if panel1 == nil || panel2 == nil || panel3 == nil || panel4 == nil {
            return nil
        } else {
            return ComicPanels(panel1: panel1!, panel2: panel2!, panel3: panel3!, panel4: panel4!)
        }
    }
}
