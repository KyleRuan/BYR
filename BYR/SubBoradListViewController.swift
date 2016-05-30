//
//  SubBoradListViewController.swift
//  
//
//  Created by Jason on 5/24/16.
//
//

import UIKit

class SubBoradListViewController:UIViewController, UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    var dataModelSource:Array<BoardListModel> = []
    var selectedNum = ""
    var listTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let token = UserAngent.sharedInstance.getAccessToken()!
        APIClinet.sharedInstance.getSectionInfo(token, name:selectedNum , success: { (json) -> Void in
            let arr = json["board"]
            self.dataModelSource = BoardListModel.initWithArray(arr)
            self.tableView.reloadData()
            
        }) { (error) -> Void in
            print(error)
        }

        
        tableView.delegate = self
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModelSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = BoardListTableViewCell.cellWithTableView(tableView)
        cell.model = dataModelSource[indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
      
                
                let name = dataModelSource[indexPath.row].name
                listTitle = dataModelSource[indexPath.row].board
                selectedNum  = name
                self.performSegueWithIdentifier(SEGUE_FROM_SECTION_T0_TOPICLIST, sender: self)
                return
        
            
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "子分区"
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == SEGUE_FROM_SECTION_T0_TOPICLIST{
            let vc = segue.destinationViewController  as! TopicListModelController
            vc.type = selectedNum
            vc.thread = "board"
            vc.title = listTitle
        }
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
