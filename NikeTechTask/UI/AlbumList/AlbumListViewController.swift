import UIKit

class AlbumListViewController: UIViewController {
    var viewModel: AlbumListViewModel
    let mainView: AlbumListView

    init(viewModel: AlbumListViewModel) {
        self.viewModel = viewModel
        self.mainView = AlbumListView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.view.addSubview(mainView)
        mainView.fillParent()
        configureTableView()
    }

    private func configureTableView() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.reusableIdentifier)
        mainView.tableView.tableFooterView = UIView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.fetchAlbums()
        title = "Top Albums"
    }

    private func bindViewModel() {
        viewModel.onAlbumsLoaded = { [weak self] in
            self?.mainView.tableView.reloadData()
        }

        viewModel.onError = { [weak self] in
            //todo: show error message
        }
    }
}

extension AlbumListViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let album = viewModel.getAlbum(at: indexPath.row) else {
            return
        }
        viewModel.onAlbumPicked?(album)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AlbumListViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfAlbums()
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.reusableIdentifier) as! AlbumTableViewCell

        if let album = viewModel.getAlbum(at: indexPath.row) {
            cell.configure(with: album)
        }

        return cell
    }
}