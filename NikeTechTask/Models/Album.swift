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

    init(artistName: String, name: String, genres: [Genre], copyright: String, releaseDate: String) {
        self.name = name
        self.artistName = artistName
        self.genres = genres
        self.copyright = copyright
        self.releaseDate = releaseDate
    }
}
