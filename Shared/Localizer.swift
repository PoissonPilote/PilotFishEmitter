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
    }

    func locate(onSuccess: LocationHandler) {
        onLocationSuccess = onSuccess
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print(newLocation)
        if let handler = onLocationSuccess {
            handler(newLocation.coordinate)
        }
        self.locationManager.stopUpdatingLocation()
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed: \(error)")
    }


}