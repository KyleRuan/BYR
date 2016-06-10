//
//  TopicDetailTableViewCell.swift
//  BYR
//
//  Created by Jason on 15/11/2.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit

class TopicDetailTableViewCell: UITableViewCell {


  @IBOutlet weak var avatar: AvatarView!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var view: UIView!
  @IBOutlet weak var LIKE: UIImageView!
  @IBOutlet weak var number: UILabel!
  @IBOutlet weak var postTime: UILabel!
  var topicDetail:TopicModelEnity!{
    didSet{
      userName.text = topicDetail.userName
      postTime.text = topicDetail.postTime

      if topicDetail.number == "0" {
        number.text = "楼主"
      }else{
        number.text = "\(topicDetail.number)楼"
      }
      if let  url  = topicDetail.avatarUrl {
        avatar.kf_setImageWithURL(NSURL(string: url)!)
      }else{
        avatar.image = UIImage(named: "face_default_m")
      }
      avatar.userId = topicDetail.userName
      let  label = RichTextView(cell: self, entity: topicDetail)
      label.sizeToFit()
      let richview = label.Draw() as!  TYAttributedLabel
      self.view.subviews.last?.removeFromSuperview()
      self.view.addSubview(richview)
      self.view.sizeToFit()
      self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, richview.bounds.width, richview.bounds.height+self.avatar.bounds.height+self.LIKE.bounds.height+30)
      topicDetail.cellHeight = CGRectGetMaxY(self.bounds)
    }
  }

  class   func cellWidthTableView(tableView:UITableView) -> TopicDetailTableViewCell {
    let reuseID:String = "detailcell"
    var   cell = tableView.dequeueReusableCellWithIdentifier(reuseID) as? TopicDetailTableViewCell
    if cell == nil {
      cell = NSBundle.mainBundle().loadNibNamed("TopicDetailTableViewCell", owner: nil, options: nil)[0] as? TopicDetailTableViewCell
    }
    return cell!
  }

  override func awakeFromNib() {
    super.awakeFromNib()
  }
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  class func prepareForCell(inout cell:TopicDetailTableViewCell,entity:TopicModelEnity){
    if entity.number == "0" {
      cell.number.text = "楼主"
    }else{
      cell.number.text = "\(entity.number)楼"
    }
    cell.userName.text = entity.userName
    cell.postTime.text = entity.postTime
    if let  url  = entity.avatarUrl {
      cell.avatar.kf_setImageWithURL(NSURL(string: url)!)
    }else{
      cell.avatar.image = UIImage(named: "face_default_m")
    }
    let  label = RichTextView(cell: cell, entity: entity)
    label.sizeToFit()
    let richview = label.Draw() as!  TYAttributedLabel
    cell.bounds = CGRectMake(cell.bounds.origin.x, cell.bounds.origin.y, richview.bounds.width, richview.bounds.height+cell.avatar.bounds.height+cell.LIKE.bounds.height+30)
    cell.view.subviews.last?.removeFromSuperview()
    cell.view.addSubview(richview)
  }
}
