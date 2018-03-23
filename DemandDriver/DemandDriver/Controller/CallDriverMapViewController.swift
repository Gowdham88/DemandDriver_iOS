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

class CallDriverMapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate,UIGestureRecognizerDelegate{

//    @IBOutlet weak var mapview: GMSMapView!
   var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    var currentlat = Double()
    var currentlong = Double()
    var lat2 = Double()
    var long2 = Double()
    
    
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
        LocationManager.delegate = self
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.startUpdatingLocation()
//        let tgr = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureHandler))
//        tgr.delegate = self
//        mkmapView.addGestureRecognizer(tgr)
//        let location = CLLocation(latitude: touchMapCoordinate.latitude, longitude: touchMapCoordinate.longitude)
//
//        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
//
//            // Place details
//            var placeMark: CLPlacemark!
//            placeMark = placemarks?[0]
//
//            // Address dictionary
//            print(placeMark.addressDictionary)
//
//            // Location name
//            if let locationName = placeMark.addressDictionary!["Name"] as? NSString {
//                print(locationName)
//            }
//
//            // Street address
//            if let street = placeMark.addressDictionary!["Thoroughfare"] as? NSString {
//                print(street)
//            }
//
//            // City
//            if let city = placeMark.addressDictionary!["City"] as? NSString {
//                print(city)
//            }
//
//            // Zip code
//            if let zip = placeMark.addressDictionary!["ZIP"] as? NSString {
//                print(zip)
//            }
//
//            // Country
//            if let country = placeMark.addressDictionary!["Country"] as? NSString {
//                print(country)
//            }
//
//        })
        
//        func tapGestureHandler(tgr: UITapGestureRecognizer)
//    {
//        let touchPoint = tgr.location(in: mkmapView)
//        let touchMapCoordinate = mkmapView.convert(touchPoint, toCoordinateFrom: mkmapView)
//        print("tapGestureHandler: touchMapCoordinate = \(touchMapCoordinate.latitude),\(touchMapCoordinate.longitude)")
//    }
 
//   func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//
//        if status == .authorizedWhenInUse || status == .authorizedAlways {
//
//             LocationManager.startUpdatingLocation()
//
//        }
//    }
    }
  
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        let lat = location.coordinate.latitude
        let long = location.coordinate.longitude
        let center = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//        let userLocation:CLLocation = locations[0] as CLLocation
        
          manager.stopUpdatingLocation()
//        let lat = userLocation.coordinate.latitude
//        let long = userLocation.coordinate.longitude
//        let coordinations = CLLocationCoordinate2D(latitude: lat,longitude: long)
//        let span = MKCoordinateSpanMake(0.2,0.2)
//        let region = MKCoordinateRegion(center: coordinations, span: span)
        print("current lat:",lat)
        print("current long:",long)
        currentlat = lat
        currentlong = long

        mkmapView.setRegion(region, animated: true)
       
        newPin.coordinate = location.coordinate
        mkmapView.addAnnotation(newPin)
    

        
//        db.collection("Users").document(currentUser!).setData([
//            "lat": lat,
//            "long": long
//            ]) { err in
//                if let err = err {
//                    print("Error updating document: \(err)")
//                } else {
//                    print("Document successfully updated")
//                }
//        }
    }
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        // Remove all annotations
        self.mkmapView.removeAnnotations(mapView.annotations)
        //        let center = mapView.centerCoordinate
        //        // Add new annotation
        //        let annotation = MKPointAnnotation()
        //        let lat1 = mapView.centerCoordinate.latitude
        //        let long1 = mapView.centerCoordinate.longitude
        //        mapView.centerCoordinate = CLLocationCoordinate2D(latitude: lat1, longitude: long1)
        //      //  let mapView.centerCoordinate = CLLocationCoordinate2D(latitude: lat1,longitude: long1 )
        ////        let region = MKCoordinateRegion(center: mapView.centerCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        ////        mkmapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        let lat1 = mapView.centerCoordinate.latitude
        let long1 = mapView.centerCoordinate.longitude
        annotation.coordinate = mapView.centerCoordinate
        print("annotationCoordinate latitude::::::\(lat1)")
        print("annotationCoordinate longitude::::::\(long1)")
        lat2 = lat1
        long2 = long1

        annotation.title = "title"
        annotation.subtitle = "subtitle"
        self.mkmapView.addAnnotation(annotation)
    }

//
    @IBAction func bookNowButton(_ sender: Any) {
      
        
            db.collection("Users").document(currentUser!)
            .collection("Current Booking").document(currentUser!).setData([
                "Currentlat": currentlat,
                "Currentlong": currentlong,
                "Desinationlat": lat2,
                "Desinationlong": long2,
                "UID" : currentUser as Any])
        { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }

        }
    }
    //    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil
//        }
//
//        let reuseId = "pin"
//        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
//        pinView?.animatesDrop = true
//        if pinView == nil {
//            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//            pinView?.isDraggable = true
//        }
//        else {
//            pinView?.annotation = annotation
//        }
//
//        return pinView
//    }
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
//        if newState == MKAnnotationViewDragState.ending {
//            let droppedAt = view.annotation?.coordinate
//            print(droppedAt!)
//        }
//    }
    
//    func updateLocationoordinates(coordinates:CLLocationCoordinate2D) {
//        let destinationMarker = GMSMarker()
//        if destinationMarker == nil
//        {
//            destinationMarker = GMSMarker()
//            destinationMarker.position = coordinates
//            let image = UIImage(named:"map marker")
//            destinationMarker.icon = image
//            destinationMarker.map = self.mkmapView
//            destinationMarker.appearAnimation = kGMSMarkerAnimationPop
//        }
//        else
//        {
//            CATransaction.begin()
//            CATransaction.setAnimationDuration(1.0)
//            destinationMarker.position =  coordinates
//            CATransaction.commit()
//        }
//    }
//
//    // Camera change Position this methods will call every time
//    func mapView(mapView: GMSMapView, didChangeCameraPosition position: GMSCameraPosition) {
//        let destinationLocation = CLLocation()
//        if self.mapGesture == true
//        {
//            destinationLocation = CLLocation(latitude: position.target.latitude,  longitude: position.target.longitude)
//            destinationCoordinate = destinationLocation.coordinate
//            updateLocationoordinates(destinationCoordinate)
//        }
//    }
    
    
    
    
        
        
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
 
