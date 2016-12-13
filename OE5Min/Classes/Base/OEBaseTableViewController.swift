//
//  OEBaseTableViewController.swift
//  OE5Min
//
//  Created by apple on 2016/12/11.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit

protocol ConfigHeaderView {
    var headerView:UIView { get }
    func configHeaderView(toView:UIView,height:CGFloat,image:UIImage?,backgroundColor:UIColor?)
}

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

extension ConfigHeaderView {
    internal var headerView: UIView {
        let headerView = UIView(frame: CGRect.init())
        return headerView
    }

    func configHeaderView(toView view:UIView, height:CGFloat, image: UIImage?, backgroundColor: UIColor?) {
        view.addSubview(headerView)
        headerView.snp.makeConstraints { (make) in
            make.right.left.top.equalTo(view)
            make.height.equalTo(height)
        }
        headerView.backgroundColor = backgroundColor
        if image != nil {
            let imageView = UIImageView(image: image)
            imageView.image = image
            imageView.frame = headerView.frame;
            headerView.addSubview(imageView)
            imageView.snp.makeConstraints({ (make) in
                make.top.bottom.left.right.equalTo(headerView)
            })
            
        }
    }
}
