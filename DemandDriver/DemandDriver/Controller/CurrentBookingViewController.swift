//
//  CurrentBookingViewController.swift
//  DemandDriver
//
//  Created by CZSM on 15/03/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit

class CurrentBookingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   

    @IBOutlet weak var currentBookTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

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
    //tableview datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentBooking", for: indexPath)as! CurrentBookingTableViewCell
        cell.nameLabel.text = "Name :"
        cell.userNameLabel.text = "suraj"
        cell.userLabel.text = "Driver"
        cell.bookLabel.text = "29thJuly2016&12.15pm"
        cell.userImage.image = UIImage(named:"user image")
        cell.userImage.layer.cornerRadius = (cell.userImage.frame.size.width)  / 2
        cell.userImage.layer.masksToBounds = true
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

}
