import UIKit

protocol AlbumDetailsViewModel {
    var imageURL: URL? { get }
    var albumName: String { get }
    var artistName: String { get }
    var genres: String { get }
    var copyright: String { get }
    func openITunes()
}

final class DefaultAlbumDetailsViewModel: AlbumDetailsViewModel {
    private let album: Album

    init(album: Album) {
        self.album = album
    }

    var imageURL: URL? {
        URL(string: album.artworkUrl100)
    }

    var albumName: String {
        album.name ?? ""
    }

    var artistName: String {
        album.artistName ?? ""
    }

    var genres: String {
        let genres = album.genres.map {
            $0.name ?? ""
        }.reduce("") {
            $0 + $1 + " "
        }

        return "Genres: \(genres)"
    }
    var copyright: String {
        album.copyright ?? ""
    }

    func openITunes() {
        guard let url = URL(string: album.url) else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}