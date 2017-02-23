//
//  OETableClassifiedCell.swift
//  OE5Min
//
//  Created by gaof on 2017/2/14.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

enum ClassifiedBtnType:Int {
    case add = 1
    case close = 0

}
class OETableClassifiedCell: UITableViewCell {

    @IBOutlet weak var leb_name: UILabel!
    
    var model:ClassifiedModel? {
        didSet{
            self.leb_name.text = model?.name
            self.btn_select.isSelected = (model?.isSelected)!
            btnSelectAnim(sender: self.btn_select)
        }
    }
    
    let rxBtnClassified = PublishSubject<ClassifiedBtnType>()
    
    @IBOutlet weak var btn_select: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
       @IBAction func btn_selectClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        btnSelectAnim(sender: sender)
        
    }
    
    func btnSelectAnim(sender:UIButton){
        if sender.isSelected {
            rxBtnClassified.onNext(.add)
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.4, options: .curveEaseIn, animations: {
                sender.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4+M_PI))
            }, completion: nil)
            
        }else{
            rxBtnClassified.onNext(.close)
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.4, options: .curveEaseIn, animations: {
                sender.transform = CGAffineTransform(rotationAngle: 0)
            }, completion: nil)
        }
    }

    
    
}
