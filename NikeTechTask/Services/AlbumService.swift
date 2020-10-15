import Foundation


protocol AlbumService {
    func fetchAlbums(completion: @escaping (Result<TopAlbumsInfo, Error>) -> ())
}

final class DefaultAlbumService: AlbumService {
    let client = Client()

    func fetchAlbums(completion: @escaping (Result<TopAlbumsInfo, Error>) -> ()) {
        let endpoint = API.appleTopAlbums(numberOfAlbums: 100)
        client.call(type: TopAlbumsInfo.self, endpoint: endpoint, completion: completion)
    }
}
