//
//  ViewController.swift
//  MapApp4
//
//  Created by Aida Moldaly on 27.06.2022.
//

import UIKit
import CoreData
import MapKit

class MainViewController: UIViewController {
    
    var coreDataPlaces: [NSManagedObject] = []
    
    var title1: String = ""
    var subtitle1: String = ""
    
    let pin = MKPointAnnotation()
    
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
    
    var forward: UIButton = {
        let button = UIButton()
        button.setTitle("▶︎", for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(handleForwardContact), for: .touchUpInside)
        return button
    }()
    
    var backward: UIButton = {
        let button = UIButton()
        button.setTitle("◀︎", for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(handleBackwardContact), for: .touchUpInside)
        return button
    }()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        convertValuesFromCoreDate()
        
        mapView.register(MKPinAnnotationView.self, forAnnotationViewWithReuseIdentifier: "customAnnotation")
        mapView.delegate = self
        
        loadPlaces()
        
        setMapConstraints()
        setBottomViewConstraints()
        setSegControlConstraints()
        
        setUpNaviagtion()
        setupTableView()
        
        longPress()
        
    }
    
    func convertValuesFromCoreDate() {
//        if coreDataPlaces.isEmpty != true { return }
        for object in coreDataPlaces {
            let pin = MKPointAnnotation()
            pin.coordinate.longitude = object.value(forKeyPath: "longitude") as! CLLocationDegrees
            pin.coordinate.latitude = object.value(forKeyPath: "latitude") as! CLLocationDegrees
            pin.title = object.value(forKeyPath: "title") as? String
            pin.subtitle = object.value(forKeyPath: "subtitle") as? String
            mapView.addAnnotation(pin)
//            pinAnnotations.append(pin)
        }
    }
    
    var index: Int = 0
    
    @objc func handleForwardContact() {
        
//        for item in coreDataPlaces.indices {
        if index > 0 && index < coreDataPlaces.count{
            let place = coreDataPlaces[index + 1]
            let longitude1 = place.value(forKeyPath: "longitude") as? Double
            let latitude1 = place.value(forKeyPath: "latitude") as? Double
            
            mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude1!, longitude: longitude1!), span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)), animated: false)
        }
            
