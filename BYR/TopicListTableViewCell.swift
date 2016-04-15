//
//  TopTenTopicTableViewCell.swift
//  BYR
//
//  Created by Jason on 15/10/22.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit

class TopicListTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: RoundImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var reply_count: UILabel!
    @IBOutlet weak var post_time: UILabel!
    @IBOutlet weak var board: UILabel!
    
    
    var topic:Topics = Topics(){
        didSet {
            title.text = topic.title
            board.text = topic.board_name
            post_time.text = FormmatterTime.NomalTime(topic.post_time)
            reply_count.text = "评论数 \(topic.reply_count)"
            
            guard let userInfo = topic.user else {
                return
            }
            userName.text = userInfo.user_name
            let faceurl = userInfo.face_url ?? ""
            let gender = userInfo.gender
            
            if let url = NSURL(string: faceurl) {
                if gender == "m" {
                    
                    avatar.kf_setImageWithURL(url, placeholderImage: UIImage(named: "face_default_m"))
                } else{
                    avatar.kf_setImageWithURL(url, placeholderImage: UIImage(named: "face_default_m"))
                }
                avatar.cornerRadius = avatar.bounds.size.width/2
            }

        }
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
