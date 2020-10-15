import UIKit


class AlbumDetailsViewController: UIViewController {
    let viewModel: AlbumDetailsViewModel
    let mainView: AlbumDetailsView

    init(viewModel: AlbumDetailsViewModel) {
        self.viewModel = viewModel
        self.mainView = AlbumDetailsView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.view.addSubview(mainView)
        mainView.fillParent()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}