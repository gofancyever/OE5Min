//
//  OEWeiboTextView.swift
//  OE5Min
//
//  Created by gaof on 2016/12/15.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit
import ActiveLabel

typealias ButtonAction = (_ button:UIButton)->()

let kBtnMoreType = "BtnMoreType"

class OEWeiboTextView: UIView {
    
    var buttonClick: ButtonAction?
    
    lazy var lab_text: UILabel = {
        return UILabel()
    }()
//    lazy var btn_more: UIButton = {
//        let btn = UIButton()
//        btn.setTitle("收起", for: .selected)
//        btn.setTitle("更多", for: .normal)
//        btn.addTarget(self, action: #selector(btn_moreClick(button:)), for: .touchUpInside)
//        self.addSubview(btn)
//        return btn
//    }()
    
    
//    func btn_moreClick(button:UIButton) {
//        button.isSelected = !button.isSelected
//        self.lab_text.numberOfLines = button.isSelected ? 0 : 1
//        self.cellAction(targetType: kBtnMoreType, target: button)
//    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        lab_text.numberOfLines = 0
        lab_text.text = "dkfdoqwkkfwqdkfdoqwdkfdoqwdkfdoqwdkfdoqwdkfdoqwdkfdoqwdkfdoqwkf"
        lab_text.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        addSubview(lab_text)
        initConstraints()
    }
 
    func initConstraints(){
        lab_text.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self)
            make.bottom.equalTo(self)
        }
//        btn_more.snp.makeConstraints { (make) in
//            make.left.right.bottom.equalTo(self)
//            make.height.equalTo(20)
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
}
