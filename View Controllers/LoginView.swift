//
//  LoginView.swift
//  IONO
//
//  Created by Alexandra Medina
//

import UIKit
import Foundation
import Alamofire


class LoginView: UIViewController {
    

let URL_USER_LOGIN = URL(string: "http://10.0.1.34/MyWebService/api/login.php")

//MARK:  Store default User values
let defaultValues = UserDefaults.standard

//MARK:  Connected views
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
 //MARK:  User Login Function 
    func login(){

    let parameters: Parameters=[
        "email":emailTextField.text!,
        "password":passwordTextField.text!
    ]
    
    //MARK:  post request
    Alamofire.request(URL_USER_LOGIN!, method: .post, parameters: parameters).responseJSON
        {
            response in
            print(response)
            
    //MARK:  Getting the json value from the server
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                
                //if there is no error
                if(!(jsonData.value(forKey: "error") as! Bool)){
                    
                    //getting the user from response
                    let user = jsonData.value(forKey: "user") as! NSDictionary
                    
                    //getting user values
                    let userId = user.value(forKey: "id") as! Int
                    let userEmail = user.value(forKey: "email") as! String
                    let userPhone = user.value(forKey: "phone") as! String
                    
                    //saving user values to defaults
                    self.defaultValues.set(userId, forKey: "userid")
                    self.defaultValues.set(userEmail, forKey: "useremail")
                    self.defaultValues.set(userPhone, forKey: "userphone")
                    
                    //switching the screen
                    let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "firstViewController") as! firstView
                                            self.navigationController?.pushViewController(profileViewController, animated: true)
                                            
                                            self.dismiss(animated: false, completion: nil)

                }


                else{
                    //error message in case of invalid credential
                    self.labelMessage.text = "Invalid username or password"
                }
            }
    }
        
}
    
    
    @IBAction func loginSubmitBTN(_ sender: Any) {
        login()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


}

}
