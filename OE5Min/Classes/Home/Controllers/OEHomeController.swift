//
//  OEHomeController.swift
//  OE5Min
//
//  Created by gaof on 2017/2/6.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit
import RxSwift
class OEHomeController: OEBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initSubViews()
        initConstraints()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func initSubViews(){
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func initConstraints(){
        
    }
    

}
extension OEHomeController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell")
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
