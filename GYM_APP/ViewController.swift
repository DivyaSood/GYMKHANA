//
//  ViewController.swift
//  GYM_APP
//
//  Created by Divya Sood on 5/8/19.
//  Copyright © 2019 Divya Sood. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

struct MyPlace {
    var name: String
    var lat: Double
    var Long: Double
}

class ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate, GMSAutocompleteViewControllerDelegate,UITextFieldDelegate {
    
    let currentLocationMarker = GMSMarker()
    var locationManager = CLLocationManager()
    var chosenPlace: MyPlace?
    
    let customMarkerWidth: Int = 50
    let customMarkerHeight: Int = 70
    let previewDemoData = [(title: "24 Hour Fitness", img: #imageLiteral(resourceName: "Image3"), price: 10), (title: "Bay Club", img:#imageLiteral(resourceName: "Image1"), price: 20), (title: "Sports Club", img:#imageLiteral(resourceName: "Image2"), price: 20)]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.view.backgroundColor = UIColor.white
        myMapView.delegate=self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        
        setupViews()
        
        initGoogleMaps()
        
        txtFieldSearch.delegate=self
        
    }
    
    //MARK: textfeild
    func textFieldDidBeginEditing(_ textField: UITextField)
        -> Bool {
            let autoCompleteController = GMSAutocompleteViewController()
            autoCompleteController.delegate = self
            
            let filter = GMSAutocompleteFilter()
            autoCompleteController.autocompleteFilter = filter
            
            self.locationManager.startUpdatingLocation()
            self.present(autoCompleteController, animated: true, completion: nil)
            return false
    }
    
    // MARK: GOOGLE AUTO COMPLETE DELEGATE
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        let lat = place.coordinate.latitude
        let long = place.coordinate.longitude
        
        showPartyMarker(lat: lat, long: long)
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 17.0)
        myMapview.camera = camera
        txtFieldSearch.text=place.formattedAddress
        chosenPlace = MyPlace(name: place.formattedAddress!, lat: lat, Long: long)
        let marker=GMSMarker()
        
    }
            
    }
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

