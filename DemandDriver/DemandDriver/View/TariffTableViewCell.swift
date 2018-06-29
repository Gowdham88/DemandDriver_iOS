//
//  TariffTableViewCell.swift
//  DemandDriver
//
//  Created by CZSM on 14/03/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit

class TariffTableViewCell: UITableViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var tariffLabel: UILabel!
    @IBOutlet weak var valueLabel1: UILabel!
    
    @IBOutlet weak var costLabel2: UILabel!
    @IBOutlet weak var costLabel1: UILabel!
    @IBOutlet weak var valueLabel2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
