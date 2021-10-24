//
//  kaartPagina.swift
//  iThirsty
//
//  Created by Christel Gogaert on 08/09/2019.
//  Copyright © 2019 HoleLottaGangsh*t. All rights reserved.
//

import UIKit
import MapKit

class kaartPagina: UIViewController {

    private let locationManager = CLLocationManager()
    private var currentCoordinate: CLLocationCoordinate2D?
    
    @IBOutlet weak var kaartView: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kaartView.delegate = self
        
        configureLocationServices()
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func configureLocationServices() {
    
    locationManager.delegate = self
    
    let status = CLLocationManager.authorizationStatus()
    if status == .notDetermined {
        locationManager.requestWhenInUseAuthorization()
    }
        else if status == .authorizedWhenInUse{
        beginLocationUpdates(locationManager: locationManager)
        }
    }
    private func beginLocationUpdates(locationManager: CLLocationManager) {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        kaartView.showsUserLocation = true
    }
    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D){
        let zoomRegion = MKCoordinateRegion.init(center: coordinate, latitudinalMeters: 400, longitudinalMeters: 400) // 1000 = 1 km breedte en hoogte vizier
        kaartView.setRegion(zoomRegion, animated: true)
    }
    private func addAnnotations() {
        for automaat in automaatLijst {
            let annotatie = MKPointAnnotation()
            annotatie.title = String(automaat.gebouw)+" \(automaat.verdiep)"
            annotatie.coordinate = automaat.coord
            kaartView.addAnnotation(annotatie)
        }
        
        
    }
}



extension kaartPagina: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else { return }
        
        if currentCoordinate == nil{
            zoomToLatestLocation(with: latestLocation.coordinate)
            addAnnotations()
        }
        currentCoordinate = latestLocation.coordinate
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: manager)
        }
    }
}

extension kaartPagina: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        
        let volgendeP = self.storyboard?.instantiateViewController(withIdentifier: "tweedePaginamap") as! tweedePaginaMap
        
        
        for automaat in automaatLijst {
            if view.annotation?.title == String(automaat.gebouw)+" \(automaat.verdiep)"{
                volgendeP.automaat = automaat
                self.present(volgendeP, animated: true, completion: nil)
                break
            }
        }
   }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation !== kaartView.userLocation{
            var annotationView = kaartView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
    
            if annotationView == nil {
            
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
            }
        
                annotationView?.image = UIImage(named: "logo_transparant")
            
            return annotationView
        }
        else{
            
            return nil
        }
        
        
        
        
    }
    
}

