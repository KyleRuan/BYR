//
//  BaseRichTextRun.swift
//  BYR
//
//  Created by Jason on 15/11/28.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation

 protocol RKBaseRichTextRun{
    
    func analyseText(inout text:NSString,entity:TopicModelEnity?)
    func drawRichText(size:CGSize)->[AnyObject]
}