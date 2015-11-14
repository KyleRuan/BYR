//
//  TopicDetailTableViewCell.swift
//  BYR
//
//  Created by Jason on 15/11/2.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit

class TopicDetailTableViewCell: UITableViewCell {

   
    @IBOutlet weak var avatar: RoundImageView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var LIKE: UILabel!
   
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var postTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization co
//        self.bounds = UIScreen.mainScreen().bounds
       
    
        
         }

  
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
}
