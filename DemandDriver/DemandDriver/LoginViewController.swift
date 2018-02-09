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
    @IBOutlet weak var loginMainView: ViewExtender!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let rectShape = CAShapeLayer()
//        rectShape.bounds = self.loginMainView.frame
//        rectShape.position = self.loginMainView.center
//        rectShape.path = UIBezierPath(roundedRect: self.loginMainView.bounds, byRoundingCorners: [.bottomRight ,.topRight ], cornerRadii: CGSize(width: 130, height: 130)).cgPath
//
////        self.loginMainView.layer.backgroundColor = UIColor(red: 74/255.0, green: 144/255.0, blue: 226/255.0, alpha: 0.5).cgColor
//        self.loginMainView.layer.backgroundColor = UIColor.white.cgColor
//        self.loginMainView.layer.mask = rectShape
//
//        let shadowLayer: CALayer = loginMainView.layer
////        loginMainView.clipsToBounds = false
////        loginMainView.shadowColor = UIColor.red
////        loginMainView.shadowOffset = CGSize(width: 1, height: 1)
//        shadowLayer.shadowOpacity = 5
//        shadowLayer.shadowRadius = 15
//        shadowLayer.shouldRasterize = false
//        shadowLayer.shadowColor = UIColor.red.cgColor
//        shadowLayer.shadowOffset = CGSize(width: 0, height: 1)
//
////        rectShape.addSublayer(shadowLayer)
        
        

        
        let rectShape2 = CAShapeLayer()
        rectShape2.bounds = self.registerButton.frame
        rectShape2.position = self.registerButton.center
        rectShape2.path = UIBezierPath(roundedRect: self.registerButton.bounds, byRoundingCorners: [.bottomRight ,.topRight ], cornerRadii: CGSize(width: 25, height: 25)).cgPath
        
        self.registerButton.layer.backgroundColor = UIColor(red: 74/255.0, green: 144/255.0, blue: 226/255.0, alpha: 0.5).cgColor
        self.registerButton.layer.mask = rectShape2
        
        let rectShape3 = CAShapeLayer()
        rectShape3.bounds = self.registerButtonAsDriver.frame
        rectShape3.position = self.registerButtonAsDriver.center
        rectShape3.path = UIBezierPath(roundedRect: self.registerButtonAsDriver.bounds, byRoundingCorners: [.bottomRight ,.topRight ], cornerRadii: CGSize(width: 25, height: 25)).cgPath
        
        self.registerButtonAsDriver.layer.backgroundColor = UIColor(red: 74/255.0, green: 144/255.0, blue: 226/255.0, alpha: 0.5).cgColor
        self.registerButtonAsDriver.layer.mask = rectShape3
//       registerButton.layer.cornerRadius = registerButton.frame.size.height/3
//        registerButton.clipsToBounds = true
        
       
//        rectShape.backgroundColor = UIColor.darkGray.cgColor
//        rectShape.shadowColor = UIColor.gray.cgColor
//        rectShape.shadowRadius = 15
//        rectShape.shadowOpacity = 100
//        rectShape.borderColor = UIColor.blue.cgColor
//        rectShape.borderWidth = 5
//        
//        let contactShadowSize: CGFloat = 20
//        let shadowPath = CGPath(ellipseIn: CGRect(x: -contactShadowSize,
//                                                  y: -contactShadowSize * 0.5,
//                                                  width: rectShape.bounds.width + contactShadowSize * 2,
//                                                  height: contactShadowSize),
//                                transform: nil)
//
//        rectShape.shadowPath = shadowPath
//        
//        rectShape.shadowPath = UIBezierPath(rect: rectShape.bounds).cgPath
        
        

// new
        
        loginMainView.clipsToBounds = true
        loginMainView.layer.cornerRadius = 58
        if #available(iOS 11.0, *) {
            loginMainView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner ]
        } else {
            // Fallback on earlier versions
        }
        
        let shadowpath = UIBezierPath(roundedRect: self.loginMainView.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 58.0, height: 0.0))
        
        
        
        loginMainView.layer.shadowColor = UIColor(red: 74/255.0, green: 144/255.0, blue: 226/255.0, alpha: 0.5).cgColor
        loginMainView.layer.shadowOffset = CGSize(width: 1, height: 1)  //Here you control x and y
        loginMainView.layer.shadowOpacity = 0.5
        loginMainView.layer.shadowRadius = 15 //Here your control your blur
        loginMainView.layer.masksToBounds =  false
        loginMainView.layer.shadowPath = shadowpath.cgPath
        
        
        
        
        
        
        
        
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

