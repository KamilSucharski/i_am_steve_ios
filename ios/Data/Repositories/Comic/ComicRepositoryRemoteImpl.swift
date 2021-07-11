import Foundation
import RxSwift

struct ComicRepositoryRemoteImpl: ComicRepositoryRemote {
    
    private let apiClient = APIClient()
    
    func getComics() -> Observable<[Comic]> {
        return apiClient
            .send(apiRequest: GetComicsRequest())
            .map { [ComicDTO] in ComicMapper.map($0) }
    }
    
    func getComicPanel(comicNumber: Int, panelNumber: Int) -> Observable<[UInt8]> {
        return apiClient
            .send(apiRequest: GetComicPanelRequest(fileName: String(
                format: Consts.COMIC_PANEL_FILE_NAME_FORMAT,
                comicNumber,
                panelNumber
            )))
    }
}
