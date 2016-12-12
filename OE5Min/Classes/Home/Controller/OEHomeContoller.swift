//
//  OEHomeContoller.swift
//  OE5Min
//
//  Created by gaof on 2016/12/8.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit


let sectionHeaderHeight:CGFloat = 44
let cellColor:UIColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
class OEHomeContoller: OEBaseTableViewController {
    
    lazy var headerView: OEHeaderView = {
        let headerView = OEHeaderView()
        return headerView
    }()
    
    lazy var avatarImgV: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubViews()
        initConstraints()
        
    }
    
    //MARK:初始化
    func initSubViews(){
        /** HeaderView */
        view.addSubview(headerView)
        
        /** tableView */
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.bounces = false
        let tableViewHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 44))
        tableViewHeader.backgroundColor = cellColor
        tableViewHeader.alpha = 0.8
        tableView.tableHeaderView = tableViewHeader
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "left", style: .plain, target: self, action: #selector(leftItemClick))
        view.addSubview(avatarImgV)
        
    }
    //MARK:初始化布局
    func initConstraints(){
        headerView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(150)
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.centerY).offset(50)
            make.bottom.equalTo(view)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        avatarImgV.snp.makeConstraints { (make) in
            make.height.width.equalTo(50)
            make.centerX.equalTo(headerView)
            make.centerY.equalTo(tableView.snp.top)
        }
        
        view.bringSubview(toFront: tableView)
        view.bringSubview(toFront: avatarImgV)
        
    }
    
    func leftItemClick(){
        
    }
}


extension OEHomeContoller:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weiboController = OEWeiboController()
        navigationController?.pushViewController(weiboController, animated: true)
    }
}
