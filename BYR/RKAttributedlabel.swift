

//
//  RKAttributedlabel.swift
//  BYR
//
//  Created by Jason on 16/1/25.
//  Copyright © 2016年 KYLERUAN. All rights reserved.
//

import Foundation


class RKAttributedlabel:TYAttributedLabel {
    var type:RKRichTextRunType?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}