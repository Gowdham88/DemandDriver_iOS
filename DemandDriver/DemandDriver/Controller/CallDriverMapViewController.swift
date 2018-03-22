//
//  CallDriverMapViewController.swift
//  DemandDriver
//
//  Created by Siva on 07/02/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

//import GoogleMaps

class CallDriverMapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

//    @IBOutlet weak var mapview: GMSMapView!
   var ref: DocumentReference? = nil
    let db = Firestore.firestore()

    
    @IBOutlet weak var mkmapView: MKMapView!
    @IBOutlet weak var navigationItemList: UINavigationItem!
    var LocationManager = CLLocationManager()
    let newPin = MKPointAnnotation()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mkmapView.showsUserLocation = true
        mkmapView.isZoomEnabled = true
        mkmapView.isScrollEnabled = true
        mkmapView.mapType = MKMapType.standard
        
        if(CLLocationManager.locationServicesEnabled())
        {
            LocationManager = CLLocationManager()
            LocationManager.delegate = self
            LocationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            LocationManager.requestWhenInUseAuthorization()
            LocationManager.requestAlwaysAuthorization()
            LocationManager.startUpdatingLocation()
        }
    }
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        let lat = location.coordinate.latitude
        let long = location.coordinate.longitude
        let center = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.10, longitudeDelta: 0.10))

        mkmapView.setRegion(region, animated: true)
       
        newPin.coordinate = location.coordinate
        mkmapView.addAnnotation(newPin)
        

        
        db.collection("Users").document(currentUser!).updateData([
            "lat": lat,
            "long": long
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
        }
        
    }
    
    
    
        
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
//        let camera = GMSCameraPosition.camera(withLatitude: 12.8726, longitude: 80.2197, zoom: 6.0)
//        mapview = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
////          view = mapview
//
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: 12.8726, longitude: 80.2197)
//        marker.title = "sathyabama"
//        marker.snippet = "Chennai"
//        marker.map = mapview
//        setNavBar()


//    func setNavBar() {
//         navigationItemList.title = "Book Appointment"
//
//
//    }
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
 
