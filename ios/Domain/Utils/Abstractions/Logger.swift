import Foundation

public protocol Logger {
    func debug(string: String)
    func error(string: String)
    func error(string: String, error: Error)
}
