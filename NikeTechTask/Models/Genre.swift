import Foundation

class Genre: Codable {
    private(set) var id: String?
    private(set) var name: String?

    init(name: String) {
        self.name = name
    }
}
