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
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        avatar = RoundImageView()
//        title = UILabel()
//        userName = UILabel()
//        reply_count = UILabel()
//        board = UILabel()
        // Initialization code
        
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

//    init(_: Topicslist){
//        
//    }

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
