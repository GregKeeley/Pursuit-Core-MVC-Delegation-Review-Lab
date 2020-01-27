//
//  PersistenceHelper.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Gregory Keeley on 1/26/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

protocol FontSizeDelegate: AnyObject {
    func changeFontSize()
}

class FontSize <T> {
    weak var delegate: FontSizeDelegate?
    func changeFontSize(size: Int, label: UILabel) {
        label.font.withSize(CGFloat(size))
    }
    
}
