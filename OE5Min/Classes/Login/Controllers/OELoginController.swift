//
//  OELoginControllerViewController.swift
//  OE5Min
//
//  Created by gaof on 2017/2/5.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit
import Lottie
class OELoginController: UIViewController {

     let animationView = LAAnimationView.animationNamed("login_anim.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(animationView!)
        animationView?.contentMode = .scaleAspectFill
        animationView?.frame = self.view.frame
        animationView?.play(completion: { (finished) in
            
        })

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    



}
