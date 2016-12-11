//
//  OEWeiboController.swift
//  OE5Min
//
//  Created by apple on 2016/12/9.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit
let cellHome = "OEWeiboCell"
class OEWeiboController: UIViewController {

    var tableView:UITableView = {
        let tableView = UITableView(frame: CGRect.init(), style: .plain)
        tableView.register(UINib.init(nibName: cellHome, bundle: nil), forCellReuseIdentifier: cellHome)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(tableView)
        tableView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.snp.makeConstraints { (make) in
            make.height.equalTo(kScreenHeight*0.5)
            make.width.equalTo(kScreenWidth)
            make.center.equalTo(self.view)
        }

    }

}
extension OEWeiboController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellHome)
        cell?.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
extension OEWeiboController: UITableViewDelegate {
    
}
