import UIKit

class AlbumFlowController: FlowController {
    private var rootNavigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.rootNavigationController = navigationController
    }

    func runFlow() {
        showAlbumList()
    }

    private func showAlbumList() {
        let albumService = DefaultAlbumService()
        let albumListVM = DefaultAlbumListViewModel(albumService: albumService)
        let albumListVC = AlbumListViewController(viewModel: albumListVM)

        albumListVM.onAlbumPicked = { [weak self] album in
            self?.showAlbumDetails(with: album)
        }

        self.rootNavigationController.viewControllers = [albumListVC]
    }

    private func showAlbumDetails(with album: Album) {
        let albumDetailsVM = DefaultAlbumDetailsViewModel(album: album)
        let albumDetailsVC = AlbumDetailsViewController(viewModel: albumDetailsVM)

        self.rootNavigationController.pushViewController(albumDetailsVC, animated: true)
    }
}
