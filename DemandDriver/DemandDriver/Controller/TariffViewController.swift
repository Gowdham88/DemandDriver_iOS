//
//  TariffViewController.swift
//  DemandDriver
//
//  Created by CZSM on 14/03/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit

class TariffViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tariffarray = [String]()
    var valuearray = [String]()
    var valuearray1 = [String]()
    var valuearray2 = [String]()
    var costarray = [String]()
    var costarray1 = [String]()
    var costarray2 = [String]()
    
    @IBAction func backBarButton(_ sender: Any) {
        let storyboard  = UIStoryboard(name: "Login", bundle: nil)
        let vc          = storyboard.instantiateViewController(withIdentifier: "CallDriverMapViewController") as! CallDriverMapViewController
        self.dismiss(animated: true, completion: nil)
        //self.present(vc, animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tariffarray = ["CITY PACKAGE","HOURLY-ECONOMIC","HOURLY-PREMIUM","VALET-PARKING"]
        valuearray = ["Min 12 Hours","Min 4 Hours","Min 4 Hours","Min 5 Hours"]
        valuearray1 = ["Extra per hour","Extra per hour","Extra per hour","Extra per hour"]
        valuearray2 = ["Night Charges","Night Charges","Night Charges","Night Charges"]
        costarray = ["Rs. 650.00","Rs. 280.00","Rs. 300.00","Rs. 500.00"]
        costarray1 = ["Rs. 50.00","Rs. 50.00","Rs. 50.00","Rs. 50.00"]
        costarray2 = ["Rs. 0.00","Rs. 0.00","Rs. 0.00","Rs. 0.00"]
        tableView.backgroundColor = UIColor.blue
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tariffarray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Tarifftableviewcell" )as! TariffTableViewCell
        let index = indexPath.row
        cell.tariffLabel.text = tariffarray[index]
        cell.valueLabel.text = valuearray[index]
        cell.valueLabel1.text = valuearray1[index]
        cell.valueLabel2.text = valuearray2[index]
        cell.costLabel.text = costarray[index]
        cell.costLabel1.text = costarray1[index]
        cell.costLabel2.text = costarray2[index]
        print("valuelabel:",valuearray)
        print("costlabel:",costarray)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
