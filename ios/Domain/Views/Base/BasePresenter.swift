import Foundation

protocol BasePresenter {
    associatedtype V
    
    func subscribe(view: V)
    func unsubscribe()
}
