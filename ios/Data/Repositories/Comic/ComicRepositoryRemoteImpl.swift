import Foundation
import RxSwift

struct ComicRepositoryRemoteImpl: ComicRepositoryRemote {
    
    private let apiClient = ApiClient()
    
    func getComics() -> Single<[Comic]> {
        return apiClient
            .send(apiRequest: GetComicsRequest())
            .map { [ComicDTO] in ComicMapper.map($0) }
    }
    
    func getComicPanel(comicNumber: Int, panelNumber: Int) -> Single<[UInt8]> {
        return apiClient
            .send(apiRequest: GetComicPanelRequest(fileName: String(
                format: Consts.COMIC_PANEL_FILE_NAME_FORMAT,
                comicNumber,
                panelNumber
            )))
    }
}
