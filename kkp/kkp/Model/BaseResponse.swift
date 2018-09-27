import Foundation
import ObjectMapper

class Result<T:Mappable>: Mappable {
    var result: T?
    var code:Int?
    var msg:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        msg <- map["msg"]
    }
}
