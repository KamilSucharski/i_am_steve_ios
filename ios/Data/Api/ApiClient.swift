import Foundation
import RxSwift

class ApiClient {
    private let baseURL = URL(string: "https://iamsteve.neocities.org/")!

    func send<T: Codable>(apiRequest: ApiRequest) -> Observable<T> {
        let request = apiRequest.request(with: baseURL)
        return URLSession.shared.rx.data(request: request)
            .map {
                try JSONDecoder().decode(T.self, from: data)
            }
            .observeOn(MainScheduler.asyncInstance)
    }
}
