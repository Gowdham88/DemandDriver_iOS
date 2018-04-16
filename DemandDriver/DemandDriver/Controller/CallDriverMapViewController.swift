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

class CallDriverMapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate,UIGestureRecognizerDelegate {
    
    let geocoder = CLGeocoder()
    var locality = ""
    var administrativeArea = ""
    var postalCode = ""
    var country = ""

    
//    var pickerdata1: [String] = [String]()
//    var pickerdata: [String] = [String]()
    let datepicker = UIDatePicker()
   
//    var pickerview = UIPickerView()
//    var pickerview1 = UIPickerView()
//    var pickerdata  =  ["Hourly","Outstation","Valet Parking"]
//    var pickerdata1  =  ["1","2"]


    

    @IBOutlet weak var driverModalTextField: UITextField!
    @IBOutlet weak var carModalTextField: UITextField!
    
    
    @IBOutlet weak var bookLaterTextField: UITextField!
   
    
    @IBAction func tariffButton(_ sender: Any) {
        let storyboard  = UIStoryboard(name: "Login", bundle: nil)
        let vc          = storyboard.instantiateViewController(withIdentifier: "TariffViewController") as! TariffViewController
        self.navigationController?.pushViewController(vc, animated: true)
        //self.present(vc, animated: true, completion: nil)
    }
    
//    @IBOutlet weak var hourdropdown: UIButton!
//    @IBAction func hourdropdown(_ sender: Any) {
//        pickerview = UIPickerView(frame:CGRect(x: 8, y: 8, width: self.view.frame.size.width, height: 200))
//        pickerview.delegate = self
//        pickerview.dataSource = self
//        pickerview.tag = 1
//        driverModalTextField.inputView = pickerview
//
//    }
//    @IBAction func carModalButton(_ sender: Any) {
//        pickerview1 = UIPickerView(frame:CGRect(x: 8, y: 8, width: self.view.frame.size.width, height: 200))
//        pickerview1.delegate = self
//        pickerview1.dataSource = self
//        carModalTextField.inputView = pickerview1
//        pickerview1.tag = 2
//    }
    
    let days = ["Hourly",
                "Outstation",
                "Valet Parking"]
    let number = ["Automatic",
                  "Sedan",
                  "Hatchback",
                  "SUV",
                  "Luxury"
                  ]
    
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    var currentlat = Double()
    var currentlong = Double()
    var lat2 = Double()
    var long2 = Double()
    var address = String()
    var StreetName = String()
    var randomString = String()
    let dayPicker = UIPickerView()
    let numberPicker = UIPickerView()
    var selectedDay: String?
    var selectNumber: String?
    let date = Date()
    let formatter = DateFormatter()
    
    var CurrentDate = UILabel()
    
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
        mkmapView.delegate = self
        mkmapView.mapType = MKMapType.standard
        LocationManager.delegate = self
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.startUpdatingLocation()
       
//        driverModalTextField.isUserInteractionEnabled = false
//        carModalTextField.isUserInteractionEnabled = false
       
        randomString(length: 8)
        createDayPicker()
        createToolbar()
        dayPicker.tag = 1
        numberPicker.tag = 2
        
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        CurrentDate.text = result
    }

    
    func createDayPicker() {
        
        
        dayPicker.delegate = self
        numberPicker.delegate = self
        
        
        driverModalTextField.inputView = dayPicker
        carModalTextField.inputView = numberPicker
        
        //Customizations
        //        dayPicker.backgroundColor = .grey
    }
    
    
    func createToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
        toolBar.barTintColor = .white
        toolBar.tintColor = .blue
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CallDriverMapViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        driverModalTextField.inputAccessoryView = toolBar
        carModalTextField.inputAccessoryView = toolBar
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
        let location = locations[0]
        manager.stopUpdatingLocation()
        
//        let location = locations.last as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
        print("user latitude = \(location.coordinate.latitude)")
        print("user longitude = \(location.coordinate.longitude)")
        currentlat = location.coordinate.latitude
        currentlong = location.coordinate.longitude
       
       

        geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) in
            if (error != nil) {
                print("Error in reverseGeocode")
            }
            
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count > 0 {
                let placemark = placemarks![0]
//                self.StreetName = placemark.thoroughfare!
                self.locality = placemark.locality!
                self.administrativeArea = placemark.administrativeArea!
                self.postalCode = placemark.postalCode!
                self.country = placemark.country!
                
//                print("locality, administrativeArea, country \(self.locality, self.administrativeArea, self.postalCode, self.country)")
                self.address = self.locality + "," + " " + self.administrativeArea + "," + " " + self.postalCode + "," + " " + self.country
                print("address:::\(self.address)")
//                self.addressName()
              
                
                
            }
        })
        
        self.mkmapView.setRegion(region, animated: true)
//        self.addLatLong()
    }
    
    func userLocationString() -> String {
        let userLocationString = "\(locality), \(administrativeArea), \(country)"
        return userLocationString
    }
    
    //User_details table

    func addressName() {
        let DocRef = self.db.collection("User_details").document(currentUser!)
        
        DocRef.updateData([
            "User_Address": self.address,
            "User_Lat": currentlat,
            "User_Long": currentlong
            
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        
    }
    

    
    //Current_booking table
    
    func addressNames() {
        
        let carModelSelected = carModalTextField
        let todayDate = CurrentDate
        let DocRef = self.db.collection("Current_booking").document(randomString)
        
        DocRef.setData([
            "User_Address": self.address,
            "User_Lat": currentlat,
            "User_Long": currentlong,
//            "Car_type" : carModelSelected as Any,
//            "Date": todayDate,
            "User_ID": currentUser as Any
            
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        
    }
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
         randomString = "DD"+"-"+""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
            print("randomString:::::\(randomString)")
        }
        
        return randomString
    }

 
    // User_current_booking table
    
    func bookingID() {
        let DocRef = db.collection("User_current_booking").document(currentUser!)
        
        DocRef.setData([
            "Booking_ID": randomString as Any
            
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
        }
        
    }
    
    
    @IBAction func bookNowButton(_ sender: Any) {
      
        self.addressName()

        self.addressNames()
        self.bookingID()

    }

    
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
    

} //Class

extension CallDriverMapViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == dayPicker {
            return days.count
            
        } else if pickerView == numberPicker{
            return number.count
        }
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == dayPicker {
            return days[row]
            
        } else if pickerView == numberPicker{
            return number[row]
        }
        return ""
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == dayPicker {
            selectedDay = days[row]
            driverModalTextField.text = selectedDay
            self.view.endEditing(false)
        } else if pickerView == numberPicker{
            selectNumber = number[row]
            carModalTextField.text = selectNumber
            self.view.endEditing(false)
        }
    }
    
    
}
 
