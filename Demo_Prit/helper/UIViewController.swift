
import Foundation
import UIKit

extension UIViewController {
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        APPDELEGATE.vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            APPDELEGATE.vSpinner?.removeFromSuperview()
            APPDELEGATE.vSpinner = nil
        }
    }
}
