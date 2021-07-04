import Foundation
import RxSwift

protocol ArchiveView : BaseView {
    var comicTrigger: Observable<Comic> { get }

    func setData(comics: [Comic])
    func navigateToComic(comic: Comic)
}
