
import UIKit
import Alamofire
import ObjectMapper
import CoreLocation

typealias completionBlock = (_ responseObject : DataResponse<Any>) -> Void
class NetworkManager: NSObject {
    
    class var shared: NetworkManager {
        struct Static {
            static let instance = NetworkManager()
        }
        return Static.instance
    }
  
    
    func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    private func encoding()->JSONEncoding{
        return JSONEncoding.default
    }
    //MARK: - Request
    func request(requestType : Alamofire.HTTPMethod,path:String,block : @escaping completionBlock){
        Alamofire.request(RequestURL.BaseURL + path, method: requestType, encoding: encoding())
            .responseJSON { (response:DataResponse<Any>) in
                block(response)
        }
    }
    
}
