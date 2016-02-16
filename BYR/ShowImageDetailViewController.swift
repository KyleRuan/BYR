//
//  ShowImageDetailViewController.swift
//  BYR
//
//  Created by Jason on 16/2/6.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import UIKit

class ShowImageDetailViewController: UIViewController {
    var imageView:ImageDisplayView!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = ImageDisplayView(frame: self.view.frame)
         self.view.addSubview(imageView)
        // Do any additional setup after loading the view.
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
