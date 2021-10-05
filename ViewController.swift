//
//  ViewController.swift
//  IONO
//
//  Created by Alexandra Medina on 8/23/21.
//

import UIKit
import Firebase
import Alamofire
//import FirebaseDatabase
//import RealmSwift


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    //defining firebase reference var
    var refTicker: DatabaseReference!
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldMember: UITextField!
    @IBOutlet weak var textFieldTicker: UITextField!
    @IBOutlet weak var textFieldOpen: UITextField!
    
    
    @IBOutlet weak var labelMessage: UILabel!

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var labelName: UILabel!
   // @IBOutlet weak var labelGenre: UILabel!
    //@IBOutlet weak var labelClose: UILabel!
    //@IBOutlet weak var labelLow: UILabel!
    //@IBOutlet weak var labelHigh: UILabel!
    //@IBOutlet weak var labelVolume: UILabel!
    
//++++++++++++++ SEGUE'S FOR DAZE ++++++++++++++++++++++++++++++++++



 
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
/*    @IBAction func btnLoginClick(_ sender: Any) {
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginView") as! LoginView
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
     */
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

//+++++++++++++++++++++++++ ADD TICKER ++++++++++++++++++++++++++++++++++
    
    
    func addTicker(){
            //generating a new key inside ticker node
            //and also getting the generated key
            let key = refTicker.childByAutoId().key
            
            //creating ticker with the given values
            let stock = ["id":key,
                            "ticker": textFieldTicker.text! as String,
                            "open": textFieldOpen.text! as String,
                           // "close": textFieldOpen.text! as String,
                           // "low": textFieldOpen.text! as String,
                           // "high": textFieldOpen.text! as String,
                           // "volume": textFieldOpen.text! as String
                            ]
        
            //adding the ticker inside the generated unique key
        refTicker.child(key!).setValue(stock)
            
            //displaying message
            labelMessage.text = "Ticker Added"
    }
    
    @IBAction func buttonAddTicker(_ sender: UIButton) {
        addTicker()
    }
    
//+++++++++++=+++++++++ WEB SERVICE ++++++++++++++++++++++++++++++++++++
    
    //URL to our web service
    let URL_SAVE_TEAM = URL(string: "http://10.0.1.34/MyWebService/api/createteam.php")
    
/*    let URL_USER_REGISTER = URL(string: "http://10.0.1.34/MyWebService/api/register.php")
*/
        
//++++++++++++++ STCOK TABLE VIEW SET-UP ++++++++++++++++ ++++++++++++++++

    
    var stockList = [StockModel]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
           return stockList.count
        }
        
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            //creating a cell using the custom class
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
            
            //the artist object
            let stock: StockModel
            
            //getting the artist of selected position
            stock = stockList[indexPath.row]
            
            //adding values to labels

                cell.labelName.text = (stock.ticker as! String)
                cell.labelGenre.text = (stock.open as! String)
                cell.labelClose.text = (stock.close as! String)
                cell.labelLow.text = (stock.low as! String)
                cell.labelHigh.text = (stock.high as! String)
                cell.labelVolume.text = (stock.volume as! String)

            //returning cell
            return cell
        }
    
//+++++++++++++++ REGISTER USER ++++++++++++++++++++++++++++++++++++++++++

/*
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fnameTextField: UITextField!
    @IBOutlet weak var lnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var label2Message: UILabel!

    
     func register() {
        
        //creating parameters for the post request
        let parameters: Parameters=[
            "email":emailTextField.text!,
            "password":passwordTextField.text!,
            "f_name":fnameTextField.text!,
            "l_name":lnameTextField.text!,
            "phone":phoneTextField.text!
        ]
        
        //Sending http post request
       Alamofire.request(URL_USER_REGISTER!, method: .post, parameters: parameters).responseJSON
        {
            response in
      //      //printing response
            print(response)
            
            //getting the json value from the server
            if let result = response.result.value {
                
                //converting it as NSDictionary
                let jsonData = result as! NSDictionary
         
                //displaying the message in label
                self.label2Message.text = jsonData.value(forKey: "message") as! String?
            }
        }
    }
    
    @IBAction func buttonRegister(_ sender: Any) {
        register()
        
    }
*/
//++++++++++++++++++++ SAVE TEAM ++++++++++++++++++++++++++++++++++++++
        
    @IBAction func buttonSave(_ sender: Any) {
        
        //getting values from text fields
        let teamName = textFieldName.text
        let memberCount = textFieldMember.text
         
         //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: URL_SAVE_TEAM!)
         
         //setting the method to post
        request.httpMethod = "POST"
        
         //creating the post parameter by concatenating the keys and values from text field
         let postParameters = "name="+teamName!+"&member="+memberCount!;
         
         //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
         
         
         //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest)
         {
             data, response, error in
             
             if error != nil{
                print("error is \(String(describing: error))")
                 return;
             }
         
             //parsing the response
             do
            {
                 //converting resonse to NSDictionary
                let myJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                 
                 //parsing the json
                 if let parseJSON = myJSON{
                    //creating a string
                     var msg : String!
                     
                     //getting the json response
                     msg = parseJSON["message"] as! String?
                     
                     //printing the response
                    print(msg as Any)
                 }
             }
             catch
             {
                 print(error)
             }
             
         }
         //executing the task
         task.resume()
         
     }
    
//+++++++++++++++ LOAD TO FIREBASE +++++++++++++++++++++++++++++++++++++++++

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //configure firebase
        FirebaseApp.configure()
        
        //getting a reference to the node artists
        refTicker = Database.database().reference().child("stockyfirebase2");
        
        //observing the data changes
        refTicker.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.stockList.removeAll()
                
                //iterating through all the values

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
                    
                    //appending it to list
                    self.stockList.append(stock)
                }
                
                //reloading the tableview
                self.tableView.reloadData()
            }
            
        })
        
    }
        
    
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
