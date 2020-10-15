import Foundation


protocol AlbumService {
    func fetchAlbums(completion: @escaping (Result<Feed, Error>) -> ())
}

final class DefaultAlbumService: AlbumService {
    let client = Client()

    func fetchAlbums(completion: @escaping (Result<Feed, Error>) -> ()) {
        let endpoint = API.appleTopAlbums(numberOfAlbums: 100)
        client.call(type: Feed.self, endpoint: endpoint, completion: completion)
    }
}
