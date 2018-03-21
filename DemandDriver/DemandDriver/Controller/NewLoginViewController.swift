//
//  NewLoginViewController.swift
//  DemandDriver
//
//  Created by Paramesh on 12/03/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import UserNotifications





class NewLoginViewController: UIViewController {
    

    
    

    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
//          CountryPicker.isHidden = true
//          closeButton.isHidden = true
//          CountryPicker.countryPickerDelegate = self
//          CountryPicker.showPhoneNumbers = true
         // CountryPicker.setCountry("Ind")
         // CountryPicker.setCountryByName("India")
        
        countryTextField.text = "+91"
//        registerForKeyboardNotifications()
//        deregisterFromKeyboardNotifications()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func sendCode(_ sender: UIButton) {
        
        let mobileNumber = countryTextField.text! + phoneNumber.text!
        
        print("mobileNumber::::\(mobileNumber)")
        
        let alert = UIAlertController(title: "Phone Number", message: "Is this your phone number? \n \(mobileNumber)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .default)
        {
            (UIAlertAction) in PhoneAuthProvider.provider().verifyPhoneNumber(mobileNumber)
            {
                (verificationID, error) in
                if error != nil
                {
                    print ("insde SendCode, there is error")
                    
                    print("error: \(String(describing: error?.localizedDescription))")
                    
                }
                else
                {
                    print ("else  SendCode, going to move to next page")
                    let defaults = UserDefaults.standard
                    defaults.set(verificationID, forKey: "authVID")
                    //self.performSegue(withIdentifier: "code", sender: Any?.self)
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "otp") as! otp
                    vc.phonestring = mobileNumber
                    self.present(vc, animated: true, completion: nil)
                }
            }
        }
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)

        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func registerForKeyboardNotifications(){
//        //Adding notifies on keyboard appearing
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//    }
//
//    func deregisterFromKeyboardNotifications(){
//        //Removing notifies on keyboard appearing
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//    }
//    @objc func keyboardWasShown(notification: NSNotification){
//        //Need to calculate keyboard exact size due to Apple suggestions
//        self.scrollView.isScrollEnabled = true
//        var info = notification.userInfo!
//        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
//        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
//
//        self.scrollView.contentInset = contentInsets
//        self.scrollView.scrollIndicatorInsets = contentInsets
//
//        var aRect : CGRect = self.view.frame
//        aRect.size.height -= keyboardSize!.height
//        if let activeField = self.activeField {
//            if (!aRect.contains(activeField.frame.origin)){
//                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
//            }
//        }
//    }
//
//    @objc func keyboardWillBeHidden(notification: NSNotification){
//        //Once keyboard disappears, restore original positions
//        var info = notification.userInfo!
//        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
//        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -keyboardSize!.height, 0.0)
//        self.scrollView.contentInset = contentInsets
//        self.scrollView.scrollIndicatorInsets = contentInsets
//        self.view.endEditing(true)
//        self.scrollView.isScrollEnabled = false
//    }
    func textFieldDidBeginEditing(textField: UITextField!)
    {
        phoneNumber = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField!)
    {
        phoneNumber = nil
    }


//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//
//        CountryPicker.isHidden = false
//        closeButton.isHidden = false
//        return false
//    }
    
    //picker view
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
