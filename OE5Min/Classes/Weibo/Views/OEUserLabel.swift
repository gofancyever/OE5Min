//
//  OEUserLabel.swift
//  OE5Min
//
//  Created by gaof on 2016/12/16.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit

class OEUserLabel: UIView {

    var avatar:String?{
        
        didSet {
            
        }
    }
    
    var name:String? {
        didSet {
            
        }
    }
    var content:String?{
        didSet {
            
        }
    }
    
    private let imgV_avatar:UIImageView = UIImageView()
    private let btn_name:UIButton = UIButton()
    private let lab_content:UILabel = UILabel()
    private let lab_time:UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        lab_content.font = UIFont.systemFont(ofSize: 12)
        lab_time.font = UIFont.systemFont(ofSize: 10)
        btn_name.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        
        imgV_avatar.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        btn_name.setTitle("test", for: .normal)
        lab_content.text = "dsadasdsa"
        lab_time.text = "1小时前"
        
        addSubview(imgV_avatar)
        addSubview(btn_name)
        addSubview(lab_content)
        addSubview(lab_time)
        
        
        imgV_avatar.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.width.height.equalTo(30)
            make.centerY.equalTo(self)
        }
        btn_name.snp.makeConstraints { (make) in
            make.top.equalTo(imgV_avatar)
            make.left.equalTo(imgV_avatar.snp.right).offset(4)
            make.height.equalTo(12)
            
        }
        lab_content.snp.makeConstraints { (make) in
            make.top.equalTo(btn_name)
            make.left.equalTo(btn_name.snp.right).offset(4)
            make.height.equalTo(12)
        }
        
        lab_time.snp.makeConstraints { (make) in
            make.bottom.equalTo(imgV_avatar)
            make.left.equalTo(imgV_avatar.snp.right).offset(4)
            make.height.equalTo(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
