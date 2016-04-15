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
    
    
//    
//  convenience  init(tableView:UITableView){
////        self.init?(coder  NSCoder)
//    
//   self.init(style: UITableViewCellStyle.Default, reuseIdentifier: "BoardList")
//    
//      self = tableView.dequeueReusableCellWithIdentifier("BoardList") as! BoardListTableViewCell
////      return cell
//    
//    }
//    
//    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: "BoardList")
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//       super.init(coder: aDecoder)
//    }
//    
   
    class func cellWithTableView(tableView:UITableView)->BoardListTableViewCell {
       return tableView.dequeueReusableCellWithIdentifier("BoardList") as! BoardListTableViewCell
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         print("awakeFromNib")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
