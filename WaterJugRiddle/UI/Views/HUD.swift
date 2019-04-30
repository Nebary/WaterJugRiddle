import UIKit

class HUD: UIView {

    private static func existing() -> HUD? {
        guard let window = UIApplication.shared.keyWindow else { return nil }
        return window.subviews.first { $0 is HUD } as? HUD
    }

    private static func newInKeyWindow(hidden: Bool = false) -> HUD? {
        guard let window = UIApplication.shared.keyWindow else { return nil }
        hide()

        let view = HUD(frame: CGRect.zero)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.isHidden = hidden
        window.addFullsizeSubview(view)
        window.bringSubviewToFront(view)
        return view
    }

    static func showProgress() {
        guard let view = newInKeyWindow(hidden: true) else { return }

        let hud = UIView(frame: CGRect.zero)
        hud.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        view.addCenterSubview(hud, size: CGSize(width: 150, height: 150))
        hud.cornerRadius = 25

        let activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.startAnimating()
        hud.addCenterSubview(activity, size: CGSize.zero)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            existing()?.isHidden = false
        }
    }

    static func hide() {
        existing()?.removeFromSuperview()
    }

}
