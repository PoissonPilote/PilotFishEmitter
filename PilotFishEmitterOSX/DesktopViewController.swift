//
//  DesktopViewController.swift
//  PilotFishEmitterOSX
//
//  Created by Martin Delille on 28/07/2016.
//  Copyright © 2016 Phonations. All rights reserved.
//

import Cocoa
import CoreLocation
import Alamofire

class DesktopViewController: NSViewController {

    @IBOutlet weak var userTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSTextField!
    @IBOutlet weak var longitudeLabel: NSTextField!
    @IBOutlet weak var latitudeLabel: NSTextField!

    let localizer = Localizer()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func locate(sender: AnyObject) {
        print("locate")
        self.localizer.locate { (coordinate) in
            print(coordinate)
            self.longitudeLabel.stringValue = String(coordinate.longitude)
            self.latitudeLabel.stringValue = String(coordinate.latitude)

            let user = self.userTextField.stringValue
            let password = self.passwordTextField.stringValue

            let parameters = [
                "x": coordinate.longitude,
                "y": coordinate.latitude,
            ]

            Alamofire.request(.POST, "http://www.projetpoissonpilote.com/api/path", parameters: parameters)
                .validate(contentType: ["application/json"])
                .authenticate(user: user, password: password)
                .responseJSON(completionHandler: { (response) in
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data)     // server data
                    print(response.result)   // result of response serialization
                })
        }
    }
}

