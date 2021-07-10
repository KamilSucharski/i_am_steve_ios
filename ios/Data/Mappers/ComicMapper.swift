import Foundation

struct ComicMapper: Mapper {
    
    func map(from object: ComicDTO) -> Comic {
        return Comic(
            number: object.number,
            title: object.title,
            date: object.date
        )
    }
}
