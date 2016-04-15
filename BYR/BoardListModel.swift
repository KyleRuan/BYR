//
//  BoardListModel.swift
//  BYR
//
//  Created by Jason on 4/15/16.
//  Copyright © 2016 KYLERUAN. All rights reserved.
//

import UIKit
import SwiftyJSON


class BoardListModel{
    var board:String!
    var manager:String!
    var postToday:String!
    var accessoryType:UITableViewCellAccessoryType!
    var description:String!
    var name :String!
    
    
    convenience init(json:JSON){
       self.init()
        accessoryType = UITableViewCellAccessoryType.None
        manager = "版主：\(json["manager"].stringValue)"
        let threads_today_count = json["threads_today_count"].stringValue
        if threads_today_count  != "0"{
            postToday = "今日发帖数：\(threads_today_count)"
        }
        board = json["description"].stringValue

      name =  json["name"].stringValue
    
    }
    
    
    class   func initWithArray(jsonArray:JSON)->[BoardListModel]{
        var arr:Array<BoardListModel> = []
        for json in jsonArray.arrayValue{
            let item = BoardListModel(json: json)
           arr.append(item)
        }
        
        return arr
        
    }

    
    
    
    init(){
//    super.init()
    }
    

    
     func boardWithJSON(json:JSON)->BoardListModel{
        accessoryType = UITableViewCellAccessoryType.None
        manager = "版主：\(json["manager"].stringValue)"
        let threads_today_count = json["threads_today_count"].stringValue
        if threads_today_count  != "0"{
            postToday = "今日发帖数：\(threads_today_count)"
        }
        
        
        board = json["description"].stringValue
     
        
        return self
    }
    
}