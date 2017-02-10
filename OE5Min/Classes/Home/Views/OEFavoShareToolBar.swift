//
//  OEFavoShareToolBar.swift
//  OE5Min
//
//  Created by gaof on 2017/2/9.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit
import Lottie
import RxCocoa
import RxSwift
class OEFavoShareToolBar: UIView {
    
    let animationView = LAAnimationView.animationNamed("favorite")
   let btn_favorite = UIButton()
    let btn_share = UIButton()

    let rxBtnFavorite = PublishSubject<UIButton>()
    let rxBtnShare = PublishSubject<UIButton>()
    let disposeBag = DisposeBag()

    override func awakeFromNib() {

        setupConfig()
        setupConstraint()
    }


    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    func setupConstraint() {
        
        self.addSubview(btn_favorite)
        btn_favorite.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(8)
            make.centerY.equalTo(self)
            make.width.height.equalTo(35)
        }
        
        self.addSubview(btn_share)
        btn_share.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-8)
            make.centerY.equalTo(self)
            make.width.height.equalTo(35)
        }
        
        
        
        self.btn_favorite.addSubview(animationView!)
        animationView?.snp.makeConstraints({ (make) in
            make.top.bottom.left.right.equalTo(self.btn_favorite)
        })
    }
    
    func setupConfig() {
        
        self.btn_favorite.addTarget(self, action: #selector(btn_favoriteClick(sender:)), for: .touchUpInside)
        self.btn_share.addTarget(self, action: #selector(btn_favoriteClick(sender:)), for: .touchUpInside)

        
        btn_share.rx.tap.subscribe { [unowned self] (_) in
            self.rxBtnShare.onNext(self.btn_share)
            }.addDisposableTo(disposeBag)
        
        btn_share.setImage(UIImage(named:"share"), for: .normal)
        
        animationView?.isUserInteractionEnabled = false
        animationView?.animationSpeed = 1.2
        animationView?.isExclusiveTouch = false
        animationView?.contentMode = .scaleAspectFit;
    }
    
    func btn_favoriteClick(sender:UIButton) {
        self.btn_favorite.isSelected = !self.btn_favorite.isSelected
        if self.btn_favorite.isSelected {
            self.animationView?.play()
        }else{
            self.animationView?.animationProgress = 0;
        }
        self.rxBtnFavorite.onNext(self.btn_favorite)

    }

    
}
