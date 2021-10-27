//
//  LogOutViewController.swift
//  IONO
//
//  Created by Alexandra Medina on 9/5/21.
//

import UIKit

class LogOutViewController: UIViewController {

    @IBAction func logoutButton(_ sender: Any) {
        
                UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
                UserDefaults.standard.synchronize()
                
                let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "welcomeLogin") as! ViewController4
                self.navigationController?.pushViewController(loginViewController, animated: true)
                self.dismiss(animated: false, completion: nil)
            }
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
                navigationItem.leftBarButtonItem = backButton
                
                
                }
                
            }
        
    

    



