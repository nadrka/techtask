import UIKit
import SnapKit

extension UIView {
    func fillParent() {
        snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
    }

    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
