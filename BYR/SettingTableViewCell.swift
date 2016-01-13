//
//  SettingTableViewCell.swift
//  BYR
//
//  Created by Jason on 15/11/3.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
   
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
