import Foundation

protocol APIEndpoint: EndpointType {
    var resource: String { get }
    var endpoint: String { get }
}

extension APIEndpoint {
    var resource: String {
        ""
    }
    
    func resolve() throws -> String {
        let config: AppConfig = Container.resolve()
        
        guard let url = URL(string: "\(resource)\(endpoint)", relativeTo: URL(string: config.baseURL)) else {
            throw AppError.unexpectedError
        }
        return url.absoluteString
    }
}
