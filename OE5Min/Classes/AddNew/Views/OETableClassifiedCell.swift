//
//  OETableClassifiedCell.swift
//  OE5Min
//
//  Created by gaof on 2017/2/14.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit

class OETableClassifiedCell: UITableViewCell {

    
    @IBOutlet weak var btn_select: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func btn_selectClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            UIView.animate(withDuration: 1.2, animations: { 
                sender.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI));
            })
            
        }
    }
    
}
