import UIKit

class AlbumListView: UIView {
    let viewModel: AlbumListViewModel
    let tableView = UITableView()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: AlbumListViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.setupView()
    }

    private func setupView() {
        backgroundColor = .white
        addSubview(tableView)
        tableView.fillParent()
    }

}
