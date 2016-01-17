//
//  FormatterTime.swift
//  BYR
//
//  Created by Jason on 15/11/3.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation


class FormmatterTime{
 
    static func NomalTime(unix:String,Format:String = "MM/dd/HH:mm")->String{
        
        let double_time = NSDate(timeIntervalSince1970: Double(unix)!)
        let dateFormatter = NSDateFormatter()
        //设定时间格式,这里可以设置成自己需要的格式
         dateFormatter.dateFormat = Format
        return dateFormatter.stringFromDate(double_time)
    }
}
