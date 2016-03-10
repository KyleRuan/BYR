//
//  PostTopicViewController.swift
//  BYR
//
//  Created by Jason on 16/3/8.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import UIKit

class PostTopicViewController: UIViewController,UITextViewDelegate ,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var inputTextField: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var imagePickCollectionView: UICollectionView!
    private var mediaImages = [UIImage]() {
        didSet {
            dispatch_async(dispatch_get_main_queue()) { [weak self] in
                self?.imagePickCollectionView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        
        
        imagePickCollectionView.registerNib(UINib(nibName: "FeedMediaAddCell", bundle: nil), forCellWithReuseIdentifier: "FeedMediaAddCell")
        imagePickCollectionView.registerNib(UINib(nibName: "FeedMediaCell", bundle: nil), forCellWithReuseIdentifier: "FeedMediaCell")
        
        imagePickCollectionView.dataSource = self
        imagePickCollectionView.delegate = self
        imagePickCollectionView.showsHorizontalScrollIndicator = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return mediaImages.count>1 ?mediaImages.count:1 ;

    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        case 0:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FeedMediaAddCell", forIndexPath: indexPath) as! FeedMediaAddCell
            return cell
            
        case 1:
           
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FeedMediaCell", forIndexPath: indexPath) as! FeedMediaCell
            if mediaImages.count > 1{
                let image = mediaImages[indexPath.item]
                
                cell.configureWithImage(image)
            }
            
            cell.hidden  = true 
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
//        return UICollectionViewCell()
    }
    
    
    @IBAction func dismissInputEdit(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        
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
