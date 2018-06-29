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
    
    let geocoder = CLGeocoder()
    var locality = ""
    var administrativeArea = ""
    var country = ""

    
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
        pickerdata1  =  ["1","2"]
        carModalTextField.inputView = pickerview1
        pickerview1.tag = 2
    }

    
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
        mkmapView.delegate = self
        mkmapView.mapType = MKMapType.standard
        LocationManager.delegate = self
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.startUpdatingLocation()
       
        driverModalTextField.isUserInteractionEnabled = false
        carModalTextField.isUserInteractionEnabled = false
       
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //   if pickerview.tag == 1 {
            return pickerdata.count
//        } else if pickerview1.tag == 2{
//            return pickerdata1.count
//        }
//       return 1
    }
        
    
    func pickerView( _ : UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
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
            pickerView.isHidden = true
        } else if pickerview1.tag == 2{
          carModalTextField.text = pickerdata1[row]
            pickerview1.isHidden = true
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
        let location = locations[0]
        manager.stopUpdatingLocation()
        
        geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) in
            if (error != nil) {
                print("Error in reverseGeocode")
            }
            
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count > 0 {
                let placemark = placemarks![0]
                self.locality = placemark.locality!
                self.administrativeArea = placemark.administrativeArea!
                self.country = placemark.country!
                
                print("locality, administrativeArea, country \(self.locality, self.administrativeArea, self.country)")
            }
        })
    }
    
    func userLocationString() -> String {
        let userLocationString = "\(locality), \(administrativeArea), \(country)"
        return userLocationString
    }
    

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
 
