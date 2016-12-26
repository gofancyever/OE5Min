//
//  OEView.swift
//  OE5Min
//
//  Created by gaof on 2016/12/13.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit

extension UIView {
    
    func addGradientColor(startPoint:CGPoint,endPoint:CGPoint,colors:[UIColor],locations:[NSNumber]){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.frame
        self.layer.addSublayer(gradientLayer)
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.colors = colors.map({ (color) -> CGColor in
            return color.cgColor
        })
        gradientLayer.locations = locations
    }
}
