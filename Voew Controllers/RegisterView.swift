//
//  RegisterView.swift
//  IONO
//
//  Created by Alexandra Medina
//

import Foundation
import UIKit
import Alamofire

class RegisterView: UIViewController {
    
    let URL_USER_REGISTER = URL(string: "http://10.0.1.34/MyWebService/api/register.php")

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fnameTextField: UITextField!
    @IBOutlet weak var lnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var label2Message: UILabel!
    
    
    func register() {

        let parameters: Parameters=[
            "email":emailTextField.text!,
            "password":passwordTextField.text!,
            "f_name":fnameTextField.text!,
            "l_name":lnameTextField.text!,
            "phone":phoneTextField.text!
        ]
        
        Alamofire.request(URL_USER_REGISTER!, method: .post, parameters: parameters).responseJSON
        {
            response in
            print(response)
            
            if let result = response.result.value {
                
                let jsonData = result as! NSDictionary
                
                self.label2Message.text = jsonData.value(forKey: "message") as! String?
            }
        }
    }

    
   @IBAction func buttonRegister(_ sender: Any) {
        register()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
