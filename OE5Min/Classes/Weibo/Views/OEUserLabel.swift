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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imgV_avatar.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        btn_name.setTitle("test", for: .normal)
        lab_content.text = "dsadasdsa"
        
        addSubview(imgV_avatar)
        addSubview(btn_name)
        addSubview(lab_content)
        
        imgV_avatar.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.width.height.equalTo(30)
            make.top.equalTo(self)
        }
        btn_name.snp.makeConstraints { (make) in
            make.centerY.equalTo(imgV_avatar)
            make.left.equalTo(imgV_avatar.snp.right).offset(4)
            
        }
        lab_content.snp.makeConstraints { (make) in
            make.centerY.equalTo(btn_name)
            make.left.equalTo(btn_name.snp.right).offset(4)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
