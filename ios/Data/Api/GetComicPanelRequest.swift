import Foundation

struct GetComicPanelRequest: APIRequest {
    var method = RequestType.GET
    var path: String {
        get {
            return "assets/comic/\(fileName)"
        }
    }
    var parameters = [String: String]()
    var fileName = ""

    init(fileName: String) {
        self.fileName = fileName
    }
}
