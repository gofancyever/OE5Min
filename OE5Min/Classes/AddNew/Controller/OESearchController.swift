//
//  OESearchController.swift
//  OE5Min
//
//  Created by gaof on 2017/2/13.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit

class OESearchController: OEBaseTableViewController {

    @IBOutlet var customView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    @IBAction func btn_closeClick(_ sender: UIButton) {
        print("====")
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btn_trueClick(_ sender: UIButton) {
        
    }
  

}
