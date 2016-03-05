//
//  BoardViewController.swift
//  BYR
//
//  Created by Jason on 15/11/20.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit
import SwiftyJSON
class BoardViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   
    @IBOutlet weak var boardCollection: UICollectionView!
    @IBOutlet weak var sectionColletion: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sectionColletion.delegate = self
        self.sectionColletion.dataSource = self

        
        
             

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
          return    1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCellWithReuseIdentifier(REUSE_IDENTIFIER_FOR_BOARD_CELL, forIndexPath: indexPath) as! BoardCollectionViewCell
        if let image = UIImage(named: "Section\(indexPath.row)"){
        cell.sectionImage.image = image
        }
        return cell
    }
    
//    var views =  UIView()
    @IBAction func segmentValueChanged(sender: UISegmentedControl) {
      
        switch sender.selectedSegmentIndex{
        case 0 :
            self.view.addSubview(self.boardCollection)
            print(0)
        case  1 :
            self.view.addSubview(self.sectionColletion)
            print(1)
        case 2 :
            print(2)
        default:
            print("error")
        }
    }
    
    
//    /section/:name.(xml|json)
 
    

  var  selected = 0
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
             selected = indexPath.row
        self.performSegueWithIdentifier(SEGUE_FROM_SECTION_TO_BOARDLIST, sender: self)
//            let vc = BoardListViewController()s
//        vc.selectedNum = indexPath.row
//        vc.tableview = UITableView(frame: self.view.frame)
//        self.navigationController?.pushViewController(vc, animated: true)
        
          }
    
    
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        if segue.identifier == SEGUE_FROM_SECTION_TO_BOARDLIST{
        
            let vc = segue.destinationViewController  as! BoardListViewController
             vc.selectedNum = "\(selected)"
            
//            let dd = self.collectionview
//            vc.selectedNum =
        
          
    
    }
    
    }
}
