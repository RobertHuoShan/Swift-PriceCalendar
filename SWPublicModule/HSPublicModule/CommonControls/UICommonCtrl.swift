//
//  UICommonCtrl.swift
//  SWPublicModule
//
//  Created by 袁灿 on 2019/2/12.
//  Copyright © 2019年 火山. All rights reserved.
//  创建常用控件辅助类

import UIKit

class UICommonCtrl: NSObject {
    
    class func commonTextFieldWithFrame(frame:CGRect, placeholder:String, color:UIColor,font:UIFont, secureTextEntry:Bool) -> UITextField
    {
        let textField = UITextField.init(frame: frame)
        textField.placeholder = placeholder
        textField.textColor = color
        textField.font = font
        textField.isSecureTextEntry = secureTextEntry
        
        return textField
    }
    
    class func commonLabelWithFrame(frame:CGRect, text:String, color:UIColor, font:UIFont, textAlignment:NSTextAlignment) -> UILabel
    {
        let label = UILabel.init(frame: frame)
        label.text = text
        label.textColor = color
        label.font = font
        label.textAlignment = textAlignment
        
        return label
    }
    
    class func commonTextViewWithFrame(frame:CGRect, text:String, color:UIColor, font:UIFont, textAlignment:NSTextAlignment) -> UITextView
    {
        let textView = UITextView.init(frame: frame)
        textView.text = text
        textView.textColor = color
        textView.font = font
        textView.textAlignment = textAlignment

        return textView
    }
    
    class func commonButtonWithFrame(frame:CGRect, image:UIImage, target:Any, action:Selector) -> UIButton
    {
        let btn = UIButton.init(frame: frame)
        btn.setImage(image, for: UIControl.State.normal)
        btn.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        
        return btn
    }
    
    class func commonButtonWithFrame(frame:CGRect, text:String, color:UIColor, font:UIFont, backgroundImage:UIImage, target:Any, action:Selector) -> UIButton
    {
        let btn = UIButton.init(frame: frame)
        btn.setTitle(text, for: UIControl.State.normal)
        btn.setTitleColor(color, for: UIControl.State.normal)
        btn.titleLabel?.font = font
        btn.setBackgroundImage(backgroundImage, for: UIControl.State.normal)
        btn.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        
        return btn
    }
    
    class func commonLineViewWithFrame(frame:CGRect, color:UIColor) -> UIView
    {
        let line = UIView.init(frame: frame)
        line.backgroundColor = color
        
        return line
    }
    
    class func commonViewWithFrame(frame:CGRect, color:UIColor) -> UIView
    {
        let view = UIView.init(frame: frame)
        view.backgroundColor = color
        
        return view
    }

}
