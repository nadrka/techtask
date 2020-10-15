import Foundation

protocol AlbumListViewModel {
    var onAlbumsLoaded: (() -> ())? { get set }
    var onError: (() -> ())? { get set }
    var onAlbumPicked: ((Album) -> ())? { get set }
    func fetchAlbums()
    func getAlbum(at index: Int) -> Album?
    func getNumberOfAlbums() -> Int
}

final class DefaultAlbumListViewModel: AlbumListViewModel {
    var onAlbumsLoaded: (() -> ())?
    var onAlbumPicked: ((Album) -> ())?
    var onError: (() -> ())?

    private let albumService: AlbumService
    private var albums: [Album] = []



    init(albumService: AlbumService) {
        self.albumService = albumService
    }

    func fetchAlbums() {
        albumService.fetchAlbums { [weak self] result in
            switch result {
            case .success(let info):
                DispatchQueue.main.async {
                    self?.albums = info.feed.results
                    self?.onAlbumsLoaded?()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func getAlbum(at index: Int) -> Album? {
        index < albums.count ? albums[index] : nil
    }

    func getNumberOfAlbums() -> Int {
        albums.count
    }

}
