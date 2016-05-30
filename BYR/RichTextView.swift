

//  RichTextView.swift
//  BYR
//
//  Created by Jason on 15/11/28.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import UIKit

class RichTextView: UIView ,TYAttributedLabelDelegate{
    var text:NSString!
    var entity:TopicModelEnity!
    var cell:TopicDetailTableViewCell!
    let bsRun = RichTextRunList()
    init(cell:TopicDetailTableViewCell,entity:TopicModelEnity){
        super.init(frame: cell.frame)
        self.cell = cell
        self.entity = entity
        self.text = entity.content as NSString
         bsRun.add(RichTextRunFactory().createUrlRun())
        bsRun.add(RichTextRunFactory().createImageRun())
    
        bsRun.add(RichTextRunFactory().createEmojiRun())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func Draw()->UIView{
        
//        let size = CGSizeMake(UIScreen.mainScreen().bounds.width-5,378*(cell.bounds.width)/600)
        let size = CGSizeMake(375*self.cell.frame.width/600, self.cell.frame.height/2)
        
        bsRun.analyseText(&text!, entity: entity)
        var tmpArray = bsRun.drawRichText(size)
        
        let  attStringCreater = TYTextContainer()
        attStringCreater.lineBreakMode = CTLineBreakMode.ByCharWrapping
        attStringCreater.text = text as String
        
        let label = TYAttributedLabel(frame: CGRectMake(0,0,CGRectGetWidth(cell.frame),0))
//        label.delegate = self
        attStringCreater.addTextStorageArray(tmpArray)
        attStringCreater.createTextContainerWithTextWidth(UIScreen.mainScreen().bounds.width-5)
        label.textContainer = attStringCreater
        label.sizeToFit()

        tmpArray.removeAll()
        return label
        
    }
    
    


    
    
    
    
    
}
