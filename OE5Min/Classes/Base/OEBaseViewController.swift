//
//  OEBaseViewController.swift
//  OE5Min
//
//  Created by apple on 2016/12/11.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit


protocol ControllerSetNavationItem {
    func leftItem(title:String,image:UIImage,handle:(_ item:UIBarButtonItem)->())
}


class OEBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        view.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.9960784314, blue: 1, alpha: 1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
