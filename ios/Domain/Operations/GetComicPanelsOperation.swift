import Foundation
import RxSwift

struct GetComicPanelsOperation: Operation {
    
    private let comicRepositoryLocal: ComicRepositoryLocal = Container.resolve()
    private let comicRepositoryRemote: ComicRepositoryRemote = Container.resolve()
    private let logger: Logger = Container.resolve()
    
    func execute(input: Comic) -> Single<ComicPanels> {
        return getFromAssets(comicNumber: input.number)
            .catch { error in
                logger.error(
                    string: "Could not get comic panels from the assets. Trying local storage.",
                    error: error
                )
                return getFromLocalStorage(comicNumber: input.number)
            }
            .catch { error in
                logger.error(
                    string: "Could not get comic panels from the local storage. Trying API.",
                    error: error
                )
                return getFromApi(comicNumber: input.number)
            }
    }
    
    private func getFromAssets(comicNumber: Int) -> Single<ComicPanels> {
        return joinPanels(
            panel1Single: getPanelFromAssets(comicNumber: comicNumber, panelNumber: 1),
            panel2Single: getPanelFromAssets(comicNumber: comicNumber, panelNumber: 2),
            panel3Single: getPanelFromAssets(comicNumber: comicNumber, panelNumber: 3),
            panel4Single: getPanelFromAssets(comicNumber: comicNumber, panelNumber: 4)
        )
    }
    
    private func getPanelFromAssets(comicNumber: Int, panelNumber: Int) -> Single<[UInt8]> {
        return comicRepositoryLocal
            .getComicPanelFromAssets(
                comicNumber: comicNumber,
                panelNumber: panelNumber
            )
            .map { panel in
                comicRepositoryLocal.removeComicPanelFromLocalStorage(
                    comicNumber: comicNumber,
                    panelNumber: panelNumber
                )
                return panel
            }
    }
    
    private func getFromLocalStorage(comicNumber: Int) -> Single<ComicPanels> {
        return joinPanels(
            panel1Single: getPanelFromLocalStorage(comicNumber: comicNumber, panelNumber: 1),
            panel2Single: getPanelFromLocalStorage(comicNumber: comicNumber, panelNumber: 2),
            panel3Single: getPanelFromLocalStorage(comicNumber: comicNumber, panelNumber: 3),
            panel4Single: getPanelFromLocalStorage(comicNumber: comicNumber, panelNumber: 4)
        )
    }
    
    private func getPanelFromLocalStorage(comicNumber: Int, panelNumber: Int) -> Single<[UInt8]> {
        return comicRepositoryLocal.getComicPanelFromLocalStorage(
            comicNumber: comicNumber,
            panelNumber: panelNumber
        )
    }
    
    private func getFromApi(comicNumber: Int) -> Single<ComicPanels> {
        return joinPanels(
            panel1Single: getPanelFromAPI(comicNumber: comicNumber, panelNumber: 1),
            panel2Single: getPanelFromAPI(comicNumber: comicNumber, panelNumber: 2),
            panel3Single: getPanelFromAPI(comicNumber: comicNumber, panelNumber: 3),
            panel4Single: getPanelFromAPI(comicNumber: comicNumber, panelNumber: 4)
        )
    }
    
    private func getPanelFromAPI(comicNumber: Int, panelNumber: Int) -> Single<[UInt8]> {
        return comicRepositoryRemote
            .getComicPanel(
                comicNumber: comicNumber,
                panelNumber: panelNumber
            )
            .map { byteArray in
                comicRepositoryLocal.saveComicPanelToLocalStorage(
                    comicNumber: comicNumber,
                    panelNumber: panelNumber,
                    byteArray: byteArray
                )
            }
    }
    
    private func joinPanels(
        panel1Single: Single<[UInt8]>,
        panel2Single: Single<[UInt8]>,
        panel3Single: Single<[UInt8]>,
        panel4Single: Single<[UInt8]>
    ) -> Single<ComicPanels> {
        return Single.zip(
            panel1Single,
            panel2Single,
            panel3Single,
            panel4Single,
            resultSelector: { panel1, panel2, panel3, panel4 in
            ComicPanels(
                panel1: panel1,
                panel2: panel2,
                panel3: panel3,
                panel4: panel4
            )
        })
    }
}
