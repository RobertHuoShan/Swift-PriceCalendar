//
//  PublicModel.swift
//  SW_PriceCalendar
//
//  Created by 袁灿 on 2019/3/6.
//  Copyright © 2019年 火山. All rights reserved.
//

import Foundation
import UIKit


public let COLOR:((Float,Float,Float,Float) -> UIColor ) = { (r: Float, g: Float , b: Float , a: Float ) -> UIColor in
    
    return UIColor.init(red: CGFloat(CGFloat(r)/255.0), green: CGFloat(CGFloat(g)/255.0), blue: CGFloat(CGFloat(b)/255.0), alpha: CGFloat(a))
    
}
