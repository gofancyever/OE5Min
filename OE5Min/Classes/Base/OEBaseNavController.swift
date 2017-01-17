//
//  OEBaseNavController.swift
//  OE5Min
//
//  Created by apple on 2016/12/11.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit

class OEBaseNavController: UINavigationController {
    
    let navDelegate  = OENavigationDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.subviews[0].alpha = 0
        self.delegate = navDelegate
    }

}
