//
//  OEBaseTableViewController.swift
//  OE5Min
//
//  Created by apple on 2016/12/11.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit

protocol ConfigHeaderViewProtocol {
    func configHeaderView(height:CGFloat,image:UIImage?,backgroundColor:UIColor?)
}



class OEBaseTableViewController: OEBaseViewController {
    
    internal var moveView: UIView?
    internal var toView: UIView?
    internal var moveImages: [String]?
    
    
    
       
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
        tableView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension OEBaseTableViewController:UITableViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        var navHeight:CGFloat = 0
        if velocity.y>0 {//向下
            navHeight = -64
        }else{//向上
            navHeight = 20
        }
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.navigationController?.navigationBar.frame.origin.y = navHeight
        }, completion: nil)
    }
}

extension ConfigHeaderViewProtocol where Self:OEBaseTableViewController{

    func configHeaderView(height:CGFloat, image: UIImage?, backgroundColor: UIColor?) {
        let headerView = UIView()
        view.addSubview(headerView)
        headerView.snp.makeConstraints { (make) in
            make.right.equalTo(view)
            make.left.equalTo(view)
            make.top.equalTo(view)
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
