import Foundation

protocol Operation {
    associatedtype T
    
    func execute() -> T
}
