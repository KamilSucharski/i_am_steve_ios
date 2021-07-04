import Foundation

public struct Comic {
    public let number: Int
    public let title: String
    public let date: String
    
    public init(number: Int, title: String, date: String) {
        self.number = number
        self.title = title
        self.date = date
    }
}
