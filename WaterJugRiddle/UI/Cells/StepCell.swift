import UIKit

class StepCell: UITableViewCell {

    static let reuseId = "StepCell"

    @IBOutlet weak var stepLabel: UILabel!

    func apply(_ model: StepCellModel) {
        stepLabel.text = model.text
    }
    
}
