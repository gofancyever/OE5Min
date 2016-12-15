//
//  OEImageCollectionViewCell.swift
//  OE5Min
//
//  Created by gaof on 2016/12/15.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit

class OEImageCollectionViewCell: UICollectionViewCell {
    var imageUrl:String?{
        didSet{
            let url = URL(string: "http://domain.com/image.png")!
            imageView.kf.setImage(with: url,
                                  placeholder: nil,
                                  options: [.transition(.fade(1))],
                                  progressBlock: nil,
                                  completionHandler: nil)
        }
    }
    
    lazy var imageView:UIImageView = {
        return UIImageView()
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.bottom.right.left.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
