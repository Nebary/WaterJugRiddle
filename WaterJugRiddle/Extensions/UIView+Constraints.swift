import UIKit

extension UIView {

    /// Adds subview and aligns it to fit entire view.
    ///
    /// - Parameter view: UIView to add as subview.
    func addFullsizeSubview(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(view.leftAnchor.constraint(equalTo: leftAnchor))
        addConstraint(view.topAnchor.constraint(equalTo: topAnchor))
        addConstraint(view.widthAnchor.constraint(equalTo: widthAnchor))
        addConstraint(view.heightAnchor.constraint(equalTo: heightAnchor))
    }

    /// Adds subview and aligns it to the center of view.
    ///
    /// - Parameters:
    ///   - view: UIView to add as subview.
    ///   - size: Size of the adding subview.
    func addCenterSubview(_ view: UIView, size: CGSize) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(view.centerXAnchor.constraint(equalTo: centerXAnchor))
        addConstraint(view.centerYAnchor.constraint(equalTo: centerYAnchor))
        addConstraint(view.widthAnchor.constraint(equalToConstant: size.width))
        addConstraint(view.heightAnchor.constraint(equalToConstant: size.height))
    }

}
