//
//  ViewController2.swift
//  IONO
//
//  Created by Alexandra Medina on 9/5/21.
//

import UIKit

class ViewController2: UIViewController {

    @IBAction func logoutButton(_ sender: Any) {
        
        //removing values from default
                UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
                UserDefaults.standard.synchronize()
                
                //switching to login screen
                let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "welcomeLogin") as! ViewController4
                self.navigationController?.pushViewController(loginViewController, animated: true)
                self.dismiss(animated: false, completion: nil)
            }
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                //hiding back button
                let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
                navigationItem.leftBarButtonItem = backButton
                
                
                }
                
            }
        
    

    



