//
//  OEBaseTableViewController.swift
//  OE5Min
//
//  Created by apple on 2016/12/11.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit

class OEBaseTableViewController: OEBaseViewController {

    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame, style: .plain)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        tableView.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
