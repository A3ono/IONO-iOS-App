//
//  RegisterView.swift
//  IONO
//
//  Created by Alexandra Medina on 10/1/21.
//

import Foundation
import UIKit
import Alamofire

class RegisterView: UIViewController {
    
    let URL_USER_REGISTER = URL(string: "http://10.0.1.34/MyWebService/api/register.php")
    
   /* @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fnameTextField: UITextField!
    @IBOutlet weak var lnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var label2Message: UILabel!
*/
    
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
            //printing response
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
    @IBAction func buttonRegister2(_ sender: Any) {
        register()
    }
    
   /* @IBAction func buttonRegister(_ sender: Any) {
        register()
    }
*/
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