//        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleBackwardContact() {

        if index > 0 && index < coreDataPlaces.count{
            let place = coreDataPlaces[index - 1]
            let longitude1 = place.value(forKeyPath: "longitude") as? Double
            let latitude1 = place.value(forKeyPath: "latitude") as? Double
            
            mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude1!, longitude: longitude1!), span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)), animated: false)
        }
        
        navigationController?.popViewController(animated: true)
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
        loadPlaces()
        tableView.isHidden.toggle()
    }

    fileprivate func longPress() {
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressRecognizer.minimumPressDuration = 0.5
        view.addGestureRecognizer(longPressRecognizer)
    }

    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
        
            // Add pin
            let touchLocation = gestureReconizer.location(in: mapView)
            let locationCoordinate = mapView.convert(touchLocation,toCoordinateFrom: mapView)
            
            pin.coordinate = CLLocationCoordinate2D(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
            
            
            // Alert to add place
            
            let alert = UIAlertController(title: "Add place", message: "Fill all the fields", preferredStyle: .alert)
            alert.addTextField { (textField:UITextField) in
                textField.placeholder = "Enter title"
            }
            alert.addTextField { (textField:UITextField) in
                textField.placeholder = "Enter subtitle"
            }
            alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [self] (action:UIAlertAction) in
                guard let textField =  alert.textFields?.first, ((alert.textFields?.first?.hasText) != nil) else {
                    return
                }
                guard let textField2 =  alert.textFields?[1], ((alert.textFields?[1].hasText) != nil) else {
                    return
                }
                
                pin.title = textField.text
                pin.subtitle = textField2.text
                
                mapView.addAnnotation(pin)
                savePlace(pin.title!, pin.subtitle!, pin.coordinate.longitude,   pin.coordinate.latitude)
            }))
            self.present(alert, animated: true, completion: nil)
            
    
        return
      }
        if gestureReconizer.state != UIGestureRecognizer.State.began { return }
    }
    
    func loadPlaces(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Place")
        
        do {
            coreDataPlaces = try managedContext.fetch(fetchRequest)
            
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    //Добавить место в CoreData
    func savePlace(_ title: String,
                   _ subtitle: String,
                   _ longitude: Double,
                   _ latitude: Double)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Place", in: managedContext)!
        let place = NSManagedObject(entity: entity, insertInto: managedContext)
        
        place.setValue(title, forKeyPath: "title")
        place.setValue(subtitle, forKeyPath: "subtitle")
        place.setValue(longitude, forKeyPath: "longitude")
        place.setValue(latitude, forKeyPath: "latitude")
        
        do {
           
            try managedContext.save()
            
            coreDataPlaces.append(place)
            tableView.reloadData()
            
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    //Удалить место с CoreData
    func deletePlace(_ title: String?, _ subtitle: String?, _ longitude: Double?, _ latitude: Double?){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Place")
        
        let p1 = NSPredicate(format: "title == %@", title!)
        let p2 = NSPredicate(format: "subtitle == %@", subtitle!)
        let p3 = NSPredicate(format: "longitude == %lf", longitude!)
        let p4 = NSPredicate(format: "latitude == %lf", latitude!)
        
        let p_and = NSCompoundPredicate(type: .and, subpredicates: [p1, p2, p3, p4])
        fetchRequest.predicate = p_and
        do{
            let results = try managedContext.fetch(fetchRequest)
            let data = results.first
            managedContext.delete(data!)
            try managedContext.save()
        }catch {
            print ("fetch task failed", error)
        }
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
        view.addSubview(forward)
        view.addSubview(segmentedControl)
        view.addSubview(backward)
        
        backward.translatesAutoresizingMaskIntoConstraints = false
        backward.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 25).isActive = true
        backward.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20).isActive = true
        backward.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: backward.topAnchor).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: backward.trailingAnchor, constant: 25).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        
        forward.translatesAutoresizingMaskIntoConstraints = false
        forward.topAnchor.constraint(equalTo: backward.topAnchor).isActive = true
        forward.leadingAnchor.constraint(equalTo: segmentedControl.trailingAnchor, constant: 20).isActive = true
        forward.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20).isActive = true
        forward.heightAnchor.constraint(equalToConstant: 32).isActive = true
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
        coreDataPlaces.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as! PlaceTableViewCell
        let place = coreDataPlaces[indexPath.row]
        cell.titleLabel.text = place.value(forKeyPath: "title") as? String
        cell.subtitleLabel.text = place.value(forKeyPath: "subtitle") as? String
        
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

            let place = coreDataPlaces[indexPath.row]
            let title = place.value(forKeyPath: "title") as? String
            let subtitle = place.value(forKeyPath: "subtitle") as? String
            let longitude = place.value(forKeyPath: "longitude") as? Double
            let latitude = place.value(forKeyPath: "latitude") as? Double
            
            pin.subtitle = subtitle
            pin.title = title
            pin.coordinate.longitude = longitude!
            pin.coordinate.latitude = latitude!
            
            deletePlace(title, subtitle, longitude, latitude)
            coreDataPlaces.remove(at: indexPath.row)
            
            mapView.removeAnnotation(pin)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.sendSubviewToBack(tableView)
        let place = coreDataPlaces[indexPath.row]
        let longitude1 = place.value(forKeyPath: "longitude") as? Double
        let latitude1 = place.value(forKeyPath: "latitude") as? Double
        
        mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude1!, longitude: longitude1!), span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)), animated: false)
        
    }
}


extension MainViewController: EditPlaceDelegate {
    func editPlace(title: String, subtitle: String) {
        title1 = title
        subtitle1 = subtitle
        tableView.reloadData()
    }
}


extension MainViewController: MKMapViewDelegate {
    
    @objc func infoButtonTapped(){
        let vc = EditViewController()
        
        vc.titleField.text = title1
        vc.subtitleField.text = subtitle1
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

//        if annotation is MKUserLocation { return nil }

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "customAnnotation") as? MKPinAnnotationView

        if annotationView != nil {

            print("my nil is")
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "customAnnotation")
            annotationView?.canShowCallout = true
            annotationView?.animatesDrop = true

            let calloutButton = UIButton(type: .detailDisclosure)

            guard let title = annotation.title,
                  let subtitle = annotation.subtitle else { return nil }

            guard let title = title,
                  let subtitile = subtitle else { return nil }

            title1 = title
            subtitle1 = subtitile

            calloutButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)

            annotationView!.rightCalloutAccessoryView = calloutButton
            annotationView!.sizeToFit()
        }
        else {
            
            annotationView!.annotation = annotation
            
        }
        return annotationView
    }
}




