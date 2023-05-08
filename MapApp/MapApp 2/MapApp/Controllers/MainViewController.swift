//
//  ViewController.swift
//  MapApp
//
//  Created by tamzimun on 17.06.2022.
//

import UIKit
import MapKit

class MainViewController: UIViewController {
    
    var routeCoordinates: [CLLocation] = []
    
    private let mapView: MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        return map
    }()
    
    private let bottomView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        
        return view
    }()
        
    private var segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl (items: ["Standard","Satelite","Hybrid"])
        segmented.frame = CGRect()
        segmented.selectedSegmentIndex = 0
        segmented.backgroundColor = .clear
        segmented.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        return segmented
        
    }()
    
    @objc func segmentAction(_ sender: UISegmentedControl) {
        
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
    
    let tableView = UITableView()
    
    var places: [Place] = [
        Place.init(title: "Нур-Султан", subtitle: "Байтерек"),
        Place.init(title: "Алматы", subtitle: "Ботаникалык бак")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setMapConstraints()
        setBottomViewConstraints()
        setSegControlConstraints()
        
        setUpNaviagtion()
        setupTableView()
        
        longPress()
    }

    // MARK: - Setup NavigationController
    
    func setUpNaviagtion() {
        tableView.isHidden = true
        navigationItem.title = ""
        self.navigationController?.view.backgroundColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handleOrganizePlace))
    }
    
    @objc func handleOrganizePlace () {
        self.view.bringSubviewToFront(tableView)
        tableView.isHidden.toggle()
    }
    
    
    fileprivate func longPress() {
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressRecognizer.minimumPressDuration = 0.5
        view.addGestureRecognizer(longPressRecognizer)
    }

    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            
        // Alert to add place
        let alert = UIAlertController(title: "Add place", message: "Fill all the fields", preferredStyle: .alert)
                alert.addTextField { (textField:UITextField) in
                    textField.placeholder = "Enter title"
                }
                alert.addTextField { (textField:UITextField) in
                    textField.placeholder = "Enter subtitle"
                }
            alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [self] (action:UIAlertAction) in
                        guard let textField =  alert.textFields?.first else {
                            return
                        }
                        guard let textField2 =  alert.textFields?[1] else {
                            return
                        }
                        if let subtitle = Double(textField2.text!){
                            print(subtitle)
                            savePlace(textField.text!, subtitle)
                        }
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
        
        // Add pin on the map
        let touchLocation = gestureReconizer.location(in: mapView)
        let locationCoordinate = mapView.convert(touchLocation,toCoordinateFrom: mapView)
            
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
        
        mapView.addAnnotation(pin)
        mapView.delegate = self
        
        return
      }
        if gestureReconizer.state != UIGestureRecognizer.State.began { return }
    }
    
    func savePlace(_ name: String, _ gpa: Double){
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "Student", in: managedContext)!
//        let student = NSManagedObject(entity: entity, insertInto: managedContext)
//        student.setValue(name, forKeyPath: "name")
//        student.setValue(gpa, forKeyPath: "gpa")
        
//        do {
//          try managedContext.save()
//            places.append(student)
            tableView.reloadData()
//        } catch let error as NSError {
//          print("Could not save. \(error), \(error.userInfo)")
//        }
    }
    
    func setMapConstraints() {
        view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func setBottomViewConstraints() {
        view.addSubview(bottomView)
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: mapView.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: mapView.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 95).isActive = true
    }
    
    func setSegControlConstraints() {
        view.addSubview(segmentedControl)

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 25).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 65).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -65).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }

    func setupTableView() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(PlaceTableViewCell.self, forCellReuseIdentifier: "PlaceTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as! PlaceTableViewCell
        
        cell.titleLabel.text = places[indexPath.row].title
        cell.subtitleLabel.text = places[indexPath.row].subtitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        85
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            places.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = EditViewController()
        vc.titleField.text = places[indexPath.row].title
        vc.subtitleField.text = places[indexPath.row].subtitle

        vc.editDelegate = self
        vc.cellIndex = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController: EditPlaceDelegate {
    func editPlace(place: Place, index: Int) {
        self.places[index] = place
        tableView.reloadData()
    }
}

extension MainViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "customAnnotation") as? MKPinAnnotationView
        
        if annotationView == nil {
            
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "customAnnotation")
            annotationView?.canShowCallout = true
            annotationView?.animatesDrop = true
            
//            let calloutButton = CustomButton(type: .detailDisclosure)
//
//            guard let title = annotation.title,
//                  let subtitle = annotation.subtitle else { return nil }
//
//            guard let title = title,
//                  let subtitile = subtitle else { return nil }
//
//            calloutButton.title = title
//            calloutButton.subtitle = subtitile
//
//            calloutButton.addTarget(self, action: #selector(infoButtonTapped(_:)), for: .touchUpInside)

//            annotationView!.rightCalloutAccessoryView = calloutButton
            annotationView!.sizeToFit()
        }
        else {
            annotationView!.annotation = annotation
        }
        return annotationView
    }
}
