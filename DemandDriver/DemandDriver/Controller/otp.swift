//
//  otp.swift
//  DemandDriver
//
//  Created by Suraj B on 09/02/2018.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseAuthUI
import FirebasePhoneAuthUI



class otp: UIViewController {

    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var imgTop: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var otpView: UIView!
    @IBOutlet weak var otpText: UITextField!
    @IBOutlet weak var resetView: UIView!
    @IBOutlet weak var resetlbl: UILabel!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginLbl: UILabel!
    @IBOutlet weak var btmView: UIView!
    @IBOutlet weak var btmImg: UIImageView!
    
    let db = Firestore.firestore()

    var authHandle: AuthStateDidChangeListenerHandle!

    override func viewDidLoad() {
        super.viewDidLoad()
      addShadowForLoginLabel()
      addShadowForResetView()
      addShadowOTPview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addShadowForLoginLabel() {
        
        //for login label
        loginView.layer.cornerRadius = loginView.frame.size.height/2
        loginView.clipsToBounds = true
        
        if #available(iOS 11.0, *) {
            loginView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner ]
        } else {
            // Fallback on earlier versions
        }
        
        let shadowpath2 = UIBezierPath(roundedRect: self.loginView.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 58.0, height: 0.0))
        
        
        
        loginView.layer.shadowColor = UIColor(red: 12/255.0, green: 189/255.0, blue: 239/255.0, alpha: 0.5).cgColor
        loginView.layer.shadowOffset = CGSize(width: 1, height: 1)
        loginView.layer.shadowOpacity = 0.5
        loginView.layer.shadowRadius = 10 //Here your control your blur
        loginView.layer.masksToBounds =  false
        loginView.layer.shadowPath = shadowpath2.cgPath
    }
    
    func addShadowForResetView() {
        
        //for resetView
        resetView.layer.cornerRadius = resetView.frame.size.height/2
        resetView.clipsToBounds = true
        
        if #available(iOS 11.0, *) {
            resetView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner ]
        } else {
            
        }
        
        let shadowpath2 = UIBezierPath(roundedRect: self.resetView.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 58.0, height: 0.0))
        
        
        
        resetView.layer.shadowColor = UIColor(red: 12/255.0, green: 189/255.0, blue: 239/255.0, alpha: 0.5).cgColor
        resetView.layer.shadowOffset = CGSize(width: 1, height: 1)
        resetView.layer.shadowOpacity = 0.5
        resetView.layer.shadowRadius = 10 //Here your control your blur
        resetView.layer.masksToBounds =  false
        resetView.layer.shadowPath = shadowpath2.cgPath
    }
    
    func addShadowOTPview(){
        
        //for OTP View
        otpView.layer.cornerRadius = otpView.frame.size.height/2
        otpView.clipsToBounds = true
        
        if #available(iOS 11.0, *) {
            otpView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner ]
        } else {
            
        }
        
        let shadowpath2 = UIBezierPath(roundedRect: self.otpView.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 58.0, height: 0.0))
        
        
        
        otpView.layer.shadowColor = UIColor(red: 12/255.0, green: 189/255.0, blue: 239/255.0, alpha: 0.5).cgColor
        otpView.layer.shadowOffset = CGSize(width: 1, height: 1)
        otpView.layer.shadowOpacity = 0.5
        otpView.layer.shadowRadius = 10 //Here your control your blur
        otpView.layer.masksToBounds =  false
        otpView.layer.shadowPath = shadowpath2.cgPath
        
    }
    
    @IBAction func loginbtn(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        let credential: PhoneAuthCredential = PhoneAuthProvider.provider().credential(withVerificationID: defaults.string(forKey: "authVID")!,
                                                                                      verificationCode: otpText.text!)
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
                
                let currentUser = Auth.auth().currentUser?.uid
                var ref: DocumentReference? = nil

                let docRef =  self.db.collection("Users").document(currentUser!)
                print("currentUser:::\(String(describing: currentUser))")
                print("docRef:::\(String(describing: docRef))")

                docRef.getDocument { (documents, error) in
                    
                    if let document = documents {
//                        print("Document data: \(document)")
                        print("already exists")
                        
                        
                    } else {
                        print("Document does not exist")
                    }
//                    if document != nil {
////                        print("Document data: \(document.data())")
//                        print("already exists")
//
//                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                        let controller = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
//                        self.present(controller, animated: true, completion: nil)
//
//                    } else {
//                        print("Document does not exist")
//                        print("insert data:::::")
//                        let currentUser = Auth.auth().currentUser?.uid
//
//                        var ref: DocumentReference? = nil
//                        ref = self.db.collection("Users").addDocument(data: [
//                            "phoneNumber"   : user?.phoneNumber as Any
//
//                        ]) { err in
//                            if let err = err {
//
//                                print("Error adding document: \(err)")
//
//                            } else {
//
//                                print("Document added with ID: \(ref!.documentID)")
//                                let storyboard  = UIStoryboard(name: "Login", bundle: nil)
//                                let vc          = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
//                                self.navigationController?.pushViewController(vc, animated: true)
//
//                            }
//                        }
//
//                    }
                }
                
        

                
//                var ref: DocumentReference? = nil
//                ref = self.db.collection("Users").addDocument(data: [
//                                        "phoneNumber"   : user?.phoneNumber as Any
//
//                                    ]) { err in
//                                        if let err = err {
//
//                                            print("Error adding document: \(err)")
//
//                                        } else {
//
//                                            print("Document added with ID: \(ref!.documentID)")
//
//                                        }
//                                    }
//
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let controller = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
//                self.present(controller, animated: true, completion: nil)

//                self.hasUserSignedIn()
                
            } else {
                
                    
                    
                    
                }


                
                
                
                
            }
            
        }

    
        
    
    
//
    
//    func hasUserSignedIn() {
//
//        authHandle = Auth.auth().addStateDidChangeListener { [unowned self] auth, user in
//
//            if user == nil {
//
//                print("insert data:::::")
//                var ref: DocumentReference? = nil
//
//                ref = self.db.collection("Users").addDocument(data: [
//                    "phoneNumber"   : user?.phoneNumber as Any
//
//                ]) { err in
//                    if let err = err {
//
//                        print("Error adding document: \(err)")
//
//                    } else {
//
//                        print("Document added with ID: \(ref!.documentID)")
//                        let storyboard  = UIStoryboard(name: "Login", bundle: nil)
//                        let vc          = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
//                        self.navigationController?.pushViewController(vc, animated: true)
//
//                    }
//                }
//
//
//            } else {
//
//                print("PoneNumber:::::: already phone number exist")
//
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let controller = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
//                self.present(controller, animated: true, completion: nil)
//
//
//            }
//
//        }
//
//    }
    

    

   

}//class
