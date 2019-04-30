import UIKit

class StepCell: UITableViewCell {

    static let reuseId = "StepCell"

    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var xView: UIView!
    @IBOutlet weak var yView: UIView!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var xHeight: NSLayoutConstraint!
    @IBOutlet weak var yHeight: NSLayoutConstraint!

    func apply(_ model: StepCellModel) {
        stepLabel.text = model.text
        xLabel.text = String(model.xAmount)
        yLabel.text = String(model.yAmount)

        var percentage = CGFloat(model.xAmount) / CGFloat(model.xSize)
        xHeight.constant = xView.bounds.height * percentage
        percentage = CGFloat(model.yAmount) / CGFloat(model.ySize)
        yHeight.constant = yView.bounds.height * percentage
    }

}
