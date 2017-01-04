//
//  OEHomeSatusModel.swift
//  OE5Min
//
//  Created by gaof on 2017/1/4.
//  Copyright © 2017年 gaof. All rights reserved.
//

import Foundation
import ObjectMapper


struct OEGeo:Mappable {
    
    var longitude : String?
    var latitude : String?
    var city : String?
    var city_name : String?
    var province_name : String?
    var address : String?
    var pinyin : String?
    var more : String?
    
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        longitude <- map["longitude"]
        latitude <- map["latitude"]
        city <- map["city"]
        city_name <- map["city_name"]
        province_name <- map["province_name"]
        address <- map["address"]
        pinyin <- map["pinyin"]
        more <- map["more"]
        
    }
}

struct OEUserModel:Mappable {
    
    var allowAllActMsg : Bool!
    var allowAllComment : Bool!
    var avatarHd : String!
    var avatarLarge : String!
    var biFollowersCount : Int!
    var blockApp : Int!
    var blockWord : Int!
    var city : String!
    var classField : Int!
    var coverImagePhone : String!
    var creditScore : Int!
    var descriptionField : String!
    var domain : String!
    var favouritesCount : Int!
    var followMe : Bool!
    var followersCount : Int!
    var following : Bool!
    var friendsCount : Int!
    var gender : String!
    var geoEnabled : Bool!
    var id : Int!
    var idstr : String!
    var lang : String!
    var location : String!
    var mbrank : Int!
    var mbtype : Int!
    var name : String!
    var onlineStatus : Int!
    var pagefriendsCount : Int!
    var profileImageUrl : String!
    var profileUrl : String!
    var province : String!
    var ptype : Int!
    var remark : String!
    var screenName : String!
    var star : Int!
    var statusesCount : Int!
    var urank : Int!
    var url : String!
    var userAbility : Int!
    var verified : Bool!
    var verifiedContactEmail : String!
    var verifiedContactMobile : String!
    var verifiedContactName : String!
    var verifiedLevel : Int!
    var verifiedReason : String!
    var verifiedReasonModified : String!
    var verifiedReasonUrl : String!
    var verifiedSource : String!
    var verifiedSourceUrl : String!
    var verifiedState : Int!
    var verifiedTrade : String!
    var verifiedType : Int!
    var verifiedTypeExt : Int!
    var weihao : String!
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        id <- map["id"]
        idstr <- map["idstr"]
        screenName <- map["screen_name"]
        name <- map["name"]
        province <- map["province"]
        city <- map["city"]
        location <- map["location"]
        descriptionField <- map["description"]
        url <- map["url"]
        profileImageUrl <- map["profile_image_url"]
        profileUrl <- map["profile_url"]
        domain <- map["domain"]
        
        weihao <- map["weihao"]
        gender <- map["gender"]
        followersCount <- map["followers_count"]
        friendsCount <- map["friends_count"]
        
        statusesCount <- map["statuses_count"]
        favouritesCount <- map["favourites_count"]
        allowAllComment <- map["allow_all_comment"]
        avatarLarge <- map["avatar_large"]
        avatarHd <- map["avatar_hd"]
        
    }
}


struct OEStatusModel:Mappable{
    
    var attitudesCount : Int!
    var commentsCount : Int!
    var createdAt : String!
    var thumbnail_pic : String?
    var bmiddle_pic : String?
    var original_pic : String?
    var favorited : Bool!
    var geo : AnyObject!
    var id : Int!
    var isLongText : Bool!
    var isShowBulletin : Int!
    var mid : String!
    
    var picUrls : [String]!
    var positiveRecomFlag : Int!
    var repostsCount : Int!
    var rid : String!
    var source : String!
    var sourceAllowclick : Int!
    var sourceType : Int!
    var text : String!
    var textTagTips : [AnyObject]!
    var truncated : Bool!
    var user : OEUserLabel!
    var userType : Int!

    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        createdAt <- map["created_at"]
        attitudesCount <- map["attitudes_count"]
        id <- map["id"]
        mid <- map["mid"]
        text <- map["text"]
        source <- map["source"]
        favorited <- map["favorited"]
        thumbnail_pic <- map["thumbnail_pic"]
        bmiddle_pic <- map["bmiddle_pic"]
        original_pic <- map["original_pic"]
        geo <- map["geo"]
        commentsCount <- map["comments_count"]
        repostsCount <- map["reposts_count"]
        
        
    }
}
