import Foundation

class Album: Codable {
    private(set) var id: String?
    private(set) var artistName: String?
    private(set) var name: String?
    private(set) var releaseDate: String?
    private(set) var copyright: String?
    private(set) var genres: [Genre] = []
    private(set) var url: String = ""
    private(set) var artworkUrl100: String = ""
}
