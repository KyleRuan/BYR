//
//  ExamView.swift
//  BYR
//
//  Created by Jason on 6/13/16.
//  Copyright © 2016 KYLERUAN. All rights reserved.
//

import UIKit
import React

class ExamView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
  
 
//  props.
    override func layoutSubviews() {
    super.layoutSubviews()
    
    loadReact()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func loadReact () {
     var dic  = ["wo":"blue"]
    let rootView: RCTRootView = RCTRootView(bundleURL: NSURL(string: "http://localhost:8081/index.ios.bundle?platform=ios"),
                                            moduleName: "SimpleApp", initialProperties: dic, launchOptions: nil)
    

    addSubview(rootView)
    rootView.frame = self.bounds
  }
  

}
