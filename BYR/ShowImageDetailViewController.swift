//
//  ShowImageDetailViewController.swift
//  BYR
//
//  Created by Jason on 16/2/6.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import UIKit
import JGProgressHUD


class ShowImageDetailViewController: UIViewController,UIGestureRecognizerDelegate {
    var imageView:ImageDisplayView! = ImageDisplayView(frame: UIScreen.mainScreen().bounds)
    var originImage:UIImage?
    var hub =  JGProgressHUD()
//    var tapGusture:UITapGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//    
//        imageView = ImageDisplayView(frame: CGRectInset(self.view.frame, 0, self.view.bounds.height/4))
         self.view.addSubview(imageView!)
        imageView.userInteractionEnabled = true
       let   tapGusture = UITapGestureRecognizer(target: self, action: Selector("tap"))
        tapGusture.numberOfTapsRequired = 1
        tapGusture.numberOfTouchesRequired = 1
//         tapGusture.delegate = self
        self.imageView.addGestureRecognizer(tapGusture)
        
//        tapGusture.delegate = self
        
        // tap gesture
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: nil)
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1 // fingures
        self.imageView.addGestureRecognizer(doubleTapRecognizer)
        
        let singleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ShowImageDetailViewController.handleSingleTap))
        singleTapRecognizer.numberOfTapsRequired = 1
        singleTapRecognizer.numberOfTouchesRequired = 1
        self.imageView.addGestureRecognizer(singleTapRecognizer)
        
        singleTapRecognizer.requireGestureRecognizerToFail(doubleTapRecognizer)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ShowImageDetailViewController.save(_:)))
        self.imageView.addGestureRecognizer(longPressRecognizer)
    }


    func handleSingleTap(){
           dismissViewControllerAnimated(true, completion: nil)
    }
    func save(sender:UILongPressGestureRecognizer){
        if sender.state == .Began{
            let alert = UIAlertController(title: "保存图片", message: "是否保存图片", preferredStyle: UIAlertControllerStyle.ActionSheet)
            let action = UIAlertAction(title: "保存图片", style: UIAlertActionStyle.Default, handler: { (_) -> Void in
                if let orign = self.originImage{
                    UIImageWriteToSavedPhotosAlbum(orign, self, #selector(ShowImageDetailViewController.imageSavedToPhotosAlbum(_:didFinishSavingWithError:contextInfo:)), nil)
                }else{
                    UIImageWriteToSavedPhotosAlbum(self.imageView.image!, self, #selector(ShowImageDetailViewController.imageSavedToPhotosAlbum(_:didFinishSavingWithError:contextInfo:)), nil)
                }

            })
            
            let cancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: { (_) -> Void in
                self.hub.dismiss()
            })
            alert.addAction(cancel)
            alert.addAction(action)
            self.presentViewController(alert, animated: true) { () -> Void in
                self.hub.showInView(self.view)
                self.hub.textLabel.text = "正在保存"
           
            }
            
            
        }
        
        
    
      
    }
    
    func imageSavedToPhotosAlbum(image:UIImage,didFinishSavingWithError:NSError,contextInfo:UnsafeMutablePointer<Void>) {
            self.hub.textLabel.text = "保存成功"
            self.hub.indicatorView = JGProgressHUDSuccessIndicatorView()
            self.hub.showInView(self.view)
            self.hub.dismissAfterDelay(1, animated: true)
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.hidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
