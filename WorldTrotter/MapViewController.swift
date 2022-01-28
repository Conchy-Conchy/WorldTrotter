//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Xin Xiong on 2022/1/28.
//

import UIKit
import MapKit   // where MKMapView comes from

class MapViewController: UIViewController {
    var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view.")
    }
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        // set it as *the* view of this view controller
        view = mapView

        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        // see discussion over #selector on https://stackoverflow.com/questions/24007650/selector-in-swift
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)

        /*
         * translatesAutoresizingMaskIntoConstraints
         * - default set to true
         * - If you want to use Auto Layout to dynamically calculate the size and position of your view,
         * you must set this property to false, and then provide a non ambiguous, nonconflicting set of
         * constraints for the view.
         */
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)

        // all anchors are instances of NSLayoutConstraint Anchor
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
//
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)


        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        
        
        /* Chapter 5 Bronze Challenge */
        let PoIView = UIView()
        let PoILabel = UILabel()
        PoILabel.text = "Point of Interest"
        let PoISwitch = UISwitch()
        PoISwitch.setOn(true, animated: true)
        PoIView.translatesAutoresizingMaskIntoConstraints = false
        PoISwitch.translatesAutoresizingMaskIntoConstraints = false
        PoILabel.translatesAutoresizingMaskIntoConstraints = false
        PoISwitch.addTarget(self, action: #selector(PointOfInterestSwitch(_:)), for: .valueChanged)
        PoIView.addSubview(PoILabel)
        PoIView.addSubview(PoISwitch)
//        PoIView.backgroundColor = UIColor.yellow
//        view.insertSubview(PoIView, aboveSubview: segmentedControl)
        view.addSubview(PoIView)
        // if true,扔掉不在范围内的东西
        PoIView.clipsToBounds = true
        
        segmentedControl.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: 32).isActive = true
        PoIView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16).isActive = true
//        PoIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        PoIView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        PoIView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        // 就是因为丢了它调了半夜！
        PoIView.centerYAnchor.constraint(equalTo: PoIView.topAnchor,constant: PoISwitch.frame.height/2).isActive = true
        // center anchor
        PoILabel.centerYAnchor.constraint(equalTo: PoIView.centerYAnchor).isActive = true
        PoISwitch.centerYAnchor.constraint(equalTo: PoIView.centerYAnchor).isActive = true
        // leading
        let PoImargins = PoIView.layoutMarginsGuide
        PoILabel.leadingAnchor.constraint(equalTo: PoImargins.leadingAnchor).isActive = true
        PoISwitch.leadingAnchor.constraint(equalTo: PoILabel.trailingAnchor, constant: 8).isActive = true
        
//        PoILabel.trailingAnchor.constraint(equalTo: PoISwitch.leadingAnchor).isActive = true
//        PoISwitch.trailingAnchor.constraint(equalTo: PoImargins.trailingAnchor).isActive = true
    }
    
//    objc: needed to expose this method to Objective-C runtime
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
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
    
    /* Chapter 5 Bronze Challenge */
    @objc func PointOfInterestSwitch(_ poiSwitch: UISwitch){
        if poiSwitch.isOn {
            print("switch is on=>off")
            mapView.pointOfInterestFilter = MKPointOfInterestFilter(excluding: [])
//            poiSwitch.setOn(false, animated: false)
        }
        else {
            print("switch is off=>on")
            mapView.pointOfInterestFilter = MKPointOfInterestFilter(including: [])
//            poiSwitch.setOn(true, animated: false)
        }
            
    }
}
