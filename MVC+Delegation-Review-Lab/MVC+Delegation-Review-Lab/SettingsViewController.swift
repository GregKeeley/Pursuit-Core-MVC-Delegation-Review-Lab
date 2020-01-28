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
    @IBOutlet weak var fontSizeLabel: UILabel! {
        didSet {
            fontSizeLabel.font.withSize(currentFontSize)
        }
    }
    weak var fontSizeDelegate: FontSizeDelegate?

    var currentFontSize = CGFloat(17) {
        didSet {
            fontSizeDelegate?.changeFontSize(currentFontSize)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontSizeChanged(value: currentFontSize)
    }

    func fontSizeChanged(value: CGFloat) {
        fontSizeDelegate?.changeFontSize(CGFloat(currentFontSize))
        currentFontSize = value
        fontSizeLabel.text = "Font size: \(value.rounded())"
        fontSizeSlider.value = Float(currentFontSize)
        fontSizeStepper.value = Double(currentFontSize)
    }
    
    @IBAction func fontSizeSlider(_ sender: UISlider) {
        currentFontSize = CGFloat(sender.value)
        fontSizeChanged(value: CGFloat(sender.value))

    }
    
    @IBAction func fontSizeStepper(_ sender: UIStepper) {
        currentFontSize = CGFloat(sender.value)
        fontSizeChanged(value: CGFloat(sender.value))

    }
    
}
