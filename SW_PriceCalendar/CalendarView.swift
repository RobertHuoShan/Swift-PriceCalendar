//
//  CalendarView.swift
//  SW_PriceCalendar
//
//  Created by 袁灿 on 2019/2/18.
//  Copyright © 2019年 火山. All rights reserved.
//

import UIKit

class CalendarView: UIView {

    var titleView : UIView!
    var bgView : UIView!
    var labTitle : UILabel!
    var btnPrevious : UIButton!
    var btnNext : UIButton!
    var listData : NSMutableArray!
    
    var labWidth : CGFloat!
    var currentMonth : Int!
    var currentYear : Int!
    
    var arrButton : NSMutableArray!
    var arrLab1 : NSMutableArray!
    var arrLab2 : NSMutableArray!
    var selectedItem : NSMutableArray!

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        titleView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 50))
        titleView.backgroundColor = UIColor.white
        self.addSubview(titleView)
        
        bgView = UIView.init(frame: CGRect(x: 10, y: 60, width: self.frame.size.width-20, height: self.frame.size.height-70))
        bgView.backgroundColor = UIColor.white
        bgView.layer.cornerRadius = 5
        bgView.layer.masksToBounds = true
        self.addSubview(bgView)
        
        labTitle = UILabel.init(frame: CGRect(x: 0, y: 10, width: 100, height: 30))
        labTitle.backgroundColor = UIColor.white
        labTitle.center = CGPoint(x: self.frame.size.width/2, y: 25)
        labTitle.textAlignment = NSTextAlignment.center
        labTitle.font = UIFont.systemFont(ofSize: 15)
        labTitle.textColor = UIColor.black
        self.addSubview(labTitle)
        
        btnPrevious = UIButton.init(frame: CGRect(x: 0, y: 0, width: 40, height: 50))
        btnPrevious.setImage(UIImage.init(named: "icon_left"), for: UIControl.State.normal)
        btnPrevious.addTarget(self, action: #selector(btnPreviousMonth(button:)), for: UIControl.Event.touchUpInside)
        self.addSubview(btnPrevious)
        
        btnNext = UIButton.init(frame: CGRect(x: self.frame.size.width-50, y: 0, width: 40, height: 50))
        btnNext.setImage(UIImage.init(named: "icon_right"), for: UIControl.State.normal)
        btnNext.addTarget(self, action: #selector(btnNextMonth(button:)), for: UIControl.Event.touchUpInside)
        self.addSubview(btnNext)
      
        arrButton = NSMutableArray.init()
        arrLab1 = NSMutableArray.init()
        arrLab2 = NSMutableArray.init()
        selectedItem = NSMutableArray.init()
        
        initWeekdayUI()
        
        initCalendarWeekUI()
        
        initData()
        reloadData()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initData()
    {
        currentMonth = NSDate.monthIndex(date: Date())
        currentYear = NSDate.yearIndex(date: Date())
        
        listData = NSMutableArray.init()
    }
    
    func initWeekdayUI()
    {
        let arrWeekDay = ["日","一","二","三","四","五","六"]
        
        labWidth = (bgView.frame.size.width-70)/7
        
        for i in 0...6 {
            
            let labWeekDay = UILabel.init(frame: CGRect(x: (labWidth+10)*CGFloat(i), y: 5, width: labWidth, height: 45))
            labWeekDay.textAlignment = NSTextAlignment.center
            labWeekDay.text = arrWeekDay[i]
            labWeekDay.font = UIFont.systemFont(ofSize: 15)
            
            if (i == 0 || i == arrWeekDay.count-1) {
                labWeekDay.textColor = UIColor.orange
            } else {
                labWeekDay.textColor = UIColor.black
            }
            bgView.addSubview(labWeekDay)
            
        }
    }
    
    func initCalendarWeekUI()
    {
        for i in 0...41 {
            
            let x : NSInteger = i % 7
            let y : NSInteger = i / 7
            
            let btnDay = UIButton.init(frame: CGRect(x: 5+CGFloat(x)*(labWidth+10), y: 50+CGFloat(y)*(labWidth+10)+3, width: labWidth, height: labWidth))
            btnDay.tag = i
            btnDay.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            btnDay.backgroundColor = UIColor.white
            btnDay.layer.cornerRadius = 3
            btnDay.layer.masksToBounds = true
            btnDay.addTarget(self, action: #selector(btnClick(button:)), for: UIControl.Event.touchUpInside)
            bgView.addSubview(btnDay)
            
            let lab1 = UILabel.init(frame: CGRect(x: 5+CGFloat(x)*(labWidth+10), y: 55+CGFloat(y)*(labWidth+10)+3, width: labWidth, height: (labWidth-10)/2))
            lab1.textColor = UIColor.black
            lab1.font = UIFont.systemFont(ofSize: 13)
            lab1.textAlignment = NSTextAlignment.center
            bgView.addSubview(lab1)
            
            let lab2 = UILabel.init(frame: CGRect(x: 5+CGFloat(x)*(labWidth+10), y: 55+CGFloat(y)*(labWidth+10)+20, width: labWidth, height: (labWidth-10)/2))
            lab2.textColor = UIColor.black
            lab2.font = UIFont.systemFont(ofSize: 13)
            lab2.textAlignment = NSTextAlignment.center
            bgView.addSubview(lab2)
            
            arrButton.add(btnDay)
            arrLab1.add(lab1)
            arrLab2.add(lab2)
            
        }
    }
    
    @objc func btnPreviousMonth(button:UIButton)
    {
        currentMonth -= 1
        if currentMonth < 1 {
            currentYear -= 1
            currentMonth = 12
        }
        reloadData()
    }
    
    @objc func btnNextMonth(button:UIButton)

    {
        currentMonth += 1
        if currentMonth > 12 {
            currentYear += 1
            currentMonth = 1
        }
        reloadData()
    }

    func reloadData()
    {
        let currentDate = NSDate.getDateWithYear(year: currentYear, month: currentMonth, day: 1)
        
        let firstDay = NSDate.getWeekdayOfDate(date: currentDate)
        let totalDays = NSDate.daysOfMonth(date: currentDate)
        
        var year = currentYear ?? 0
        var month = currentMonth ?? 0
        var day = 0
        
        //获取上个月的数据
        let preDate: Date
        if (currentMonth == 1) {
            preDate = NSDate.getDateWithYear(year: currentYear-1, month: 12, day: 1)
        } else {
            preDate = NSDate.getDateWithYear(year: currentYear, month: currentMonth-1, day: 1)
        }
        
        let preDays = totalDays
        
        labTitle.text = NSDate.stringWithFormat(format: "yyyy-MM", date:currentDate)
        
        for i in 0...41 {
            
            var model:CalendarModel = CalendarModel.init()
            model.index = i
            
            if (i < firstDay) {
                year = currentYear
                month = currentMonth - 1
                if (month < 1) {
                    month = 12
                    year = currentYear - 1
                }
                day = preDays+i-firstDay+1
                model = calendarModel(model: model, year: year, month: month, day: day, price: 100, isShow: false)
                
            } else if (i < totalDays + firstDay) { //当前月日期
                year = currentYear
                month = currentMonth
                day = i-firstDay+1
                model = calendarModel(model: model, year: year, month: month, day: day, price: 100, isShow: true)

                
            } else { // 下一个月日期
                year = currentYear
                month = currentMonth + 1
                if (month > 12) {
                    month = 1
                    year = currentYear + 1
                }
                model = calendarModel(model: model, year: year, month: month, day: day, price: 100, isShow: false)
            }
            
            if (selectedItem.count > 0) {
                for j in 0...selectedItem.count-1
                {
                    let selectModel = selectedItem[j] as! CalendarModel
                    if (model.yearInt == selectModel.yearInt && model.monthInt == selectModel.monthInt && model.dateInt == selectModel.dateInt)
                    {
                        model.isSelected = true
                        break
                    }
                }
            }
                        
            showOneDayOfCalendar(model: model)
            listData.add(model)
            
        }
        
    }
    
    //给CalendarModel赋值
    func calendarModel(model:CalendarModel, year:Int, month:Int, day:Int, price:Int, isShow:Bool) ->CalendarModel
    {
        model.yearInt = year
        model.monthInt = month
        model.dateInt = day
        model.addPrice = 100
        model.isShow = isShow
        model.date = NSDate.getDateWithYear(year: year, month: month, day: day)
        model.isToday = NSDate.isSameDay(date1: model.date ?? Date.init(), date2: Date.init())
        model.isPastDate = false
        return model
    }
    
    //显示某一天的日期
    func showOneDayOfCalendar(model:CalendarModel)
    {
        let btn = arrButton[model.index ?? 0] as! UIButton
        let lab1 = arrLab1[model.index ?? 0] as! UILabel
        let lab2 = arrLab2[model.index ?? 0] as! UILabel
        
        if (model.isShow == true) {
            if (model.isPastDate == false) {
                if (model.isSelected == true) {
                    btn.isEnabled = true
                    lab1.textColor = model.isToday ?? true ?  UIColor.red :  UIColor.white
                    lab2.textColor = UIColor.white
                    lab1.text = String(format: "%d", model.dateInt ?? 0)
                    lab2.text = String(format: "%d", model.addPrice ?? 0)
                    btn.backgroundColor = UIColor.orange

                } else {

                    btn.isEnabled = true
                    if (model.isToday == true) {
                        lab1.textColor = UIColor.red
                    } else {
                        lab1.textColor = UIColor.black
                    }
                    lab2.textColor = UIColor.orange
                    lab1.text = String(format: "%d", model.dateInt ?? 0)
                    lab2.text = String(format: "%d", model.addPrice ?? 0)
                    btn.backgroundColor = UIColor.white
                }

            } else {
                btn.isEnabled = false
                lab1.text = String(format: "%d", model.dateInt ?? 0)
                lab2.text = "0"
                lab1.textColor = UIColor.lightText
                lab2.textColor = UIColor.lightText
                btn.backgroundColor = UIColor.white
            }
        
        } else {
            btn.isEnabled = false
            lab1.textColor = UIColor.white
            lab2.textColor = UIColor.white
            btn.backgroundColor = UIColor.white
        }
    }
    
    //点击某一天
    @objc func btnClick(button:UIButton)
    {
        let model = listData[button.tag] as! CalendarModel
        if (model.isSelected == true) {
            model.isSelected = false
            selectedItem.remove(model)
        } else {
            model.isSelected = true
            selectedItem.add(model)
        }
        showOneDayOfCalendar(model: model)
    }

   
}
