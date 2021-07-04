import Foundation

protocol StartView : BaseView {
    func setProgress(done: Int, all: Int)
    func navigateToComicGalleryScreen()
}
