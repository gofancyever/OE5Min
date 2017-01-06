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
    
    var buttonMoreDidClick: ButtonAction?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.selectionStyle = .none
        
        addSubview(cv_image)
        addSubview(tv_content)
        addSubview(lab_userLabel)
        
        
        cv_image.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        cv_image.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.height.equalTo(120)
        }
        
        
        tv_content.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        tv_content.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(cv_image.snp.bottom)
            make.bottom.equalTo(lab_userLabel.snp.top)
        }
        
        lab_userLabel.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(self)
            make.height.equalTo(44)
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
