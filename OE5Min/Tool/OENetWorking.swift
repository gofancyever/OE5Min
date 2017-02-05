//
//  OENetWorking.swift
//  OE5Min
//
//  Created by apple on 2016/12/26.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit


class OENetWorking: NSObject {
    private static let shareInstance = OENetWorking()
    class var shareNetWorking:OENetWorking {
        return shareInstance
    }
    
    
}
