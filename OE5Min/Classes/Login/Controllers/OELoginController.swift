//
//  OELoginController.swift
//  OE5Min
//
//  Created by apple on 2016/12/26.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit

class OELoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btn_weiboClick(_ sender: UIButton) {
        OENetWorking.shareNetWorking.login(platformType:.sina)
    }
    @IBAction func btn_QQClick(_ sender: UIButton) {
         OENetWorking.shareNetWorking.login(platformType:.QQ)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
