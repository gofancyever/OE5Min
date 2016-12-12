//
//  OEWeiboController.swift
//  OE5Min
//
//  Created by apple on 2016/12/9.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit
let cellHome = "OEWeiboCell"

class OEWeiboController: OEBaseTableViewController {
    var navFrame:CGRect?
    var lastScrollPointY:CGFloat = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: cellHome, bundle: nil), forCellReuseIdentifier: cellHome)
        navFrame = self.navigationController?.navigationBar.frame
        
        
//        let pan:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(pan:)))
//        pan.minimumNumberOfTouches = 1
        
//        pan.delegate = self
//        tableView.addGestureRecognizer(pan)
        
        
    }
//    func handlePanGesture(pan:UIPanGestureRecognizer){
//        //显示
//        let translation = pan.translation(in: tableView)
//        print(translation.y)
//        var navHeight:CGFloat = 0
//        if translation.y>0 {//向下
//            navHeight = 20
//        }else{//向上
//            navHeight = -64
//        }
//        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
//            self.navigationController?.navigationBar.frame.origin.y = navHeight
//        }, completion: nil)
//    }

}
extension OEWeiboController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellHome)
        cell?.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
extension OEWeiboController: UITableViewDelegate {
    
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
//extension OEWeiboController: UIGestureRecognizerDelegate{
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        if gestureRecognizer.self == UIPanGestureRecognizer.self(){
//           let ges = gestureRecognizer as! UIPanGestureRecognizer
//            let translation:CGPoint = ges.translation(in: tableView)
//            return fabs(translation.x)>fabs(translation.y)
//        }
//        return true
//
//    }
//}
