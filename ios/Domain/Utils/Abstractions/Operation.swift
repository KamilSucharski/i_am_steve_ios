import Foundation

public protocol Operation {
    associatedtype In
    associatedtype Out
    
    func execute(input: In) -> Out
}
