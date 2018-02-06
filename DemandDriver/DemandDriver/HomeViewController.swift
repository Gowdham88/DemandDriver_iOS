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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// new proj started
}

