import Foundation
import RxSwift

protocol ComicGalleryView {
    var pageChangedTrigger: Observable<Int> { get }
    var previousButtonTrigger: Observable<Unit> { get }
    var archiveButtonTrigger: Observable<Unit> { get }
    var nextButtonTrigger: Observable<Unit> { get }
    var comicSelectedInArchiveTrigger: Observable<Comic> { get }
    var currentPosition: Int { get }

    func displayComics(comics: [Comic])
    func setPosition(position: Int)
    func setButtonVisibility(previousButtonVisible: Bool, nextButtonVisible: Bool)
    func navigateToArchiveScreen()
}
