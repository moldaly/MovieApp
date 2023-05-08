//
//  ViewController.swift
//  MapApp
//
//  Created by tamzimun on 17.06.2022.
//

import UIKit
import MapKit

class MainViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var bottomView: UIView!
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        
        switch index {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}


