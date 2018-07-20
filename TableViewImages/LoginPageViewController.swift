//
//  LoginPageViewController.swift
//
//  Created by William Thabang Lebyana on 2018/06/14.
//  Copyright © 2018 William Thabang Lebyana. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        let userName = userNameTextField.text;
        let password = passwordTextField.text;

       
        if(userName?.isEmpty)! || (password?.isEmpty)!{
            displayMyAlertMessage(userMessage:"Invalid Details, Please Make sure Password and Username are Correct");
            return
        }
        
        let myURL = NSURL(string: "https://kholofelochoeu.000webhostapp.com/login.php")
        let request = NSMutableURLRequest(url: myURL! as URL)
        request.httpMethod = "POST"
        let postString = "&password=\(String(describing: password)) &userName=\(String(describing: userName))"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if  error != nil{
                print("error = \(String(describing: error))")
                return
            }
            
        
                
                print("response =\(String(describing: response))")
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("ResponseString =\(String(describing: responseString))")
                print(responseString)
            
            DispatchQueue.main.async{
                if(responseString?.isEqual(to: "Successfully Logged-in"))!{
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let navigationController = storyBoard.instantiateViewController(withIdentifier: "root view controller") as! UINavigationController
                    self.present(navigationController, animated: true, completion: nil)
                    
                }
                else
                {
                    
                    self.displayMyAlertMessage(userMessage:"Invalid Details, Please Make sure Password and Username are Correct");
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondViewController = storyboard.instantiateViewController(withIdentifier: "LoginPageViewController") as! LoginPageViewController;
                    self.present(secondViewController, animated: true, completion: nil)
                   
                }
            
        }
        }
        task.resume()
        
        
    }
    

    func displayMyAlertMessage(userMessage:String) -> String {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated: true, completion: nil);
        
        return userMessage;
        
        
    }
    


}
