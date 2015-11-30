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
    @IBOutlet weak var LIKE: UIImageView!
   
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var postTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization co
//          self.bounds = UIScreen.mainScreen().bounds
       
    
        
         }

  ///
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
  class func prepareForCell(inout cell:TopicDetailTableViewCell,entity:TopicModelEnity){
//        if dataEntityArray.count == 0 {
//            return
//        }
//        let entity = dataEntityArray[row]
        if entity.number == "0" {
            cell.number.text = "楼主"
        }else{
            cell.number.text = "\(entity.number)楼"
        }
        
        let avatarURL = NSURL(string:entity.avatarUrl!)
        cell.avatar.kf_setImageWithURL(avatarURL!)
        cell.userName.text = entity.userName
        cell.postTime.text = entity.postTime
        
        let label = RichTextHandle.textAddToRichTextViewWithRegex(cell, entity: entity)
        
        label.sizeToFit()
        //        let aa =  attributedString.addAttributeFont(UIFont.systemFontOfSize(24))
        cell.bounds = CGRectMake(cell.bounds.origin.x, cell.bounds.origin.y, label.bounds.width, label.bounds.height+cell.avatar.bounds.height+cell.LIKE.bounds.height+30)
        
        let zz = label as! TYAttributedLabel
//        zz.delegate = self
//        
//        cell.view.delegate = self
        cell.view.subviews.last?.removeFromSuperview()
        cell.view.addSubview(zz)
        
        
        
        
    }

    
  
}
