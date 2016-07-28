//
//  MobileViewController.swift
//  PilotFishEmitter
//
//  Created by Martin Delille on 10/07/2016.
//  Copyright © 2016 Phonations. All rights reserved.
//

import UIKit
import CoreLocation

class MobileViewController: UIViewController {

    var localizer: Localizer?

    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.localizer = Localizer()

//        if !CLLocationManager.locationServicesEnabled() {
//            let alert = UIAlertController(title: "No localization", message: "You need to activate localization", preferredStyle: .Alert);
//
//            let defaultAction = UIAlertAction.init(title: "Ok", style: .Default, handler: { (action) in
//            })
//
//            alert.addAction(defaultAction)
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func locate(sender: AnyObject) {
        if let lm = self.locationManager {
            lm.delegate = self
            lm.desiredAccuracy = kCLLocationAccuracyBest
            print("startUpdatingLocation")
            lm.startUpdatingLocation()
        }
    }
}

