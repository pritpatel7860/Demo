

import Foundation
import UIKit


extension Int {
    func toString() -> String
    {
        return String(self)
    }

}

extension String {
  
    func toDateFormatterString(customFormat : String) -> String
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        //dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        //Parse into NSDate
        let dateFromString = dateFormatter.date(from: self)!
        
        dateFormatter.dateFormat = customFormat
        
        //Return Parsed Date
        return dateFormatter.string(from: dateFromString)
        
    }
    
    func toDateTime() -> Date
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        //Parse into NSDate
        let dateFromString : Date = dateFormatter.date(from: self)! as Date
        
        //Return Parsed Date
        return dateFromString
    }
    
    func toDate() -> NSDate
    {
        
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        
        //Parse into NSDate
        let dateFromString : NSDate = dateFormatter.date(from: self)! as NSDate
        
        //Return Parsed Date
        return dateFromString
    }
   
}

