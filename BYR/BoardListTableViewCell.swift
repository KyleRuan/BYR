//
//  BoardListTableViewCell.swift
//  BYR
//
//  Created by Jason on 16/1/23.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import UIKit

class BoardListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var board: UILabel!
    
    
    @IBOutlet weak var boardManager: UILabel!
    
    
    @IBOutlet weak var postToday: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         print("awakeFromNib")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
