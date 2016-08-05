//
//  Localizer.swift
//  PilotFishEmitter
//
//  Created by Martin Delille on 28/07/2016.
//  Copyright © 2016 Phonations. All rights reserved.
//

import Foundation
import CoreLocation

typealias LocationHandler = (_: CLLocationCoordinate2D) -> ()

class Localizer: NSObject, CLLocationManagerDelegate {

    var onLocationSuccess: LocationHandler?

    var locationManager = CLLocationManager()

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        self.locationManager.requestLocation()
//        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }

    var enabled: Bool {
        return CLLocationManager.locationServicesEnabled()
    }

    func locate(onSuccess: LocationHandler) {
        print("locate")
        onLocationSuccess = onSuccess
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        print("locations: \(locations)")
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error: \(error)")
    }

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("\(status.rawValue)")
        guard status == .AuthorizedWhenInUse else { return }
        locationManager.requestLocation()
    }

//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations)
//    }

//    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
//        print(newLocation)
//        if let handler = onLocationSuccess {
//            handler(newLocation.coordinate)
//        }
//        self.locationManager.stopUpdatingLocation()
//    }

//    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
//        print("Failed: \(error.localizedDescription)")
//    }


}