//
//  ReleaseViewController.swift
//  IONO_App
//
//  Created by Alexandra Medina 

import UIKit

class ReleaseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var kicksTable: UITableView!
    private var viewModel = KicksViewModel()

    // MARK: Web Service URL
    
       let URL_GET_KICKS:String = "http://localhost/MyWebService/api/getkicks.php"
       
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view, typically from a nib.
           
           
    //MARK:  NSURL & NSMutableURLRequest
           let requestURL = NSURL(string: URL_GET_KICKS)

           let request = NSMutableURLRequest(url: requestURL! as URL)
           
    //MARK:  http Method
           request.httpMethod = "GET"
           
           let task = URLSession.shared.dataTask(with: request as URLRequest){
               data, response, error in
               
               if error != nil{
                   print("error is \(String(describing: error))")
                   return;
               }
               
    //MARK:  Parse Response
               do {
                   
                   var kicksJSON: NSDictionary!
                   kicksJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                   
                   
                   let kicks: NSArray = kicksJSON["kicks"] as! NSArray
                   
                   
                   for i in 0 ..< kicks.count{
                       
                     
                       let kickName:String = kicks[i]["shoes_name"] as! String!
                       let kickDate:String = kicks[i]["shoes_date"] as! String!
                       let kickPrice:String = kicks[i]["shoes_price"] as! String!
                       
                      
                      )

                   }
                   
               } catch {
                   print(error)
               }
           }
           //executing the task
           task.resume()
           
       }

private func loadKicks() {
        
        
        viewModel.fetchKicksData { [weak self] in
            self?.kicksTable.dataSource = self
            self?.kicksTable.reloadData()
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! KicksTableViewCell
       
        
        let detail = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(detail)
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



   }
    


