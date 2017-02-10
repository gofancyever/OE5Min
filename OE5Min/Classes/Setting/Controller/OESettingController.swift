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
class OESettingController: OEBaseTableViewController,ConfigHeaderViewProtocol{
    
    
    lazy var avatarImgV: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubViews()
        initConstraints()
        
//        let loginController = OELoginController()
//        self.present(loginController, animated: true, completion: nil)

    }
    
    //MARK:初始化
    func initSubViews(){
        /** HeaderView */
        configHeaderView(height:200, image: nil, backgroundColor: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))

        /** tableView */

        tableView.dataSource = self
        tableView.layer.masksToBounds = true
        tableView.layer.cornerRadius = 4
        let backgroundImgView = UIImageView(image: UIImage(named:"tv_background"))
        backgroundImgView.frame = tableView.frame
        tableView.backgroundView = backgroundImgView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.bounces = false
        let tableViewHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 44))
        tableViewHeader.backgroundColor = UIColor.clear
        tableView.tableHeaderView = tableViewHeader
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "left", style: .plain, target: self, action: #selector(leftItemClick))
        view.addSubview(avatarImgV)
        
    }
    //MARK:初始化布局
    func initConstraints(){

        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.bottom.equalTo(view).offset(-20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        avatarImgV.snp.makeConstraints { (make) in
            make.height.width.equalTo(50)
            make.centerX.equalTo(tableView)
            make.centerY.equalTo(tableView.snp.top)
        }
        
        view.bringSubview(toFront: tableView)
        view.bringSubview(toFront: avatarImgV)
        
    }
    
    func leftItemClick(){
        
    }
}



extension OESettingController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        cell?.contentView.backgroundColor = UIColor.clear
        cell?.contentView.alpha = 0.9
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
