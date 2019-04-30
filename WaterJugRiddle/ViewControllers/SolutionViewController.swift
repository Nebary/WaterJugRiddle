//
//  ViewController.swift
//  WaterJugRiddle
//
//  Created by Nabi Makhmudov on 4/29/19.
//  Copyright © 2019 Distillery. All rights reserved.
//

import UIKit

class SolutionViewController: UIViewController {

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    @IBOutlet weak var xStepper: UIStepper!
    @IBOutlet weak var yStepper: UIStepper!
    @IBOutlet weak var zStepper: UIStepper!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var emptyView: UIView!
    
    //PathFinders dependecy.
    var pathFinders = [PathFinder]()
    var viewModel: SolutionViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func stepperValueChanged(_ sender: Any) {
        guard let stepper = sender as? UIStepper else { return }
        let text = String(Int(stepper.value))
        if stepper == xStepper {
            xLabel.text = text
        } else if stepper == yStepper {
            yLabel.text = text
        } else {
            zLabel.text = text
        }
    }

    @IBAction func findSolutionTapped(_ sender: Any) {
        viewModel = SolutionViewModel(xSize: xStepper.value,
                                      ySize: yStepper.value,
                                      zSize: zStepper.value,
                                      pathFinders: pathFinders) { [weak self] in
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
