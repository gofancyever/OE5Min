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
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //背景
        self.view.addSubview(animationView!)
        animationView?.contentMode = .scaleAspectFill
        animationView?.frame = self.view.frame
        animationView?.play(completion: { (finished) in
            
        })
        //Logo
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(70)
            make.height.equalTo(94)
        }
        imageView.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 1, options: .curveLinear, animations: { 
            imageView.alpha = 1
        }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    



}
