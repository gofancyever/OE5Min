//
//  OEWeiboCell.swift
//  OE5Min
//
//  Created by apple on 2016/12/9.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit

class OEWeiboCell: UITableViewCell {

    lazy var cv_image: OEImageCollectionView = {
        return OEImageCollectionView()
    }()
    
    lazy var tv_content: OEWeiboTextView = {
        return OEWeiboTextView()
    }()
    
    lazy var lab_userLabel:OEUserLabel = {
        return OEUserLabel()
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.selectionStyle = .none
        
        
        cv_image.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        addSubview(cv_image)
        cv_image.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.height.equalTo(120)
        }
        tv_content.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        addSubview(tv_content)
        tv_content.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(cv_image.snp.bottom)
            make.height.equalTo(50)
        }
        addSubview(lab_userLabel)
        lab_userLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(tv_content.snp.bottom)
            make.height.equalTo(50)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func initSubViews(){
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
