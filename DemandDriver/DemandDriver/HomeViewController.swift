//
//  ViewController.swift
//  DemandDriver
//
//  Created by Siva on 06/02/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var nestedCenterRoundView: UIView!
    @IBOutlet weak var centerRoundedView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        centerRoundedView.layer.cornerRadius = centerRoundedView.frame.size.height/2
        centerRoundedView.clipsToBounds      = true
        
        nestedCenterRoundView.layer.cornerRadius = nestedCenterRoundView.frame.size.height/2
        nestedCenterRoundView.clipsToBounds      = true
       
        
        view1.layer.cornerRadius = 10
        view1.clipsToBounds      = true
        
        view2.layer.cornerRadius = 10
        view2.clipsToBounds      = true
        
        view3.layer.cornerRadius = 10
        view3.clipsToBounds      = true
        
        view4.layer.cornerRadius = 10
        view4.clipsToBounds      = true

        
//        // corner radius
//        view1.layer.cornerRadius = 10
//
////        // border
////        view1.layer.borderWidth = 1.0
////        view1.layer.borderColor = UIColor.black.cgColor
////
//        // shadow
//        view1.layer.shadowColor = UIColor(red: 62/255.0, green: 136/255.0, blue: 226/255.0, alpha: 0.20).cgColor
//        view1.layer.shadowOffset = CGSize(width: 3, height: 3)
//        view1.layer.shadowOpacity = 0.7
//        view1.layer.shadowRadius = 4.0
        
        view1.layer.masksToBounds = false
        view1.layer.shadowColor   = UIColor(red: 62/255.0, green: 136/255.0, blue: 226/255.0, alpha: 0.20).cgColor
        view1.layer.shadowOpacity = 1
        view1.layer.shadowOffset = CGSize(width: 0, height: 0)
        view1.layer.shadowRadius = 10
        
        view2.layer.masksToBounds = false
        view2.layer.shadowColor   = UIColor(red: 62/255.0, green: 136/255.0, blue: 226/255.0, alpha: 0.20).cgColor
        view2.layer.shadowOpacity = 1
        view2.layer.shadowOffset = CGSize(width: 0, height: 0)
        view2.layer.shadowRadius = 10
        
        view3.layer.masksToBounds = false
        view3.layer.shadowColor   = UIColor(red: 62/255.0, green: 136/255.0, blue: 226/255.0, alpha: 0.20).cgColor
        view3.layer.shadowOpacity = 1
        view3.layer.shadowOffset = CGSize(width: 0, height: 0)
        view3.layer.shadowRadius = 10
        
        view4.layer.masksToBounds = false
        view4.layer.shadowColor   = UIColor(red: 62/255.0, green: 136/255.0, blue: 226/255.0, alpha: 0.20).cgColor
        view4.layer.shadowOpacity = 1
        view4.layer.shadowOffset = CGSize(width: 0, height: 0)
        view4.layer.shadowRadius = 10
        
        centerRoundedView.layer.masksToBounds = false
        centerRoundedView.layer.shadowColor   = UIColor(red: 62/255.0, green: 136/255.0, blue: 226/255.0, alpha: 0.20).cgColor
        centerRoundedView.layer.shadowOpacity = 1
        centerRoundedView.layer.shadowOffset = CGSize(width: 0, height: 0)
        centerRoundedView.layer.shadowRadius = 10
        
        nestedCenterRoundView.layer.masksToBounds = false
        nestedCenterRoundView.layer.shadowColor   = UIColor(red: 62/255.0, green: 136/255.0, blue: 226/255.0, alpha: 0.20).cgColor
        nestedCenterRoundView.layer.shadowOpacity = 1
        nestedCenterRoundView.layer.shadowOffset = CGSize(width: 0, height: 0)
        nestedCenterRoundView.layer.shadowRadius = 10
        
         // gestures
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        view1.isUserInteractionEnabled = true
        view1.addGestureRecognizer(tapGestureRecognizer)
        
        setNavBar()
    }
    func setNavBar() {
        
    }
    @objc func imageTapped (tapGestureRecognizer: UITapGestureRecognizer) {
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        let vc          = storyboard.instantiateViewController(withIdentifier: "CallDriverMapViewController") as! CallDriverMapViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

