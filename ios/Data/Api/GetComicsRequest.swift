import Foundation

struct GetComicsRequest: APIRequest {
    var method = RequestType.GET
    var path = "comics.json"
    var parameters = [String: String]()
}
