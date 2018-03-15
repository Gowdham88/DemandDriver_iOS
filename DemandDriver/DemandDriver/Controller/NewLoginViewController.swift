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
    
//    func countryPhoneCodePicker(_ picker: MRCountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
//        countryTextField.text = name + " " + phoneCode
//    }
//
    
    

    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    
   
    @IBOutlet weak var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//          CountryPicker.isHidden = true
//          closeButton.isHidden = true
//          CountryPicker.countryPickerDelegate = self
//          CountryPicker.showPhoneNumbers = true
         // CountryPicker.setCountry("Ind")
         // CountryPicker.setCountryByName("India")
        
        

        // Do any additional setup after loading the view.
    }

    @IBAction func sendCode(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Phone Number", message: "Is this your phone number? \n \(phoneNumber.text!)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .default)
        {
            (UIAlertAction) in PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneNumber.text!)
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
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "otp")
                    self.present(vc!, animated: true, completion: nil)
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
