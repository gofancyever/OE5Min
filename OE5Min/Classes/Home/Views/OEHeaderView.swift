//
//  OEHeaderView.swift
//  OE5Min
//
//  Created by gaof on 2016/12/12.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit

class OEHeaderView: UIView {
    
    var img_avatar:UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
