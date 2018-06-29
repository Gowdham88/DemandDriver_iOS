//
//  PersonalInformationViewController.swift
//  DemandDriver
//
//  Created by CZSM on 15/03/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit

class PersonalInformationViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phonenumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func callSwitch(_ sender: Any) {
    }
    @IBAction func textSwitch(_ sender: Any) {
    }
    @IBAction func emailSwitch(_ sender: Any) {
    }
    @IBAction func saveButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.borderColor = UIColor.black.cgColor
        saveButton.layer.borderWidth = 0.5
        saveButton.layer.cornerRadius = 15

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
