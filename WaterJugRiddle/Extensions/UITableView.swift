import UIKit

extension UITableView {

    //Simple workaround for having additional space on top of grouped header.
    func nullifyHeader() {
        tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0.1, height: 0.1))
    }

}
