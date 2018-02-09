//
//  SplashScreenControllerViewController.swift
//  DemandDriver
//
//  Created by Suraj B on 09/02/2018.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit
import AVFoundation

class SplashScreenControllerViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          perform(#selector(SplashScreenControllerViewController.nav), with: nil, afterDelay: 5)
    }
    
    @objc func nav() {
//                performSegue(withIdentifier: "rama", sender: self)
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        self.present(controller, animated: true, completion: nil)
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

