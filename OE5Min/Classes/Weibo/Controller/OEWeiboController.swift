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

    var lastScrollPointY:CGFloat = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: cellHome, bundle: nil), forCellReuseIdentifier: cellHome)
        
        
        
        let pan:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector())
        pan.delegate = self
        pan.minimumNumberOfTouches = 1
        tableView.addGestureRecognizer(pan)
        
        
    }
    func handlePanGesture(pan:UIPanGestureRecognizer){
        #define NavBarFrame self.navigationController.navigationBar.frame
        //显示
        if (translation.y >= 5) {
            if (self.isHidden) {
                
                self.overLay.alpha=0;
                CGRect navBarFrame=NavBarFrame;
                CGRect scrollViewFrame=self.scrollView.frame;
                
                navBarFrame.origin.y = 20;
                scrollViewFrame.origin.y += 44;
                scrollViewFrame.size.height -= 44;
                
                [UIView animateWithDuration:0.2 animations:^{
                    NavBarFrame = navBarFrame;
                    self.scrollView.frame=scrollViewFrame;                }
                    }];
                self.isHidden= NO;
            }
        }
        
        //隐藏
        if (translation.y <= -20) {
            if (!self.isHidden) {
                CGRect frame =NavBarFrame;
                CGRect scrollViewFrame=self.scrollView.frame;
                frame.origin.y = -24;
                scrollViewFrame.origin.y -= 44;
                scrollViewFrame.size.height += 44;
                
                [UIView animateWithDuration:0.2 animations:^{
                    NavBarFrame = frame;
                    self.scrollView.frame=scrollViewFrame;

                    } completion:^(BOOL finished) {
                    self.overLay.alpha=1;
                    }];
                self.isHidden=YES;
            }
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
extension OEWeiboController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if (lastScrollPointY-scrollView.contentOffset.y)>0 {//向上
            self.navigationController?.navigationBar.subviews[0].alpha = 0
        }
        else{//向下
            self.navigationController?.navigationBar.subviews[0].alpha = 1
        }
        print(lastScrollPointY-scrollView.contentOffset.y)
        
        lastScrollPointY = scrollView.contentOffset.y
        
    }
}
