//
//  CalendarVC.swift
//  SW_PriceCalendar
//
//  Created by 袁灿 on 2019/2/18.
//  Copyright © 2019年 火山. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "价格日历"
        
        let labWidth = (self.view.frame.width-70)/7
        
        let calendarView : CalendarView = CalendarView.init(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: (labWidth+10)*6+60+50))
        self.view.addSubview(calendarView)

    }

}
