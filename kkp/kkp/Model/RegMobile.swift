//
//    RootClass.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class RegMobile : NSObject, NSCoding, Mappable{
    
    var bindingPhone : Bool?
    var expireTime : Int?
    var id : Int?
    var identifier : String?
    var isHasPhoto : Int?
    var isNew : Bool?
    var newBirth : Int?
    var nickname : String?
    var sex : Int?
    var token : String?
    var userphoto : [AnyObject]?
    var usersig : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return RegMobile()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        bindingPhone <- map["binding_phone"]
        expireTime <- map["expire_time"]
        id <- map["id"]
        identifier <- map["identifier"]
        isHasPhoto <- map["is_has_photo"]
        isNew <- map["is_new"]
        newBirth <- map["new_birth"]
        nickname <- map["nickname"]
        sex <- map["sex"]
        token <- map["token"]
        userphoto <- map["userphoto"]
        usersig <- map["usersig"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        bindingPhone = aDecoder.decodeObject(forKey: "binding_phone") as? Bool
        expireTime = aDecoder.decodeObject(forKey: "expire_time") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? Int
        identifier = aDecoder.decodeObject(forKey: "identifier") as? String
        isHasPhoto = aDecoder.decodeObject(forKey: "is_has_photo") as? Int
        isNew = aDecoder.decodeObject(forKey: "is_new") as? Bool
        newBirth = aDecoder.decodeObject(forKey: "new_birth") as? Int
        nickname = aDecoder.decodeObject(forKey: "nickname") as? String
        sex = aDecoder.decodeObject(forKey: "sex") as? Int
        token = aDecoder.decodeObject(forKey: "token") as? String
        userphoto = aDecoder.decodeObject(forKey: "userphoto") as? [AnyObject]
        usersig = aDecoder.decodeObject(forKey: "usersig") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if bindingPhone != nil{
            aCoder.encode(bindingPhone, forKey: "binding_phone")
        }
        if expireTime != nil{
            aCoder.encode(expireTime, forKey: "expire_time")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if identifier != nil{
            aCoder.encode(identifier, forKey: "identifier")
        }
        if isHasPhoto != nil{
            aCoder.encode(isHasPhoto, forKey: "is_has_photo")
        }
        if isNew != nil{
            aCoder.encode(isNew, forKey: "is_new")
        }
        if newBirth != nil{
            aCoder.encode(newBirth, forKey: "new_birth")
        }
        if nickname != nil{
            aCoder.encode(nickname, forKey: "nickname")
        }
        if sex != nil{
            aCoder.encode(sex, forKey: "sex")
        }
        if token != nil{
            aCoder.encode(token, forKey: "token")
        }
        if userphoto != nil{
            aCoder.encode(userphoto, forKey: "userphoto")
        }
        if usersig != nil{
            aCoder.encode(usersig, forKey: "usersig")
        }
        
    }
    
}
