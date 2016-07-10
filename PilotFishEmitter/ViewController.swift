//
//  ViewController.swift
//  PilotFishEmitter
//
//  Created by Martin Delille on 10/07/2016.
//  Copyright © 2016 Phonations. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager? = nil

    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager = CLLocationManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func locate(sender: AnyObject) {
        if let lm = self.locationManager {
            lm.delegate = self
            lm.desiredAccuracy = kCLLocationAccuracyBest
            lm.startUpdatingLocation()
        }
    }

    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        self.longitudeLabel.text = String(newLocation.coordinate.longitude)
        self.latitudeLabel.text = String(newLocation.coordinate.latitude)
    }
}

