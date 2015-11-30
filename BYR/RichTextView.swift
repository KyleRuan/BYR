//
//  RichTextView.swift
//  BYR
//
//  Created by Jason on 15/11/28.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit

class RichTextView: UIView {
    var runList:Array<RKBaseRichTextRun> = []
    
    init(cell:TopicDetailTableViewCell){
        super.init(frame: cell.frame)
        self.frame = cell.frame
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func textAnalyse(text:NSString){
        
    }
}
