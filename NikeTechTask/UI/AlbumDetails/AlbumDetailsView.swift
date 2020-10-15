import UIKit

class AlbumDetailsView: UIView {
    let viewModel: AlbumDetailsViewModel

    private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.alwaysBounceVertical = true
        return scroll
    }()

    private let scrollViewContainer = UIView()

    private var albumImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        imageView.layer.shadowColor = UIColor.black.withAlphaComponent(0.7).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 5
        return imageView
    }()

    private var albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()

    private var artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .left
        return label
    }()

    private var genresLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .gray
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private var copyrightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 0
        label.textColor = .gray
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()

    private var goToItunesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.setTitle("Go to iTunes", for: .normal)
        button.addTarget(self, action: #selector(goToiTunes), for: .touchUpInside)
        return button
    }()

    init(viewModel: AlbumDetailsViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .white
        addSubviews(scrollView, goToItunesButton)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addSubviews(albumNameLabel, artistNameLabel, genresLabel, copyrightLabel, albumImage)
        configure()
        applyConstraints()
    }

    private func configure() {
        if let imageUrl = viewModel.imageURL {
            albumImage.kf.setImage(with: imageUrl)
        }
        albumNameLabel.text = viewModel.albumName
        artistNameLabel.text = viewModel.artistName
        genresLabel.text = viewModel.genres
        copyrightLabel.text = viewModel.copyright
    }

    private func applyConstraints() {
        scrollView.snp.makeConstraints {
            make in
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(goToItunesButton.snp.top).offset(-10)
        }

        scrollViewContainer.snp.makeConstraints {
            make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
        }

        albumImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(albumImage.snp.width)
            make.centerX.equalToSuperview()
        }

        copyrightLabel.snp.makeConstraints { make in
            make.top.equalTo(albumImage.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        albumNameLabel.snp.makeConstraints { make in
            make.top.equalTo(copyrightLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().inset(35)
            make.width.equalToSuperview().multipliedBy(0.7)
        }

        artistNameLabel.snp.makeConstraints { make in
            make.top.equalTo(albumNameLabel.snp.bottom).offset(3)
            make.leading.equalToSuperview().inset(35)
            make.width.equalToSuperview().multipliedBy(0.7)
        }

        genresLabel.snp.makeConstraints { make in
            make.top.equalTo(artistNameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(35)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }

        goToItunesButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin).inset(20)
            make.height.equalTo(45)
        }

    }

    @objc func goToiTunes() {
        viewModel.openITunes()
    }
}
