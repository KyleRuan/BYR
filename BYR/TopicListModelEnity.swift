//
//  TopicListModelEnity.swift
//  BYR
//
//  Created by Jason on 15/12/21.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation

class TopicListModelEnity{
    
    
    
//    func cellInit(inout cell:TopTenTopicTableViewCell,row:Int){
//        
//        if  !datasource.isEmpty{
//            let content = datasource[row]
//            cell.title.text = content["title"].stringValue
//            cell.board.text = content["board_name"].stringValue
//            cell.userName.text = content["user"]["id"].stringValue
//            cell.reply_count.text = "评论：\(content["reply_count"].stringValue)"
//            
//            let string_time = content["post_time"].stringValue
//            let Format = "MM/dd/HH:mm"
//            cell.post_time.text = FormmatterTime.NomalTime(string_time,Format: Format)
//            
//            let faceurl =  content["user"]["face_url"].stringValue
//            let gender = content["user"]["gender"].stringValue
//            
//            if let url = NSURL(string: faceurl) {
//                if gender == "m" {
//                    cell.avatar.kf_setImageWithURL(url, placeholderImage: UIImage(named: "face_default_m"))
//                } else{
//                    //                cell.avatar.kf_setImageWithURL(NSURL(string: faceurl)!, placeholderImage: UIImage(named: "face_default_f"))
//                    cell.avatar.kf_setImageWithURL(url, placeholderImage: UIImage(named: "face_default_m"))
//                }
//                
//                cell.avatar.cornerRadius = cell.avatar.bounds.size.width/2
//            }
//        }
//        
//    }
}