//
//  NSDate+Helper.swift
//  SW_PriceCalendar
//
//  Created by 袁灿 on 2019/2/26.
//  Copyright © 2019年 火山. All rights reserved.
//

import Foundation
import UIKit

extension NSDate {
    
   class func stringWithFormat(format:String, date:Date) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    class func yearIndex(date:Date) -> Int
    {
        let calendar = Calendar.current
        let components = calendar.dateComponents(in: NSTimeZone.local, from: date)
        return components.year!
    }
    
    class func monthIndex(date:Date) -> Int
    {
        let calendar = Calendar.current
        let components = calendar.dateComponents(in: NSTimeZone.local, from: date)
        return components.month!
    }
    
    class func daysOfMonth(date:Date) -> Int
    {
        let calendar = Calendar.current
        let range = calendar.range(of: Calendar.Component.day, in: Calendar.Component.month, for: date)
        return (range?.count)!
    }
    
    class func getWeekdayOfDate(date:Date) -> Int
    {
        let calendar = Calendar.current
        let components = calendar.dateComponents(in: NSTimeZone.local, from: date)
        return components.weekday!-1 //从星期日开始，也就是星期天是1 星期一是2 ……星期六是7
    }
    
    class func isSameDay(date1:Date, date2:Date) -> Bool
    {
        let calendar = Calendar.current
        let components1 = calendar.dateComponents(in: NSTimeZone.local, from: date1)
        let components2 = calendar.dateComponents(in: NSTimeZone.local, from: date2)

        return components1.year == components2.year && components1.month == components2.month && components1.day == components2.day
    }
    
    class func getDateWithYear(year:Int, month:Int, day:Int) -> Date
    {
        var components = DateComponents.init()
        components.year = year
        components.month = month
        components.day = day
        
        let calendar = Calendar.current
        let date = calendar.date(from: components)
        return date!
    }
    
   
}
