import Foundation

public protocol LocalStorage {
    func containsEntry(key: String) -> Bool
    func containsFile(key: String) -> Bool
    
    func removeEntry(key: String)
    func removeFile(key: String)
    
    func putBool(key: String, bool: Bool) -> Bool
    func putInt(key: String, int: Int) -> Int
    func putString(key: String, string: String) -> String
    func putObject(key: String, object: AnyObject) -> String
    func putFile(key: String, file: [UInt8]) -> URL
    
    func getBoolean(key: String) -> Bool?
    func getInt(key: String) -> Int?
    func getString(key: String) -> String?
    func getObject<T>(key: String) -> T?
    func getFile(key: String) -> URL?
}
