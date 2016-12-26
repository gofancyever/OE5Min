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
    
    func login(platformType:UMSocialPlatformType) {
        getUserInfo(platformType: platformType)
    }
    
    private func getUserInfo(platformType:UMSocialPlatformType) {
        UMSocialManager.default().getUserInfo(with: platformType, currentViewController: self, completion: { result,error in
            let userInfo:UMSocialUserInfoResponse = result as! UMSocialUserInfoResponse
            print (userInfo)
        })
    }
}
