//
//  OEHomeDetailController.swift
//  OE5Min
//
//  Created by gaof on 2017/2/8.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit

class OEHomeDetailController: OEBaseViewController {

    let scrollView = UIScrollView()
    let footerView = OEFavoShareToolBar()
    let stackView = UIStackView()
    lazy var headerView: UIImageView = {
        return UIImageView()
    }()
    var selectedIndexPath:IndexPath?
    
    lazy var contentView: UIView = {
        return UIView()
    }()
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



    }

    
    func setupConstrain() {

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self.view)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
