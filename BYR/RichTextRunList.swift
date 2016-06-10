//
//  RichTextRunFactory.swift
//  BYR
//
//  Created by Jason on 15/12/7.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation


//组合
class RichTextRunList:RKBaseRichTextRun{
  var runList:Array<RKBaseRichTextRun> = []
  var result:[RKBaseAnalysedResult] = []

  init(){}

  func add(run:RKBaseRichTextRun){
    runList.append(run)
  }

  func analyseText(inout text: NSString, entity: TopicModelEnity?) {
    for run in runList {
      run.analyseText(&text, entity: entity)
    }
  }

  func drawRichText( size: CGSize) -> [AnyObject] {
    var tmpArray:Array<AnyObject> = []
    for one in runList {
      tmpArray.appendContentsOf(one.drawRichText( size))
    }
    return  tmpArray
  }
}