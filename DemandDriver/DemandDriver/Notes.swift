////
////  Notes.swift
////  DemandDriver
////
////  Created by Suraj B on 12/02/2018.
////  Copyright © 2018 Siva. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//
//
//class SignUpPage: UIViewController ,UITextFieldDelegate {
//
//
//
//
//    @IBOutlet weak var first: UITextField!
//
//    @IBOutlet weak var last: UITextField!
//
//    @IBOutlet weak var mail: UITextField!
//
//    @IBOutlet weak var pass: UITextField!
//
//    @IBOutlet weak var passreconfirm: UITextField!
//
//    @IBOutlet weak var dateselect: UIDatePicker!
//    @IBOutlet weak var login: UIButton!
//
////    var dataRef : DocumentReference!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        dataRef = Firestore.firestore().document("user1/profile1")
//        login.backgroundColor = UIColor.white
//        login.layer.borderWidth = 1.0
//        login.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
//        login.layer.cornerRadius = 20
//
//        // Do any additional setup after loading the view.
//        let clouds = UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1)
//        self.mail.delegate = self
//        self.pass.delegate = self
//
//        mail.backgroundColor = .clear
//        mail.tintColor = .white
//        mail.textColor = .white
//        mail.borderStyle = .none
//
//        //mail.attributedPlaceholder = NSAttributedString(string: mail.placeholder!, attributes: [NSForegroundColorAttributeName: clouds])
//
//        let bottomLayerEmail = CALayer()
//        bottomLayerEmail.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.6)
//        bottomLayerEmail.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
//
//        mail.layer.addSublayer(bottomLayerEmail)
//        mail.clipsToBounds = true
//        mail.autocorrectionType = .no
//
//        pass.backgroundColor = .clear
//        pass.tintColor = .white
//        pass.textColor = .white
//        pass.borderStyle = .none
//        //pass.attributedPlaceholder = NSAttributedString(string: pass.placeholder!, attributes: [NSForegroundColorAttributeName: clouds])
//        pass.autocorrectionType = .no
//
//        let bottomLayerPassword = CALayer()
//        bottomLayerPassword.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.6)
//        bottomLayerPassword.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
//        mail.layer.addSublayer(bottomLayerPassword)
//        pass.layer.addSublayer(bottomLayerPassword)
//        pass.clipsToBounds = true
//
//
//
//        // set handlers to text field objects
//        handleTextField()
//
//        // initially disable button
//        disableButton()
//    }
//
//    // Do any additional setup after loading the view.
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    func handleTextField() {
//
//
//        first.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
//        last.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
//        pass.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
//        mail.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
//        passreconfirm.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
//
//
//    }
//
//
//    @objc func textFieldDidChange() {
//        // guard against username, email and password all not being empty
//        guard
//            let email = mail.text, !email.isEmpty,
//            let password = pass.text, !password.isEmpty
//            else {
//                // disable SignUp button if ANY are not empty
//                disableButton()
//                return
//        }
//        // enable SignUp button if they are ALL not empty
//        enableButton()
//    }
//    func disableButton() {
//        login.isEnabled = false
//        login.alpha = 0.2
//    }
//
//
//    func enableButton() {
//        login.isEnabled = true
//        login.alpha = 1.0
//    }
//
//    // MARK: - Dismiss Keyboard
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        mail.resignFirstResponder()
//        pass.resignFirstResponder()
//        first.resignFirstResponder()
//        last.resignFirstResponder()
//        passreconfirm.resignFirstResponder()
//
//        return true
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
//
//
//    @IBAction func login(_ sender: Any) {
//        let name = first.text
//        let lastname = last.text
//        let mailid = mail.text
//        let password = pass.text
//        let passreenter = passreconfirm.text
//
//        save(name: "first", lastname: "last", mail: "mail", pass: "pass", passreconfirm: "passreconfirm")
//
//
//
//        if ((name?.isEmpty)! || (lastname?.isEmpty)! || (mailid?.isEmpty)! || (password?.isEmpty)! || (passreenter?.isEmpty)!)
//        {
//
//            displayAlertMessage(messageToDisplay: "All fields are required to fill in",title: "Alert")
//
//            return
//
//        }
//        if (password != passreenter) {
//
//            displayAlertMessage(messageToDisplay: "Password is mismatch",title: "Alert")
//            return
//        }
//    }
//
//    func isValidEmailAddress(emailAddressString: String) -> Bool {
//
//        var returnValue = true
//        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
//
//        do {
//            let regex = try NSRegularExpression(pattern: emailRegEx)
//            let nsString = emailAddressString as NSString
//            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
//
//            if results.count == 0
//            {
//                returnValue = false
//            }
//
//        } catch let error as NSError {
//            print("invalid regex: \(error.localizedDescription)")
//            returnValue = false
//        }
//
//        return returnValue
//    }
//}
//
//extension SignUpPage {
//
//    //
//
//    func save(name : String,lastname : String,mailid : String,password : String,passreenter : String) {
//
//        let dataToSave : [String: Any] = ["name": name, "lastname": lastname,"mailid" : mailid,"password": password,"passreenter": passreenter]
////        dataRef.setData(dataToSave) { (error) in
////            if let error = error {
//                print("Oh no! Some error \(error.localizedDescription)")
//            }else {
//                print("Data has been saved")
//            }
//        }
//
//
//    }
//
////}
//
//extension SignUpPage {
//
//    // to show alert
//
//    func displayAlertMessage(messageToDisplay: String,title : String)
//    {
//        let alertController = UIAlertController(title: title, message: messageToDisplay, preferredStyle: .alert)
//
//        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
//
//            // Code in this block will trigger when OK button tapped.
//            print("Ok button tapped");
//
//        }
//        alertController.addAction(OKAction)
//        self.present(alertController, animated: true, completion:nil)
//    }
//
//
//
//
//    /*
//     // MARK: - Navigation
//
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destinationViewController.
//     // Pass the selected object to the new view controller.
//     }
//     */
//
//    func save(name : String,lastname : String,mail : String,pass : String,passreconfirm : String) {
//
//        let dataToSave : [String: Any] = ["first": first, "last": last,"mail" : mail,"pass": pass,"passreconfirm": passreconfirm]
////        dataRef.setData(dataToSave) { (error) in
//            if let error = error {
//                print("Oh no! Some error \(error.localizedDescription)")
//            }else {
//                print("Data has been saved")
//            }
//        }
//    }
//
//}

