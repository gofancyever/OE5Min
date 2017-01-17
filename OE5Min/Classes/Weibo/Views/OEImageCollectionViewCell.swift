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
            let url = URL(string: "http://i.dimg.cc/e3/cc/e8/69/1e/22/09/f8/4c/fe/8a/08/b7/76/b3/a5.jpg")!
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
        let url = URL(string: "http://i.dimg.cc/e3/cc/e8/69/1e/22/09/f8/4c/fe/8a/08/b7/76/b3/a5.jpg")!
        imageView.kf.setImage(with: url,
                              placeholder: nil,
                              options: [.transition(.fade(1))],
                              progressBlock: nil,
                              completionHandler: nil)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
