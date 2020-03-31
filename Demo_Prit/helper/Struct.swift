
import Foundation
import UIKit

struct RequestURL {
    static var BaseURL: String {
        let apiBase: String
        apiBase = "https://hn.algolia.com/api"
        return apiBase
    }
}


struct RequestEndPoint{
    //MARK: - Auth
    static let home_data = "/v1/search_by_date?tags=story&page="
    
}
struct RequestFields{
    
    static let hits = "hits"
    static let nbPages = "nbPages"
    
}

