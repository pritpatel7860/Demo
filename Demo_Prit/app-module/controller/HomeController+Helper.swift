

import Foundation
import UIKit


extension HomeController{
    
    func setTitle(){
        self.title = "Selected post \(self.dataList.filter{$0.isSelected}.count)"
    }
    
}


extension HomeController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblView.dequeueReusableCell(withIdentifier: "HomeDataCell") as? HomeDataCell
        cell?.setData(model: dataList[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dataList[indexPath.row].isSelected = !self.dataList[indexPath.row].isSelected
        self.tblView.reloadData()
        
        AppManager.sharedInstance.delay(0.3) {
            DispatchQueue.main.async {
                self.setTitle()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.dataList.count - 1 && !isLoadingList{
            if self.currentpage < self.totalPages{
                isLoadingList = true
                self.currentpage += 1
                self.getDataList()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
