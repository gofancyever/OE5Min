//
//  OEContentView.swift
//  OE5Min
//
//  Created by gaof on 2017/2/10.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit

class OEContentView: UIScrollView {

    
    let imgV_header = UIImageView()
    let view_content = UIView()
    let stackView = UIStackView()
    convenience init() {
        self.init(frame: CGRect.zero)
        setupSubViews()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSubViews()
        
    }
    
    func setupSubViews(){
        
        stackView.axis = .vertical
        //test
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        let testColor = [#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),#colorLiteral(red: 0, green: 0.4684420824, blue: 0.8671583533, alpha: 1),#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)]
        
        self.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self)
        }
        
        for color in testColor {
            let view = UIView()
            view.backgroundColor = color
            self.stackView.addArrangedSubview(view)
            view.snp.makeConstraints({ (make) in
                make.height.equalTo(60)
            })
        }
        self.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
