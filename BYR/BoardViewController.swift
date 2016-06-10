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

  @IBOutlet weak var sectionColletion: UICollectionView!
  var  selected = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    self.sectionColletion.delegate = self
    self.sectionColletion.dataSource = self
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


  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    selected = indexPath.row
    self.performSegueWithIdentifier(SEGUE_FROM_SECTION_TO_BOARDLIST, sender: self)
  }

  // MARK: - Navigation
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    if segue.identifier == SEGUE_FROM_SECTION_TO_BOARDLIST{
      let vc = segue.destinationViewController  as! BoardListViewController
      vc.selectedNum = "\(selected)"
    }
  }
}
