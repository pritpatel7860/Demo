
import UIKit
import ObjectMapper

class HomeDataModel: Mappable {

    internal var created_at : String?
    internal var title : String?
    internal var isSelected : Bool = false
        
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        created_at <- map["created_at"]
        title <- map["title"]
    }
}
