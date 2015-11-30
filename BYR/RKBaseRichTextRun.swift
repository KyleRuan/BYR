//
//  BaseRichTextRun.swift
//  BYR
//
//  Created by Jason on 15/11/28.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation


protocol RKBaseRichTextRun{
    func analyseText(text:NSString)->RKBaseAnalysedResult
    func drawRichText(analysed:RKBaseAnalysedResult)
    
}