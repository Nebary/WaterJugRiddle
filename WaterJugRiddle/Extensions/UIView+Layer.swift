import UIKit

// MARK: - This extension provides bridge to the view's layer properties.
// In fact this is simple IB compliant way of settings / getting those properties.
@IBDesignable extension UIView {

    /// The color of the shadow.
    @IBInspectable var shadowColor: UIColor? {
        set { layer.shadowColor = newValue?.cgColor }
        get { return layer.shadowColor?.uiColor }
    }

    /// The opacity of the shadow.
    @IBInspectable var shadowOpacity: Float {
        set { layer.shadowOpacity = newValue }
        get { return layer.shadowOpacity }
    }

    /// The offset (in points) of the shadow.
    @IBInspectable var shadowOffset: CGPoint {
        set { layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y) }
        get { return CGPoint(x: layer.shadowOffset.width, y: layer.shadowOffset.height) }
    }

    /// The blur radius (in points) used to render the shadow.
    @IBInspectable var shadowRadius: CGFloat {
        set { layer.shadowRadius = newValue }
        get { return layer.shadowRadius }
    }

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
