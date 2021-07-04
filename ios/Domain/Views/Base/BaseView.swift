import Foundation

protocol BaseView {
    associatedtype T: BasePresenter
    
    var presenter: T { get }
}
