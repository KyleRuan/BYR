//
//  TopicListModelEnity.swift
//  BYR
//
//  Created by Jason on 15/12/21.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation
import SwiftyJSON
import Kingfisher

class TopicListModelEnity{

    var articles:Array<Topics> = []
    func cellInit(inout cell:TopicListTableViewCell,datasource:JSON?){
        guard let content = datasource else{
            return
        }
        let  topic = Topics.mj_objectWithKeyValues(content.dictionaryObject)
        articles.append(topic)
        cell.title.text = topic.title
        cell.userName.text = topic.user.user_name
        cell.board.text = topic.board_name
        cell.reply_count.text = "评论：\(topic.reply_count)"
        cell.post_time.text = FormmatterTime.NomalTime(topic.post_time)
        let faceurl = topic.user.face_url ?? ""
        let gender = topic.user.gender
        if let url = NSURL(string: faceurl) {
            if gender == "m" {
                cell.avatar.kf_setImageWithURL(url, placeholderImage: UIImage(named: "face_default_m"))
            } else{
                cell.avatar.kf_setImageWithURL(url, placeholderImage: UIImage(named: "face_default_m"))
            }
            cell.avatar.cornerRadius = cell.avatar.bounds.size.width/2
        }
    }

    func cellInit(inout cell:TopicListTableViewCell,article:Topics?){
        guard let topic = article else{
            return
        }
        articles.append(topic)
        cell.title.text = topic.title
        cell.board.text = topic.board_name
        cell.reply_count.text = "评论：\(topic.reply_count)"
        cell.post_time.text = FormmatterTime.NomalTime(topic.post_time)
        guard let userInfo = topic.user else {
            return
        }
        cell.userName.text = userInfo.user_name
        let faceurl = userInfo.face_url ?? ""
        let gender = userInfo.gender
        if let url = NSURL(string: faceurl) {
            if gender == "m" {
                cell.avatar.kf_setImageWithURL(url, placeholderImage: UIImage(named: "face_default_m"))
            } else{
                cell.avatar.kf_setImageWithURL(url, placeholderImage: UIImage(named: "face_default_m"))
            }
            cell.avatar.cornerRadius = cell.avatar.bounds.size.width/2
        }
    }
}