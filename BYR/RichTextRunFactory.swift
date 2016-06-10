//
//  RichTextRunFactory.swift
//  BYR
//
//  Created by Jason on 15/12/7.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation

class RichTextRunFactory{

    func createImageRun()->RKBaseRichTextRun {
        return RKImageRichTextRun()
    }

    func createUrlRun()->RKBaseRichTextRun{
        return RKURLRichTextRun()
    }

    func createEmojiRun() ->RKBaseRichTextRun{
        return RKEmojiRichTextRun()
    }
}