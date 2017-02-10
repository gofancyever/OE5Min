//
//  OEPaperModel.swift
//  OE5Min
//
//  Created by gaof on 2017/2/10.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit

class OEPaperModel: NSObject {

}
struct PaperModel {
    var image:UIImage!
    var content:String!
    init(image:UIImage,content:String) {
        self.image = image;
        self.content = content
    }
}
