//
//  SettingsViewController.swift
//  DemandDriver
//
//  Created by CZSM on 16/03/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var settingView: UIView!
    @IBOutlet weak var settingButton: UIButton!
    @IBAction func alertButton(_ sender: Any) {
    }
    @IBAction func settingButton(_ sender: Any) {
    }
    @IBOutlet weak var alertButtton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingView.layer.cornerRadius = settingView.frame.size.width/2
        settingView.layer.borderColor = UIColor.white.cgColor
        settingView.layer.borderWidth = 1
        alertView.layer.cornerRadius = alertView.frame.size.width/2
        alertView.layer.borderColor = UIColor.white.cgColor
        alertView.layer.borderWidth = 1


        // Do any additional setup after loading the view.
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
