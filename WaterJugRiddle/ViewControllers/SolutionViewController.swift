//
//  ViewController.swift
//  WaterJugRiddle
//
//  Created by Nabi Makhmudov on 4/29/19.
//  Copyright © 2019 Distillery. All rights reserved.
//

import UIKit

class SolutionViewController: UIViewController {

    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var yButton: UIButton!
    @IBOutlet weak var zButton: UIButton!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    @IBOutlet weak var xStepper: UIStepper!
    @IBOutlet weak var yStepper: UIStepper!
    @IBOutlet weak var zStepper: UIStepper!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var emptyView: UIView!

    var pathFinders = [PathFinder]()
    var viewModel: SolutionViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        xStepper.value = UserDefaults.standard.xSize
        yStepper.value = UserDefaults.standard.ySize
        zStepper.value = UserDefaults.standard.zSize
        stepperValueChanged(self)
    }

    @IBAction func stepperValueChanged(_ sender: Any) {
        xLabel.text = String(Int(xStepper.value))
        yLabel.text = String(Int(yStepper.value))
        zLabel.text = String(Int(zStepper.value))
    }

    @IBAction func jugButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        let jugLetter = button == xButton ? "X" : (button == yButton ? "Y" : "Z")
        let stepper = button == xButton ? xStepper : (button == yButton ? yStepper : zStepper)
        let dialog = UIAlertController(
            editor: "\(jugLetter) Jug",
            message: "Set \(jugLetter) jug size",
            text: String(Int(stepper?.value ?? 0)),
            placeholder: "Jug size",
            saveTitle: "Set Size",
            saveHandler: { _, newValue in
                guard let newNumber = Double(newValue) else { return }
                stepper?.value = newNumber
                self.stepperValueChanged(self)
            },
            cancelHandler: { _ in })
        present(dialog, animated: true, completion: nil)
    }

    @IBAction func findSolutionTapped(_ sender: Any) {
        UserDefaults.standard.xSize = xStepper.value
        UserDefaults.standard.ySize = yStepper.value
        UserDefaults.standard.zSize = zStepper.value
        HUD.showProgress()
        viewModel = SolutionViewModel(xSize: xStepper.value,
                                      ySize: yStepper.value,
                                      zSize: zStepper.value,
                                      pathFinders: pathFinders) { [weak self] in
            HUD.hide()
            guard let self = self else { return }
            self.reloadData()
        }
    }

    func reloadData() {
        guard let model = viewModel else { return }
        tableView.backgroundView = model.cells.isEmpty ? emptyView : nil
        tableView.reloadData()
    }

}

extension SolutionViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cells.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: StepCell.reuseId) as? StepCell,
            let model = viewModel,
            indexPath.row < model.cells.count
            else {
                return UITableViewCell(style: .default, reuseIdentifier: nil)
            }
        cell.apply(model.cells[indexPath.row])
        return cell
    }

}
