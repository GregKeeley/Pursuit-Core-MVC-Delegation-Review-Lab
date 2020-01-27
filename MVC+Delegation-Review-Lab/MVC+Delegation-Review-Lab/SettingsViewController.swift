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
    
    var fontSize = Double()
    var fontSizeDelegate: FontSize?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontSizeDelegate.de
    }
    

    func fontSizeChanged() {
        fontSizeLabel.text = "Font size: \(fontSize.rounded())"
    }
    func changeFontSize() {
        
    }
    
    @IBAction func fontSizeSlider(_ sender: UISlider) {
        fontSize = Double(sender.value)
        fontSizeChanged()

    }
    
    @IBAction func fontSizeStepper(_ sender: UIStepper) {
        fontSize = sender.value
        fontSizeChanged()

    }
    
}
