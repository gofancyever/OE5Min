//
//  OEHomeDetailController.swift
//  OE5Min
//
//  Created by gaof on 2017/2/8.
//  Copyright © 2017 gaof. All rights reserved.
//

import UIKit

let height_imgv:CGFloat = 189

class OEHomeDetailController: OEBaseViewController {


    let footerView = OEFavoShareToolBar()
        let loadActive = UIActivityIndicatorView(activityIndicatorStyle: .white)
    lazy var headerView: UIImageView = {
        return UIImageView()
    }()
    var selectedIndexPath:IndexPath?
    
    var contentView:UIWebView  = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfig()
        setupConstrain()
    }
    
    func setupConfig(){
        self.isHeroEnabled = true
        self.contentView.heroID = "content_\(selectedIndexPath!.row)"
        self.headerView.heroID = "image_\(selectedIndexPath!.row)"
        self.footerView.heroID = "tool_\(selectedIndexPath!.row)"
        self.headerView.image = UIImage(named:"flying")
        
        self.contentView.loadRequest(URLRequest(url: URL(string: "http://www.baidu.com")!))
        self.contentView.delegate = self
        self.contentView.scrollView.delegate = self
    }

    func setupConstrain() {
        self.view.addSubview(self.headerView)
        self.headerView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self.view)
            make.height.equalTo(height_imgv)
        }
        
        self.view.addSubview(self.contentView)
        self.contentView.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        self.contentView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.headerView.snp.bottom)
            make.bottom.equalTo(self.view).offset(-35)
        }
        
        self.view.addSubview(self.footerView)
        self.footerView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.height.equalTo(35)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension OEHomeDetailController:UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("start")
        self.contentView.addSubview(loadActive)
        loadActive.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("end")
        self.loadActive.removeFromSuperview()
    }
    
}
extension OEHomeDetailController:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        if scrollView.contentOffset.y < height_imgv{
            self.headerView.snp.updateConstraints { (make) in
                make.top.equalTo(self.view).offset(-scrollView.contentOffset.y)
            }
        }
    }
}
