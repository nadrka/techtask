import Foundation

class Feed: Codable {
    private(set) var feed: Albums
}

class Albums: Codable {
    private(set) var results: [Album]
}
