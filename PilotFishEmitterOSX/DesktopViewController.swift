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
import RealmSwift

class DesktopViewController: NSViewController {

    @IBOutlet weak var userTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSTextField!
    @IBOutlet weak var longitudeLabel: NSTextField!
    @IBOutlet weak var latitudeLabel: NSTextField!

    let localizer = Localizer()
    var realm: Realm? = nil
    var packets = [Packet]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.realm = Realm?()
    }

    @IBAction func locate(sender: AnyObject) {
        print("locate")
        self.localizer.locate { (coordinate) in
            print(coordinate)
            self.longitudeLabel.stringValue = String(coordinate.longitude)
            self.latitudeLabel.stringValue = String(coordinate.latitude)

//            let user = slf.userTextField.stringValue
//            let password = self.passwordTextField.stringValue
            let user = "boat-1"
            let password = "aquingooR4yooneizuwuDeekohj7zi"

            let parameters = [
                "x": coordinate.latitude,
                "y": coordinate.longitude,
            ]

            do {
                try self.realm?.write {
                    self.packets.append(Packet(x: coordinate.latitude, y: coordinate.longitude))
                }
            } catch {
                print("\(error)")
            }

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

