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
    var fontSize = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func fontSizeChanged() {
        fontSizeLabel.text = "Font size: \(fontSize)"
    }

    
    @IBAction func fontSizeSlider(_ sender: UISlider) {
       
    }
    
    @IBAction func fontSizeStepper(_ sender: UIStepper) {
        
    }
    
}
