import Foundation
import RxSwift

final class APIClient {
    private let httpClient = HTTPClient()

    func execute(request: RequestType) -> Observable<Void> {
        do {
            return httpClient.execute(request: try request.build())
        } catch {
            return Observable.error(error)
        }
    }
}
