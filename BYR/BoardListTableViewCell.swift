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
  var model:BoardListModel=BoardListModel(){
    didSet{
      board.text = model.board
      boardManager.text = model.manager
      postToday.text = model.postToday
    }
  }

  class func cellWithTableView(tableView:UITableView)->BoardListTableViewCell {
    return tableView.dequeueReusableCellWithIdentifier("BoardList") as! BoardListTableViewCell
  }

  override func awakeFromNib() {
    super.awakeFromNib()
  }
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

}
