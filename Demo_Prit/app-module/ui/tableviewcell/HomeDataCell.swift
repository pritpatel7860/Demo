
import UIKit

class HomeDataCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func setData(model: HomeDataModel?) {
        if model != nil{
            self.labelTitle.text = model!.title
            self.labelSubtitle.text = model!.created_at!.toDateFormatterString(customFormat: "MMM dd yyyy")
            self.toggleSwitch.isOn = model!.isSelected
        }
    }
    
}
