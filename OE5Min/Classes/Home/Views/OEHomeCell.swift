//
//  OEHomeCell.swift
//  OE5Min
//
//  Created by gaof on 2017/2/7.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit
import Lottie
import RxCocoa
import RxSwift

class OEHomeCell: UITableViewCell {
    

    

    @IBOutlet weak var tool_favoShare: OEFavoShareToolBar!
    
    @IBOutlet weak var view_content: UIView!
    
    @IBOutlet weak var imgV_cellBg: UIImageView!
    
    
    let rxBtnFavorite = PublishSubject<UIButton>()
    let rxBtnShare = PublishSubject<UIButton>()
    
       override func awakeFromNib() {
        super.awakeFromNib()
        
        self.view_content.layer.shadowColor = UIColor.black.cgColor
        self.view_content.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.view_content.layer.shadowOpacity = 0.4
        
    }
    
    override func prepareForReuse() {
        tool_favoShare.animationView?.animationProgress = 0;
    }

    

    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    @IBAction func btn_favoriteClick(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected
//        if sender.isSelected {
//            animationView?.play()
//        }else{
//            self.animationView?.animationProgress = 0;
//        }
//        rxBtnFavorite.onNext(sender)
//    }
//    @IBAction func btn_shareClick(_ sender: UIButton) {
//        rxBtnShare.onNext(sender)
//    }
    
}
