//
//  OENetWorking.swift
//  OE5Min
//
//  Created by apple on 2016/12/26.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit
import Alamofire

class OENetWorking: NSObject {
    private static let shareInstance = OENetWorking()
    class var shareNetWorking:OENetWorking {
        return shareInstance
    }
    
    func login(platformType:UMSocialPlatformType,response:@escaping ([String:Any]?)->()) {
        getUserInfo(platformType: platformType, userInfoResponse: { userInfo in
            print(userInfo)
            let uid:String = userInfo.uid
            let iconurl:String = userInfo.iconurl
            let name:String = userInfo.name
            var parameters:Dictionary<String,String>?
            parameters?["name"] = name
            parameters?["iconurl"] = iconurl
            parameters?["uid"] = uid
            self.requestData(url: "/login", parameters: parameters, responseData: { responseData in
                response(responseData);
            })
        })
    }
    
    private func getUserInfo(platformType:UMSocialPlatformType,userInfoResponse:@escaping (_ userInfoResponse:UMSocialUserInfoResponse)->()) {
        UMSocialManager.default().getUserInfo(with: platformType, currentViewController: self, completion: { result,error in
            if result != nil {
                let userInfo:UMSocialUserInfoResponse = result as! UMSocialUserInfoResponse
                userInfoResponse(userInfo)
            }
        })
    }
    
    
    func requestData(url:String,parameters:[String:String]?,responseData:@escaping ([String:Any]?)->()) {
        let requestUrl = "\(kServerUrl)\(url)"
        Alamofire.request(requestUrl,method:.post).responseJSON { response in
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                responseData(response.result.value as! [String : Any]?)
            }
        }
    }
    
    
}
