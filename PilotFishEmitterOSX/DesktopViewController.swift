//
//  DesktopViewController.swift
//  PilotFishEmitterOSX
//
//  Created by Martin Delille on 28/07/2016.
//  Copyright © 2016 Phonations. All rights reserved.
//

import Cocoa
import CoreLocation

class DesktopViewController: NSViewController {

    @IBOutlet weak var longitudeLabel: NSTextField!
    @IBOutlet weak var latitudeLabel: NSTextField!
    
    var localizer = Localizer()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func locate(sender: AnyObject) {
        print("locate")
        self.localizer.locate { (coordinate) in
            print(coordinate)
            self.longitudeLabel.stringValue = String(coordinate.longitude)
            self.latitudeLabel.stringValue = String(coordinate.latitude)
        }
    }
}

