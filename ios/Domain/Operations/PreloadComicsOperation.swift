import Foundation
import RxSwift

struct PreloadComicsOperation: Operation {
    
    func execute() -> Observable<Bool> {
        return Observable.just(false) //todo
    }
}
