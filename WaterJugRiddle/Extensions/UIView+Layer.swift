import UIKit

// MARK: - This extension provides bridge to the view's layer properties.
// In fact this is simple IB compliant way of settings / getting those properties.
@IBDesignable extension UIView {

    /// The radius of view corners.
    @IBInspectable var cornerRadius: Float {
        set { layer.cornerRadius = CGFloat(newValue) }
        get { return Float(layer.cornerRadius) }
    }

    /// The color of the border.
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor }
        get { return layer.borderColor?.uiColor }
    }

    /// The width of the border.
    @IBInspectable var borderWidth: Float {
        set { layer.borderWidth = CGFloat(newValue) }
        get { return Float(layer.borderWidth) }
    }

}
