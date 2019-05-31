//
//  GhibliCell.swift
//  Ghibli
//
//  Created by Bryan van Lierop on 31/05/2019.
//  Copyright © 2019 Ylja van Son. All rights reserved.
//

import UIKit

class GhibliCell: UITableViewCell {

    @IBOutlet weak var ghibliTitleLabel: UILabel!
    @IBOutlet weak var ghibliDescriptionLabel: UILabel!
    @IBOutlet weak var ghibliScoreLabel: UILabel!
    
    func setGhibli(model: Ghibli) {
        ghibliTitleLabel.text = model.title
        ghibliDescriptionLabel.text = model.description
        ghibliScoreLabel.text = "RT-Score: \(model.rating)"
    }
}
