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
import FirebaseAuthUI
import FirebaseFirestore
import FirebasePhoneAuthUI

public let currentUser = Auth.auth().currentUser?.uid

class NewLoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet weak var enterCode: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    
    var myverificationID = String()
    
   
    var authHandle: AuthStateDidChangeListenerHandle!
    var tapgesture = UITapGestureRecognizer()
    var Userdefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        phoneNumber.textColor = UIColor.black
        phoneNumber.text = ""
        infoLabel.text = ""
//        registerForKeyboardNotifications()
//        deregisterFromKeyboardNotifications()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func sendCode(_ sender: UIButton) {
        
        let mobileNumber = "+91" + phoneNumber.text!
        
        self.Userdefaults.set(mobileNumber, forKey: "mobileNumber")
        
        print("mobileNumber::::\(mobileNumber)")
        
        sendOTPCode()
     
    }
    
    func sendOTPCode() {
        
        let mymobilenumber = Userdefaults.string(forKey: "mobileNumber")
        
        PhoneAuthProvider.provider().verifyPhoneNumber(mymobilenumber!, uiDelegate: nil, completion:
            {
                (verificationID, error) in
                
                self.Userdefaults.set(verificationID, forKey: "authVerificationID")
                
                if error != nil
                {
                    print ("insde SendCode, there is error")
                    
                    self.infoLabel.text = "Please check the Number"
                    
                    self.enterCode.alpha = 0
                    
                    print("error: \(String(describing: error?.localizedDescription))")
                    
                }
                else
                {
                    print ("code sent")
                    
                    self.infoLabel.text = ""
                    self.phoneNumber.allowsEditingTextAttributes = false
                    self.enterCode.alpha = 1
                    
                
                }
        })
        
    }
    
    @IBAction func resendOTP(_ sender: Any) {
        
        sendOTPCode()
        
    }
    
    func loginusingOTP(OTPtext: String) {
         let db = Firestore.firestore()
        let verificationID = self.Userdefaults.string(forKey: "authVerificationID")

        let credential: PhoneAuthCredential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID!,
                                                                                                    verificationCode: OTPtext)
    Auth.auth().signIn(with: credential)
    {
    (user, error) in
    if error != nil
    {
    print("error: \(String(describing: error?.localizedDescription))")
    }
    else if user != nil
    {
    
    print("Phone number: \(String(describing: user?.phoneNumber))")
    let userInfo = user?.providerData[0]
    print("Provider ID: \(String(describing: userInfo?.providerID))")
    
        var _: DocumentReference? = nil
    
    print("currentUser:::\(String(describing: currentUser))")
    
    db.collection("Userdetails").document(currentUser!).setData([
    "phoneNumber": user?.phoneNumber as Any,
    "UID": currentUser as Any
    
    ]) { err in
    if let err = err {
    print("Error writing document: \(err)")
    } else {
    print("Document successfully written!")
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
    self.present(controller, animated: true, completion: nil)
    }
    }
    
    } else {
    
    print("error::::::")
    
    }
    
    }
    
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        let codestring = enterCode.text
        
        if codestring?.count == 6 {
            
            self.view.endEditing(true)
            
            loginusingOTP(OTPtext: codestring!)
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let codestring = enterCode.text
        
        if codestring?.count == 6 {
            
            self.view.endEditing(true)
            
            loginusingOTP(OTPtext: codestring!)
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let codestring = enterCode.text

        if codestring?.count == 6 {
            
            textField.resignFirstResponder()
            
            loginusingOTP(OTPtext: codestring!)
            
            return true
            
        } else {
            
            print("Enter 6 digit code")
            return true
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        self.view.endEditing(true)
        
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
