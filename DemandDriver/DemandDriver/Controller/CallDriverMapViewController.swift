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

class CallDriverMapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    var pickerdata1: [String] = [String]()
    var pickerdata: [String] = [String]()
    let datepicker = UIDatePicker()
    var pickerview = UIPickerView()
    
    var pickerview1 = UIPickerView()
 

    @IBOutlet weak var driverModalTextField: UITextField!
    @IBOutlet weak var carModalTextField: UITextField!
    
    
    @IBOutlet weak var bookLaterTextField: UITextField!
   
    
    @IBAction func tariffButton(_ sender: Any) {
        let storyboard  = UIStoryboard(name: "Login", bundle: nil)
        let vc          = storyboard.instantiateViewController(withIdentifier: "TariffViewController") as! TariffViewController
        self.navigationController?.pushViewController(vc, animated: true)
        //self.present(vc, animated: true, completion: nil)
    }
    @IBOutlet weak var hourdropdown: UIButton!
    @IBAction func hourdropdown(_ sender: Any) {
        pickerview = UIPickerView(frame:CGRect(x: 8, y: 8, width: self.view.frame.size.width, height: 200))
        pickerview.delegate = self
        pickerview.dataSource = self
        pickerdata  =  ["Hourly","Outstation","Valet Parking"]
        pickerview.tag = 1
        driverModalTextField.inputView = pickerview
       
    }
    @IBAction func carModalButton(_ sender: Any) {
        pickerview1 = UIPickerView(frame:CGRect(x: 8, y: 8, width: self.view.frame.size.width, height: 200))
        pickerview1.delegate = self
        pickerview1.dataSource = self
        pickerdata1  =  [" STAR","STAR AUTOMATIC","ACCENT","ACCENT AUTOMATIC","ACCORD","ALTO","ALTO 800","ALTO K10","ALTO K10 AUTOMATIC","AMBASSADOR","AUDI","AUDI AUTOMATIC","BMW","BMW AUTOMATIC","BALENO","BENZ AUTOMATIC","BOLERO","CRV","CRV AUTOMATIC","CAMRY","CAMRY AUTOMATIC","CHEVROLET AVEO","CHEVROLET BEAT","CHEVROLET CAPTIVA","CHEVROLET CAPTIVA AUTOMATIC","CHEVROLET CRUZE","CHEVROLET CRUZE AUTOMATIC","CHEVROLET ENJOY","CHEVROLET OPTRA","CHEVROLET SAIL","CHEVROLET SAIL SEDAN","CHEVROLET SPARK","CHEVROLET TRAILBLAZER","CHEVROLET UVA","CIVIC","CIVIC AUTOMATIC","COROLA","COROLA AUTOMATIC","DAEWOOD CIELO","DUSTER","ELANTRA","ELANTRA AUTOMATIC","ENDEOVAR","ERTIGA","FERRARI","FIAT AVVENTURA","FIAT LINEA","FIAT PALIO","FIAT PUNTO","FIAT SIENNA","FIAT UNO","FORCE ONE SUV","FORD CLASSIC","FORD ECO SPORT","FORD ECO SPORT AUTOMATIC","FORD ESCORT","FORD FIESTA","FORD FIGO","FORD FIGO ASPIRE","FORD FUSION","FORD IKON","FORD MONDEO","FORTUNER","FORTUNER AUTOMATIC","GETZ","GRAND VITARA","HONDA AMAZE","HONDA AMAZE AUTOMATIC","HONDA BRIO","HONDA BRIO AUTOMATIC","HONDA CITY","HONDA CITY AUTOMATIC","HONDA JAZZ","HONDA JAZZ AUTOMATIC","HONDA MOBILIO","HUMMER","HYUNDAI CRETA","HYUNDAI EON","HYUNDAI EON SPORT","HYUNDAI SANTA FE","HYUNDAI SANTA FE AUTOMATIC","HYUNDAI TUCSON","HYUNDAI XCENT","HYUNDAI XCENT AUTOMATIC","HYUNDAI GRAND I10","I10","I10 AUTOMATIC","I10 AUTOMATIC","I10 GRAND","I20","I20 AUTOMATIC","INDICA","INDICA VISTA","INDIGO","INDIGO CS","INDIGO GLX","INDIGO MANZA","INDIGO MARINA","INNOVA","ISUZU MU7","JAGUAR","JAGUAR AUTOMATIC","JEEP","LAMBORGHINI","LANCER","LAND ROVER","LANDCRUSIER","LEXUS","LOGAN","LORRY","MAHINDRA E20","MAHINDRA QUANTO","MAHINDRA REXCENT","MAHINDRA VERITO","MARUTI 1000","MARUTI 800","MARUTI CELERIO","MARUTI CELERIO","MARUTI CELERIO AUTOMATIC","MARUTI CIAZ","MARUTI ECHO","MARUTI ESTEEM","MARUTI XCROSS","MATIZ","MERCEDES BENZ","MINI COOPER","NANO, NISSAN DATSUN GO","NISSAN MICRA","NISSAN MICRA AUTOMATIC","NISSAN SUNNY","NISSAN TERRANO","NISSAN TIANA AUTOMATIC","NISSAN XTRAIL","NISSAN XTRAIL AUTOMATIC","OMNI VAN","OPEL ASTRA","OPEL CORSA","OUT LAND","PAJERO","PALIO","PRADA","QUALIS","RANGE ROVER","REBOOKING","RENAULT DUSTER","RENAULT KOLEOS","RENAULT KWID","RENAULT LODGY","RENAULT PULSE","RENAULT SCALA","RITZ","RITZ AUTOMATIC","ROLLS ROYCE","SANTRO","SANTRO AUTOMATIC","SANTRO XING","SANTRO XING AUTOMATIC","SCORPIO","SKODA","SKODA CITIGO","SKODA LAURA","SKODA LAURA AUTOMATIC","SKODA OCTAVIA","SKODA OCTAVIA AUTOMATIC","SKODA RAPID","SKODA RAPID AUTOMATIC","SKODA SUPERB","SKODA SUPERB AUTOMATIC","SKODA YETI","SKODA YETI AUTOMATIC","SONATA","SONATA AUTOMATIC","SWIFT","SWIFT DZIRE","SWIFT DZIRE AUTOMATIC","SX 4","TATA ARIA","TATA BOLT","TATA DICOR","TATA MAGIC","TATA NANO","TATA SAFARI","TATA STORM","TATA SUMO","TATA VENTURE","TATA WINGER","TATA XENON","TATA ZETZ","TATA ZETZ AUTOMATIC","TAVERA","TEMPO TRAVELLAR","TERRACON","TOYOTA ALTIS","TOYOTA ALTIS AUTOMATIC","TOYOTA ETIOS","TOYOTA ETIOS LIVA","TOYOTA PRIUS","TOYOTA VOVLO","TOYOTA XLUSIVE","TOYOTA YARIS","VALET PARKING","VERNA","VERNA AUTOMATIC","VERNA FLUDIC","VERSA","VOLKSWAGEN BEETLE","VOLKSWAGEN JETTA","VOLKSWAGEN JETTA AUTOMATIC","VOLKSWAGEN PASSAT","VOLKSWAGEN PASSAT AUTOMATIC","VOLKSWAGEN POLO","VOLKSWAGEN POLO AUTOMATIC","VOLKSWAGEN VENTO","VOLKSWAGEN VENTO AUTOMATIC","WAGON R","WAGON R AUTOMATIC","XUV 500","XYLO","ZEN ESTILO","ZEN MARUTI"]
        carModalTextField.inputView = pickerview1
        pickerview1.tag = 2
        
    }
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
       
        driverModalTextField.isUserInteractionEnabled = false
        carModalTextField.isUserInteractionEnabled = false
       
        
        
        
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
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       if pickerview.tag == 1 {
            return pickerdata.count
        } else if pickerview1.tag == 2{
            return pickerdata1.count
        }
        return 1
    }
        
    
    func pickerview( _ : UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if pickerview.tag == 1 {
            return pickerdata[row]
        } else if pickerview1.tag == 2{
            return pickerdata1[row]
        }
        return ""
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerview.tag == 1 {
            
        driverModalTextField.text = pickerdata[row]
        } else if pickerview1.tag == 2{
          carModalTextField.text = pickerdata1[row]
        }
        
        self.view.endEditing(true)
    }
    //date picker
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        showDatePicker()
        return true
    }
    func showDatePicker(){
        //Formate Date
        datepicker.datePickerMode = .date
        datepicker.date = Date()

        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()

        //done button & cancel button
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        bookLaterTextField.inputAccessoryView = toolbar
        bookLaterTextField.inputView = datepicker

    }
    @objc func donedatePicker(){

        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        bookLaterTextField.text = formatter.string(from: datepicker.date)
        self.view.endEditing(true)
    }

    @objc func cancelDatePicker(){
        self.view.endEditing(true)
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
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
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
      
        
            db.collection("Userdetails").document(currentUser!).setData([
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
 
