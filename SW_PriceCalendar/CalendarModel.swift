//
//  CalendarModel.swift
//  SW_PriceCalendar
//
//  Created by 袁灿 on 2019/2/18.
//  Copyright © 2019年 火山. All rights reserved.
//

import UIKit

class CalendarModel: NSObject {
    
    var yearInt : Int?
    var monthInt : Int?
    var dateInt : Int?
    var addPrice : Int?
    
    var isSelected : Bool?
    var isToday : Bool?
    var isShow : Bool?
    var isDefaultMoney : Bool?
    var isPastDate : Bool?
    var index : Int?
    var date : Date?

}
