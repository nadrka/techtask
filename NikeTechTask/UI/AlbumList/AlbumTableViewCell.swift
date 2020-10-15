import UIKit
import Kingfisher

class AlbumTableViewCell: UITableViewCell {
    static let reusableIdentifier = "AlbumTableViewCell"

    private var albumImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()

    private var albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Album"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private var artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "Name"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubviews(albumImage, albumNameLabel, artistNameLabel)
        applyConstraints()
    }

    private func applyConstraints() {
        albumImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(55)
        }

        albumNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(albumImage.snp.trailing).offset(15)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview().offset(-10)
            make.top.equalToSuperview().inset(20)
        }

        artistNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(albumNameLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(albumNameLabel.snp.bottom).offset(2)
            make.bottom.equalToSuperview().inset(20)
        }
    }

    func configure(with album: Album) {
        if let imageUrl = URL(string: album.artworkUrl100) {
            albumImage.kf.setImage(with: imageUrl)
        }
        albumNameLabel.text = album.name
        artistNameLabel.text = album.artistName
    }
}
