import Foundation

public protocol Operation {
    associatedtype Result
    
    func execute() -> Result
}
