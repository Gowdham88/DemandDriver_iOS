//
//  LoginViewController.swift
//  DemandDriver
//
//  Created by Siva on 07/02/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
//    let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
//    var phoneTest = NSPredicate()
    @IBOutlet weak var sampleView: UIView!
    
    @IBOutlet weak var registerButtonAsDriver: UIButton!
    @IBOutlet weak var registerButton: UIButton!
//    @IBOutlet weak var loginMainView: ViewExtender!
    
    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var loginMainView: UIView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var pwdText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardOnTap(#selector(self.dismissKeyboard))
// Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
// for main login view
        
        loginMainView.clipsToBounds = true
        loginMainView.layer.cornerRadius = 80
        if #available(iOS 11.0, *) {
            loginMainView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner ]
        } else {
            // Fallback on earlier versions
        }
        
        let shadowpath = UIBezierPath(roundedRect: self.loginMainView.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 58.0, height: 0.0))
        
        
        
        loginMainView.layer.shadowColor = UIColor(red: 12/255.0, green: 189/255.0, blue: 239/255.0, alpha: 0.5).cgColor
        loginMainView.layer.shadowOffset = CGSize(width: 1, height: 1)
        loginMainView.layer.shadowOpacity = 0.5
        loginMainView.layer.shadowRadius = 15 //Here your control your blur
        loginMainView.layer.masksToBounds =  false
        loginMainView.layer.shadowPath = shadowpath.cgPath

        
        // for register button
        
        registerButton.clipsToBounds = true
        registerButton.layer.cornerRadius = 32
        if #available(iOS 11.0, *) {
            registerButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner ]
        } else {
            // Fallback on earlier versions
        }
        
        let registerButtonshadow = UIBezierPath(roundedRect: self.registerButton.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 58.0, height: 0.0))
        
        
        
        registerButton.layer.shadowColor = UIColor(red: 12/255.0, green: 189/255.0, blue: 239/255.0, alpha: 0.5).cgColor
        registerButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        registerButton.layer.shadowOpacity = 0.5
        registerButton.layer.shadowRadius = 5 //Here your control your blur
        registerButton.layer.masksToBounds =  false
        registerButton.layer.shadowPath = registerButtonshadow.cgPath
        
        // for register as driver button
        
        registerButtonAsDriver.clipsToBounds = true
        registerButtonAsDriver.layer.cornerRadius = 32
        if #available(iOS 11.0, *) {
            registerButtonAsDriver.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner ]
        } else {
            // Fallback on earlier versions
        }
        
        let registerButtonasDrivershadow = UIBezierPath(roundedRect: self.registerButtonAsDriver.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 58.0, height: 0.0))
        
        
        
        registerButtonAsDriver.layer.shadowColor = UIColor(red: 12/255.0, green: 189/255.0, blue: 239/255.0, alpha: 0.5).cgColor
        registerButtonAsDriver.layer.shadowOffset = CGSize(width: 1, height: 1)
        registerButtonAsDriver.layer.shadowOpacity = 0.5
        registerButtonAsDriver.layer.shadowRadius = 5
        registerButtonAsDriver.layer.masksToBounds =  false
        registerButtonAsDriver.layer.shadowPath = registerButtonasDrivershadow.cgPath
        
        
        arrowButton.layer.shadowColor = UIColor.white.cgColor
//         arrowButton.layer.shadowColor = UIColor.red.cgColor
        arrowButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        arrowButton.layer.shadowOpacity = 5
        arrowButton.layer.shadowRadius = 10
        arrowButton.layer.masksToBounds =  false
   
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func arrowTap(_ sender: Any) {
        
        let phNumber = emailText.text
        let password = pwdText.text
        
        
        
        if (phNumber?.isEmpty)! {
            displayAlertMessage(messageToDisplay: "All fields are required to fill in",title: "Alert")
                        return
            }
        if (password?.isEmpty)! {
            displayAlertMessage(messageToDisplay: "All fields are required to fill in",title: "Alert")
            return
        }
        
        
}
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func validate(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
   
}//class
extension LoginViewController {
    
    // to show alert
    
    func displayAlertMessage(messageToDisplay: String,title : String)
    {
        let alertController = UIAlertController(title: title, message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
}
}
extension LoginViewController {
    func hideKeyboardOnTap(_ selector: Selector) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: selector)
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}




