////
////  BoardsCollectionViewController.swift
////  BYR
////
////  Created by Jason on 15/11/17.
////  Copyright © 2015年 KYLERUAN. All rights reserved.
////
//
//import UIKit
//
//private let reuseIdentifier = "Cell"
//
//class BoardsCollectionViewController: UICollectionViewController {
//    
////    http://bbs.byr.cn/open/section.json?oauth_token=3140fd026627ac9fba09e638794c4dc4
//
//    @IBOutlet weak var segments: UISegmentedControl!
//   
//    var datasource = ["本站站务","北邮校园","学术科技","信息社会","人文艺术","生活时尚","休闲娱乐","体育健身","游戏对战","乡亲乡爱"]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let token = UserAngent.sharedInstance.getAccessToken()
//        
//        APIClinet.sharedInstance.getSectionInfo(token!, success: { (json) -> Void in
//            
//            
//            }) { (error) -> Void in
//                print(error)
//        }
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Register cell classes
////        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//    // MARK: UICollectionViewDataSource
//
//    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 10
//    }
//
//
//    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 1
//    }
//
//    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(REUSE_IDENTIFIER_FOR_BOARD_CELL, forIndexPath: indexPath) as!  BoardCollectionViewCell
//        cell.sectionImage.image = UIImage()
//        // Configure the cell
//    
//        return cell
//    }
//
//    // MARK: UICollectionViewDelegate
//
//    /*
//    // Uncomment this method to specify if the specified item should be highlighted during tracking
//    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment this method to specify if the specified item should be selected
//    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
//    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return false
//    }
//
//    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
//        return false
//    }
//
//    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
//    
//    }
//    */
//
//}
