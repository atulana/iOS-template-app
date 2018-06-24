//
//  ViewController.swift
//  iOSTemplateApp
//
//  Created by Atul Anand on 23/06/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HomePage: UIViewController , CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var placeBtn: UIButton!
    @IBOutlet weak var bikeBtn: UIButton!
    @IBOutlet weak var bookingBtn: UIButton!
    @IBOutlet weak var accountBtn: UIButton!
    @IBOutlet weak var locSearchBtn: UIButton!
    @IBOutlet weak var currentLocBtn: UIButton!
    
    let locationManager = CLLocationManager()
    
    //MARK:- Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.isScrollEnabled = true
        mapView.isZoomEnabled = true
        mapView.mapType = .standard
        
        if let coor = mapView.userLocation.location?.coordinate {
            mapView.centerCoordinate = coor
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- IBAction
    @IBAction func placeBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func bikeBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func bookingBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func accountBtnTapped(_ sender: UIButton) {
        
    }
    
    //MARK:- Custom Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = manager.location?.coordinate
        centerMap(location!)
    }

    func centerMap(_ center : CLLocationCoordinate2D) {
        
        saveCurrentLocation(center)
        
        let span : MKCoordinateSpan = MKCoordinateSpanMake(0.07, 0.07)
        let region : MKCoordinateRegion = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func saveCurrentLocation(_ center : CLLocationCoordinate2D) {
        let place = "\(center.latitude) , \(center.longitude)"
        locSearchBtn.setTitle(place, for: .normal)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        var view : MKPinAnnotationView
        if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView{
            dequeueView.annotation = annotation
            view = dequeueView
        }
        else {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func setupHomePage()
    {
        
    }
}

