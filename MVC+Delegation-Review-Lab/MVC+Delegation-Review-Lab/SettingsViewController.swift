//
//  SettingsViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Gregory Keeley on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var fontSizeSlider: UISlider!
    
    @IBOutlet weak var fontSizeStepper: UIStepper!

    @IBOutlet weak var fontSizeLabel: UILabel!
    var fontSizeStr = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func fontSizeChanged() {
        fontSizeLabel.text = "Font size: \(fontSizeStr)"
    }

    
    @IBAction func fontSizeSlider(_ sender: UISlider) {
        fontSizeStr = Double(sender.value)
        fontSizeChanged()

    }
    
    @IBAction func fontSizeStepper(_ sender: UIStepper) {
        fontSizeStr = sender.value
        fontSizeChanged()

    }
    
}
