//
//  CallDriverMapViewController.swift
//  DemandDriver
//
//  Created by Siva on 07/02/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit
import GoogleMaps

class CallDriverMapViewController: UIViewController {

    @IBOutlet weak var navigationItemList: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 12.8726, longitude: 80.2197, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 12.8726, longitude: 80.2197)
        marker.title = "sathyabama"
        marker.snippet = "Chennai"
        marker.map = mapView
        setNavBar()
    }

    func setNavBar() {
         navigationItemList.title = "Book Appointment"
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
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
 
