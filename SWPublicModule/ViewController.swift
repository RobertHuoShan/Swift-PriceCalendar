//
//  ViewController.swift
//  SWPublicModule
//
//  Created by 袁灿 on 2019/2/12.
//  Copyright © 2019年 火山. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let textField = UICommonCtrl.commonLineViewWithFrame(frame: CGRect(x: 10, y: 100, width: 200, height: 10), color: UIColor.red)
        self.view .addSubview(textField)
    }


}

