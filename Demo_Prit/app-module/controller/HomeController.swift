
import UIKit
import ObjectMapper

class HomeController: UIViewController {
    
    //MARK:-Outlets
    @IBOutlet weak var tblView: UITableView!
    
    
    //MARK:- Vars
    var dataList = [HomeDataModel]()
    var currentpage = 1
    var totalPages = 0
    var isLoadingList : Bool = false
    fileprivate let refreshControl = UIRefreshControl()

    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    
    //MARK:
    //MARK:- Initial SetUp
    func initUI(){
        setTitle()
        loadXIB()
        addRefereshControl()
    }
    
    //MARK:
    //MARK:- Load XIB
    func loadXIB(){
        self.tblView.register(UINib(nibName: "HomeDataCell", bundle: nil), forCellReuseIdentifier: "HomeDataCell")
        getDataList()
    }
    
    //MARK:
    //MARK:- SetUp RefereshControl
    func addRefereshControl(){
        refreshControl.tintColor = UIColor.systemBlue
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        tblView.addSubview(refreshControl)
    }
    
    @objc private func refreshWeatherData(_ sender: Any) {
        // Fetch Weather Data
        self.currentpage = 1
        self.dataList.removeAll()
        self.tblView.reloadData()
        
        AppManager.sharedInstance.delay(0.8) {
            self.getDataList()
        }
        
        
        
    }
    
    
    //MARK:-  API Call
    
    func getDataList(){
        //self.arrCategory.removeAll()
        
        if !NetworkManager.shared.isConnectedToInternet(){
            return
        }
        self.showSpinner(onView: self.view)
        
        NetworkManager.shared.request(requestType: .get, path: RequestEndPoint.home_data + currentpage.toString()) { (responseObject) in
            switch(responseObject.result) {
            case .success(_):
                if let data = responseObject.result.value{
                    self.totalPages = ((data as? NSDictionary)?.value(forKey: RequestFields.nbPages) as? Int)!
                    if let data = ((data as? NSDictionary)?.value(forKey: RequestFields.hits) as? NSArray){
                        if self.currentpage == 1{
                            self.dataList = Mapper<HomeDataModel>().mapArray(JSONArray: data as! [[String : Any]])
                        }else{
                            self.dataList.append(contentsOf: Mapper<HomeDataModel>().mapArray(JSONArray: data as! [[String : Any]]))
                        }
                    }
                }
                break
                
            case .failure(_):
                break
            }
            
            DispatchQueue.main.async {
                self.removeSpinner()
                self.refreshControl.endRefreshing()
                self.tblView.reloadData()
                self.isLoadingList = false
            }
        }
        
    }
    
    
}


