//
//  Location.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/13/22.
//

import Foundation
import CoreLocation

func getCoordinates (address: String) -> CLLocationCoordinate2D {
    let geoCoder = CLGeocoder()
    var coords = CLLocationCoordinate2DMake(0,0)
    
    geoCoder.geocodeAddressString(address) { placemarks, error in
        guard let placemark = placemarks?.first else {
            return
        }
        
        guard let lat = placemark.location?.coordinate.latitude else{return}
        
        guard let lon = placemark.location?.coordinate.longitude else{return}
        
        coords = CLLocationCoordinate2DMake(lat, lon)
    }
    return coords
}




//
//  LocationManager.swift
//  OpenMapInSwiftUI
//
//  Created by Michael Haslam on 1/26/21.
//

//import UIKit
//import MapKit
//import CoreLocation
//import Combine

//class LocationManager: NSObject, ObservableObject {
//    lazy var geocoder = CLGeocoder()
//
//    @Published var locationString = ""
//    @Published var invalid: Bool = false
//
//    func openMapWithAddress () {
//
//        geocoder.geocodeAddressString(locationString) { placemarks, error in
//            if let error = error {
//                DispatchQueue.main.async {
//                    self.invalid = true
//                }
//                print(error.localizedDescription)
//            }
//
//            guard let placemark = placemarks?.first else {
//                return
//            }
//
//            guard let lat = placemark.location?.coordinate.latitude else{return}
//
//            guard let lon = placemark.location?.coordinate.longitude else{return}
//
//            let coords = CLLocationCoordinate2DMake(lat, lon)
//
//            let place = MKPlacemark(coordinate: coords)
//
//            let mapItem = MKMapItem(placemark: place)
//            mapItem.name = self.locationString
//            mapItem.openInMaps(launchOptions: nil)
//        }
//
//    }
//}

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

   
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        print(#function, location)
    }
}


