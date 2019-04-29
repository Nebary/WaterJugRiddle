//
//  ViewController.swift
//  WaterJugRiddle
//
//  Created by Nabi Makhmudov on 4/29/19.
//  Copyright © 2019 Distillery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    @IBOutlet weak var xStepper: UIStepper!
    @IBOutlet weak var yStepper: UIStepper!
    @IBOutlet weak var zStepper: UIStepper!

    //PathFinders dependecy.
    var pathFinders = [PathFinder]()

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
        let xAmount = Int(xStepper.value)
        let yAmount = Int(yStepper.value)
        let zAmount = Int(zStepper.value)
        pathFinders.forEach {
            $0.findPath(xAmount, yAmount, zAmount) { path in
                print(path.map { $0.rawValue })
            }
        }
    }

}
