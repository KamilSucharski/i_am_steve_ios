import Foundation

public protocol Serializer {
    func serialize(value: AnyObject) -> String
    func deserialize(value: String) //todo return tyoe
}
