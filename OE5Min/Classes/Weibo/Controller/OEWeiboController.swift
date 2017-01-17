//
//  OEWeiboController.swift
//  OE5Min
//
//  Created by apple on 2016/12/9.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit
let cellWeibo = "OEWeiboCell"

class OEWeiboController: OEBaseTableViewController,ConfigHeaderViewProtocol {
    
    lazy var sourceData:Array  = {
        return [];
    }()
    
    lazy var navFrame:CGRect? = {
        return self.navigationController?.navigationBar.frame
    }()
    var lastScrollPointY:CGFloat = 0;
    lazy var avatarImgV: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubViews()
        initConstraints()
        
        tableView.cellAction { (targetType, target, indexPath) in
            
            let cell = target as! OEWeiboCell
            self.moveImages = [""]
            self.moveView = cell.cv_image
            let weiboDetailVC = OEWeiboDetailController()
            self.navigationController?.pushViewController(weiboDetailVC, animated: true)
        }
        
//        requestData()
    }
    
    func requestData() {
        let parameters = [
            "access_token":testSinaToken
        ]
        OENetWorking.shareNetWorking.requestData(url: kSinaHomeUrl,method:.get, parameters: parameters) { (response) in
            print(response)
  
            let statuses:[Dictionary<String,Any>] = response!["statuses"] as! [Dictionary<String, Any>]
            self.sourceData.append(statuses.map({ dict -> OEStatusModel in
                return OEStatusModel(JSON: dict)!
            }))
            print(self.sourceData[0])
            
        }
    }
    
    func initSubViews(){
        navFrame = self.navigationController?.navigationBar.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        tableView.register(OEWeiboCell.self, forCellReuseIdentifier: cellWeibo)
        view.addSubview(avatarImgV)
        configHeaderView(height: 150, image: nil, backgroundColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
    }
    
    func initConstraints(){
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(120)
            make.left.right.bottom.equalTo(view)
        }
        avatarImgV.snp.makeConstraints { (make) in
            make.height.width.equalTo(50)
            make.centerX.equalTo(tableView)
            make.centerY.equalTo(tableView.snp.top)
        }
        
        view.bringSubview(toFront: tableView)
        view.bringSubview(toFront: avatarImgV)
    }

}
extension OEWeiboController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellWeibo) as! OEWeiboCell
        cell.tv_content.buttonClick = { button in
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

}
extension OEWeiboController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tableView.snp.updateConstraints { (make) in
            if (120-scrollView.contentOffset.y)>64 {
            make.top.equalTo(120-scrollView.contentOffset.y)
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.rowAction?(kCellActionType,cell!,indexPath)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let transfrom = CATransform3DMakeTranslation(0, 50, 0)
        cell.layer.transform = transfrom
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveLinear, animations: {
            cell.layer.transform = CATransform3DIdentity
        }, completion: nil)
    }
}
extension OEWeiboController {

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

