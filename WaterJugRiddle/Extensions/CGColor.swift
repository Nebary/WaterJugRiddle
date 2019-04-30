import UIKit

extension CGColor {

    /// Simply converts to UIColor.
    var uiColor: UIColor {
        return UIColor(cgColor: self)
    }

}
