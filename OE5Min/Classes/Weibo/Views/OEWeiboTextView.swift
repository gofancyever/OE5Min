//
//  OEWeiboTextView.swift
//  OE5Min
//
//  Created by gaof on 2016/12/15.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit
import ActiveLabel
class OEWeiboTextView: UIView {
    
    lazy var lab_text: UILabel = {
        return UILabel()
    }()
    lazy var btn_more: UIButton = {
        let btn = UIButton()
        btn.setTitle("更多", for: .normal)
        self.addSubview(btn)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        lab_text.text = "dkfdoqwkkfwqkf"
        lab_text.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        addSubview(lab_text)
        lab_text.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self)
            let size = lab_text.sizeThatFits(CGSize(width: lab_text.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
            make.height.equalTo(size.height)
        }
        btn_more.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(lab_text.snp.bottom)
            make.height.equalTo(20)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
