//
//  LoginViewController.swift
//  DemandDriver
//
//  Created by Siva on 07/02/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mainView.layer.masksToBounds = false
        mainView.layer.shadowColor   = UIColor(red: 62/255.0, green: 136/255.0, blue: 226/255.0, alpha: 0.40).cgColor
        mainView.layer.shadowOpacity = 1
        mainView.layer.shadowOffset = CGSize(width: 0, height: 0)
        mainView.layer.shadowRadius = 10
        
        
        bottomView.layer.masksToBounds = false
        bottomView.layer.shadowColor   = UIColor(red: 62/255.0, green: 136/255.0, blue: 226/255.0, alpha: 0.40).cgColor
        bottomView.layer.shadowOpacity = 1
        bottomView.layer.shadowOffset = CGSize(width: 0, height: 0)
        bottomView.layer.shadowRadius = 10
//        mainView.layer.cornerRadius = 10
//        mainView.clipsToBounds = true
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
