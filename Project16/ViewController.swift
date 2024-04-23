//
//  ViewController.swift
//  Project16
//
//  Created by Stefan Ruzic on 7.3.24..
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let london = Capital(title: "London",coordinate: CLLocationCoordinate2D(latitude: 51.207222, longitude: -0.1275), info: "Home to 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo" ,coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        mapView.addAnnotations([london, oslo, paris, rome, washington])
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        let indetifier = "Capital"
        
        var annonationView = mapView.dequeueReusableAnnotationView(withIdentifier: indetifier)
        
        if annonationView == nil {
            annonationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: indetifier)
            annonationView?.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            annonationView?.rightCalloutAccessoryView = btn
            
        } else {
            annonationView?.annotation = annotation
        }
        return annonationView
        
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac,animated: true)
    }
}

