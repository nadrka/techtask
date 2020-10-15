import Foundation

enum API {

}

extension API {
    static func appleTopAlbums(numberOfAlbums: Int) -> Endpoint {
        Endpoint(
                method: .get,
                path: "/apple-music/top-albums/all/\(numberOfAlbums)/explicit.json"
        )
    }
}