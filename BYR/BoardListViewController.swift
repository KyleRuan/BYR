//
//  BoardListViewController.swift
//  BYR
//
//  Created by Jason on 15/11/23.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit
import SwiftyJSON
import JGProgressHUD

class BoardListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    var  sub_section:Array<JSON> = []
    var subModelSource:Array<BoardListModel> = []
    var dataModelSource:Array<BoardListModel> = []
    var  boards:Array<Board> = []
    var  selectedNum:String!
    var listTitle:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        let token = UserAngent.sharedInstance.getAccessToken()!
        APIClinet.sharedInstance.getSectionInfo(token, name:selectedNum , success: { (json) -> Void in
            if !json["sub_section"].isEmpty{
                self.sub_section.append(json["sub_section"])
                self.subModelSource = BoardListModel.initWithArray(json["sub_section"])
            }
            let arr = json["board"]
            self.dataModelSource = BoardListModel.initWithArray(arr)
            self.tableview.reloadData()

        }) { (error) -> Void in
            print(error)
        }
        if tableview != nil {
            tableview.delegate = self
            tableview.dataSource = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if !sub_section.isEmpty {
                return sub_section[0].count
            }
            if !dataModelSource.isEmpty {
                return dataModelSource.count
            }
            return 0
        }
        return dataModelSource.count
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sub_section.count == 1 ? 2:1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = BoardListTableViewCell.cellWithTableView(tableView)
        cell.model = dataModelSource[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        title = dataModelSource[indexPath.row].board
        if sub_section.isEmpty{
            //没有子分区，那么就直接跳到文章页面
            let name = dataModelSource[indexPath.row].name
            listTitle = dataModelSource[indexPath.row].board
            selectedNum  = name
            self.performSegueWithIdentifier(SEGUE_FROM_SECTION_T0_TOPICLIST, sender: indexPath.row)
            return
        }else{
            //有子分区，则看idnexpath
            if indexPath.section == 0{
                let name = "\(sub_section[0][indexPath.row])"
                selectedNum  = name
                self.performSegueWithIdentifier(SEGUE_FROM_SECTION_TO_SUBSECTION, sender: self)
                return
            } else {
                let name = dataModelSource[indexPath.row].name
                listTitle = dataModelSource[indexPath.row].board
                selectedNum  = name
                self.performSegueWithIdentifier(SEGUE_FROM_SECTION_T0_TOPICLIST, sender: self)
                return
            }
        }
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if sub_section.isEmpty{
            return "版面列表"
        }else{
            if section == 0{
                return "子分区"
            }else{
                return "版面列表"
            }
        }
    }
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == SEGUE_FROM_SECTION_TO_SUBSECTION{
            let vc = segue.destinationViewController  as! SubBoradListViewController
            vc.selectedNum = "\(selectedNum)"
            vc.title = listTitle
        }
        if segue.identifier == SEGUE_FROM_SECTION_T0_TOPICLIST{
            let vc = segue.destinationViewController  as! TopicListModelController
            vc.type = selectedNum
            vc.thread = "board"
            vc.title = listTitle
        }
    }
}
