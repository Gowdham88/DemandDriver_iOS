//
//  SignUpViewController.swift
//  DemandDriver
//
//  Created by Siva on 09/02/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate {
    
    let imagePicker = UIImagePickerController()

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupMainView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var uploadImg: NSLayoutConstraint!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var uploadImage: ViewExtender!
    @IBOutlet weak var tickRoundedImage: UIButton!
    @IBOutlet weak var viewArrow: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showPop))
        uploadImage.addGestureRecognizer(tapGesture)
        uploadImage.isUserInteractionEnabled = true
        
        let profileGesture = UITapGestureRecognizer(target: self, action: #selector(signupTap))
        viewArrow.addGestureRecognizer(profileGesture)
        viewArrow.isUserInteractionEnabled = true

        //Hide Keyboard
self.hideKeyboardOnTap(#selector(self.dismissKeyboard))
        // Do any additional setup after loading the view.
        viewArrow.layer.cornerRadius = viewArrow.frame.size.height/2
        viewArrow.clipsToBounds      = true
        viewArrow.layer.shadowColor = UIColor.white.cgColor
        viewArrow.layer.shadowOffset = CGSize(width: 2, height: 2)
        viewArrow.layer.shadowOpacity = 0.9
        viewArrow.layer.shadowRadius = 2.0 //Here your control your blur
        
//        tickRoundedImage.layer.shadowColor = UIColor.white.cgColor
//        //         arrowButton.layer.shadowColor = UIColor.red.cgColor
//        tickRoundedImage.layer.shadowOffset = CGSize(width: 1, height: 1)
//        tickRoundedImage.layer.shadowOpacity = 5
//        tickRoundedImage.layer.shadowRadius = 10
//        tickRoundedImage.layer.masksToBounds =  false
       // tickRoundedImage.layer.masksToBounds =  true
       // tickRoundedImage.backgroundColor = UIColor.clear
//        tickButton.backgroundColor = UIColor.clear
//        tickButton.layer.shadowOpacity = 5.0
//        tickButton.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
//        tickButton.layer.shadowRadius = 10.0
//        tickButton.layer.shadowColor = UIColor.yellow.cgColor
//        tickButton.layer.masksToBounds =  true
        //view.backgroundColor = UIColor.grayColor()

   //     tickRoundedImage.layer.shadowPath = shadowPath.cgPath
//        tickButton.layer.shadowColor = UIColor.white.cgColor
//        tickButton.layer.shadowOffset = CGSize(width: 1, height: 1)
//        tickButton.layer.shadowOpacity = 5
//        tickButton.layer.shadowRadius = 10
//        tickButton.layer.masksToBounds =  false
        addShadowForMainLoginView()
        addShadowForLoginButton()

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == nameTextField){
            nameTextField.resignFirstResponder()
        }
        else if(textField == emailTextField){
            emailTextField.resignFirstResponder()
        }
        else if(textField == passwordTextField){
            passwordTextField.resignFirstResponder()
        }
        else if(textField == addressTextField){
            addressTextField.resignFirstResponder()
        }
        else if(textField == phoneNumberTextField){
            phoneNumberTextField.resignFirstResponder()
        }
        return true
    }
    
    func addShadowForLoginButton() {
        
        //for login button
        loginButton.layer.cornerRadius = loginButton.frame.size.height/2
        loginButton.clipsToBounds = true
        
        if #available(iOS 11.0, *) {
            loginButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner ]
        } else {
            // Fallback on earlier versions
        }
        
        let shadowpath2 = UIBezierPath(roundedRect: self.loginButton.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 58.0, height: 0.0))
        
        
        
        loginButton.layer.shadowColor = UIColor(red: 12/255.0, green: 189/255.0, blue: 239/255.0, alpha: 0.5).cgColor
        loginButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 10 //Here your control your blur
        loginButton.layer.masksToBounds =  false
        loginButton.layer.shadowPath = shadowpath2.cgPath
    }
    
    func addShadowForMainLoginView() {
        // for main login view
        
        signupMainView.clipsToBounds = true
        signupMainView.layer.cornerRadius = signupMainView.frame.size.height/2
        if #available(iOS 11.0, *) {
            signupMainView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner ]
        } else {
            // Fallback on earlier versions
        }
        
        let shadowpath = UIBezierPath(roundedRect: self.signupMainView.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: signupMainView.frame.size.height/2, height: 0.0))
        
        
        
        signupMainView.layer.shadowColor = UIColor(red: 12/255.0, green: 189/255.0, blue: 239/255.0, alpha: 0.5).cgColor
        signupMainView.layer.shadowOffset = CGSize(width: 1, height: 1)
        signupMainView.layer.shadowOpacity = 0.5
        signupMainView.layer.shadowRadius = 10 //Here your control your blur
        signupMainView.layer.masksToBounds =  false
        signupMainView.layer.shadowPath = shadowpath.cgPath

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginBtnTap(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
       
            }
    @IBAction func tickBtntap(_ sender: Any) {
       

    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    //Display Alert messasge
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
    //Dismiss keyboard
    func hideKeyboardOnTap(_ selector: Selector) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: selector)
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func isvalidEmail(email: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailReg).evaluate(with: email)
    }
    
    @objc func showPop(){
        
        let Alert: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let CamAction: UIAlertAction = UIAlertAction(title: "Camera", style: .default) { ACTION in
            self.openCamera()

        }
        
        let GallAction: UIAlertAction = UIAlertAction(title: "Gallery", style: .default){ ACTION in
            
            self.handlePhotoSelection()
            
        }
        
        let CancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        CancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        
        
        
        Alert.addAction(CamAction)
        
        Alert.addAction(GallAction)
        
        Alert.addAction(CancelAction)
        
        present(Alert, animated: true, completion: nil)
        
    }
    func openCamera() {
        
        if(UIImagePickerController .isSourceTypeAvailable(.camera))
            
        {
            self.imagePicker.sourceType = .camera
            
            self.imagePicker.delegate = self
       
        }
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    func handlePhotoSelection() {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true)
        
    }
    @IBAction func arrowtap(_ sender: Any) {
        signupTap()
    }
    @objc func signupTap(){
        
        let name = nameTextField.text
        let email = emailTextField.text!.lowercased()
        let password = passwordTextField.text
        let address = addressTextField.text
        let phoneNumber = phoneNumberTextField.text
        
        let finalEmail = email.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if finalEmail.isEmpty{
            print("Email field is empty")
        } else {
            if (isvalidEmail(email: finalEmail)){
                print("Valid email address")
            } else {
                displayAlertMessage(messageToDisplay: "Enter a valid email address",title: "Invalid email")
                print("Invalid email address")
            }
        }
        
        
        if (name?.isEmpty)! || (email.isEmpty) || (password?.isEmpty)! || (address?.isEmpty)! || (phoneNumber?.isEmpty)! {
            displayAlertMessage(messageToDisplay: "Fill all the fields",title: "Alert")
            return
        }
        if (password != password) {
            
            displayAlertMessage(messageToDisplay: "Password is mismatch",title: "Alert")
            return
        }
    }
 
}
extension SignUpViewController: UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            uploadImage.image = image
//            selectedImage = image
            
        }
        dismiss(animated: true)
        
    }
    
}


