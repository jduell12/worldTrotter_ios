//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Jessica  Duell on 1/10/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController{
     override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view")
    }
    
    var mapView: MKMapView!
    override func loadView() {
        //create map view
        mapView = MKMapView()
        
        //set it as the view for the controller
        view = mapView
        
        //buttons to control which map type is shown
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let segmentedControl = UISegmentedControl(items: [standardString, hybridString, satelliteString])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        //create constraints on the segmentedControl View
        let margins = view.layoutMarginsGuide
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        //activates constraints
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    //action method for click button in the map view
      @objc  func mapTypeChanged(_ segControl: UISegmentedControl){
            switch segControl.selectedSegmentIndex{
                case 0:
                    mapView.mapType = .standard
                case 1:
                    mapView.mapType = .hybrid
                case 2:
                    mapView.mapType = .satellite
                default:
                    break
            }
        }
}
