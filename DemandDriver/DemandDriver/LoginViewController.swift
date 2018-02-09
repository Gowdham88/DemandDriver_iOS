//
//  LoginViewController.swift
//  DemandDriver
//
//  Created by Siva on 07/02/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var sampleView: UIView!
    
    @IBOutlet weak var registerButtonAsDriver: UIButton!
    @IBOutlet weak var registerButton: UIButton!
//    @IBOutlet weak var loginMainView: ViewExtender!
    
    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var loginMainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

