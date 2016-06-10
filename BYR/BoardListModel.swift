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
    let str = json["manager"].stringValue
    manager = "版主：\(str)"
    let threads_today_count = json["threads_today_count"].stringValue
    print(threads_today_count)
    if threads_today_count  !=  "0"{
      postToday = "今日发帖数：\(threads_today_count)"
    }
    board = json["description"].stringValue
    print(board)
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

  class  func initWithArray(jsonArray:JSON) ->[Board] {
    var boards:Array<Board>=[]
    for json in jsonArray.arrayValue{
      let board = Board.mj_objectWithKeyValues(json.dictionaryObject)
      boards.append(board)
    }

    return boards

  }

  func boardWithJSON(json:JSON)->BoardListModel{
    accessoryType = UITableViewCellAccessoryType.None
    let strManager = json["manager"].stringValue
    manager = "版主：\(strManager)"
    let threads_today_count = json["threads_today_count"].stringValue
    if threads_today_count  != "0"{
      postToday = "今日发帖数：\(threads_today_count)"
    }
    board = json["description"].stringValue
    return self
  }

}