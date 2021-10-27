//
//  AdminViewController.swift
//  IONO
//
//  Created by Alexandra Medina
//

import UIKit
import Firebase
import Alamofire


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
 //MARK: Defining Firebase reference
    var refTicker: DatabaseReference!
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldMember: UITextField!
    @IBOutlet weak var textFieldTicker: UITextField!
    @IBOutlet weak var textFieldOpen: UITextField!
   
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelClose: UILabel!
    @IBOutlet weak var labelLow: UILabel!
    @IBOutlet weak var labelHigh: UILabel!
    @IBOutlet weak var labelVolume: UILabel!

 //MARK: Quick Access Admin Buttons
    @IBAction func login2BTN(_ sender: Any) {
    performSegue(withIdentifier: "login1Segue", sender: self)
    }

    @IBAction func watchlist3Button(_ sender: Any) {
        performSegue(withIdentifier: "watchlist2Segue", sender: self)
    }
    
    @IBAction func registerButton(_ sender: Any) {
        performSegue(withIdentifier: "registerSegue", sender: self)
    }
    
    @IBAction func settingsBtn(_ sender: Any) {
        performSegue(withIdentifier: "settingsSegue", sender: self)
    }
    @IBAction func stocksHomeButton(_ sender: Any) {
        performSegue(withIdentifier: "stockFirstSegue", sender: self)
        
    }
    @IBAction func stockLearnButton(_ sender: Any) {
        performSegue(withIdentifier: "stockLearnSegue", sender: self)
    }
    
    @IBAction func homeBtn(_ sender: Any) {
        performSegue(withIdentifier: "firstViewSegue", sender: self)
        
    }
    
    @IBAction func home2Btn(_ sender: Any) {
        performSegue(withIdentifier: "firstView2Segue", sender: self)
    }
    @IBAction func loginSubmitBtn(_ sender: Any) {
        performSegue(withIdentifier: "firstView3Segue", sender: self)
    }
    
    @IBAction func loginEntrance(_ sender: Any) {
        performSegue(withIdentifier: "loginSegue", sender: self)

    }
    
    @IBAction func buttonCornerMenu(_ sender: Any) {
        performSegue(withIdentifier: "theSegue", sender: self)
          
    }

    @IBAction func watchlistButton(_ sender: UIButton) {
        performSegue(withIdentifier: "menuSegue", sender: self)
    }
    
    @IBAction func watchlist2Button(_ sender: Any) {
        performSegue(withIdentifier: "watchlistSegue", sender: self)
    }

//MARK:  ADD Ticker    
    
    func addTicker(){

            let key = refTicker.childByAutoId().key
            
//MARK: Creating Ticker
            let stock = ["id":key,
                            "ticker": textFieldTicker.text! as String,
                            "open": textFieldOpen.text! as String,
                            "close": textFieldOpen.text! as String,
                            "low": textFieldOpen.text! as String,
                            "high": textFieldOpen.text! as String,
                            "volume": textFieldOpen.text! as String
                            ]
        
        refTicker.child(key!).setValue(stock)
        
        labelMessage.text = "Ticker Added"
    }
    
    @IBAction func buttonAddTicker(_ sender: UIButton) {
        addTicker()
    }
    
//MARK: Web Service
    
    let URL_SAVE_TEAM = URL(string: "http://10.0.1.34/MyWebService/api/createteam.php")
    
    let URL_USER_REGISTER = URL(string: "http://10.0.1.34/MyWebService/api/register.php")

        
//MARK: Stock Table View Set-Up

    
    var stockList = [StockModel]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
           return stockList.count
        }
        
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
            
            let stock: StockModel
            
            stock = stockList[indexPath.row]
            

                cell.labelName.text = (stock.ticker as! String)
                cell.labelGenre.text = (stock.open as! String)
                cell.labelClose.text = (stock.close as! String)
                cell.labelLow.text = (stock.low as! String)
                cell.labelHigh.text = (stock.high as! String)
                cell.labelVolume.text = (stock.volume as! String)

            return cell
        }
    
//MARK:  Load to Firebase
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        FirebaseApp.configure()
        
        refTicker = Database.database().reference().child("stockyfirebase2");
        
        refTicker.observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.childrenCount > 0 {
                
                self.stockList.removeAll()
                
//MARK:  Iterating through all the values

                for stocks in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let stockObject = stocks.value as? [String: AnyObject]
                    let stockTicker  = stockObject?["ticker"]
                    let stockId  = stockObject?["id"]
                    let stockOpen = stockObject?["open"]
                    let stockClose = stockObject?["close"]
                    let stockLow = stockObject?["low"]
                    let stockHigh = stockObject?["high"]
                    let stockVolume = stockObject?["volume"]
                    
                    let stock = StockModel (id: stockId as Any, ticker: stockTicker as Any, open: stockOpen as Any, close: stockClose as Any, low: stockLow as Any, high: stockHigh as Any, volume: stockVolume as Any)
                    
                    self.stockList.append(stock)
                }
                
                self.tableView.reloadData()
            }
            
        })
        
    }
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
