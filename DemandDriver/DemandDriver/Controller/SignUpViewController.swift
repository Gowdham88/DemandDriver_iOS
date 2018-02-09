//
//  SignUpViewController.swift
//  DemandDriver
//
//  Created by Siva on 09/02/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupMainView: UIView!
    @IBOutlet weak var tickButton: UIButton!
    @IBOutlet weak var tickRoundedImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tickRoundedImage.layer.cornerRadius = tickRoundedImage.frame.size.height/2
        tickRoundedImage.clipsToBounds      = true
        
     addShadowForMainLoginView()
        
      addShadowForLoginButton()

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
