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
import SwiftyJSON

class DesktopViewController: NSViewController {

    @IBOutlet weak var userTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSTextField!
    @IBOutlet weak var longitudeTextField: NSTextField!
    @IBOutlet weak var latitudeTextField: NSTextField!

    let localizer = Localizer()
    var realm: Realm? = nil
    var pool = Pool()

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            self.realm = try Realm()
            //            self.pool = realm?.objects(Pool.self)
        } catch {
            print("\(error)")
        }
        //        self.userTextField.stringValue = self.pool.user
        //        self.passwordTextField.stringValue = self.pool.password
        //            let user = self.userTextField.stringValue
        //            let password = self.passwordTextField.stringValue
    }

    @IBAction func updateCredential(sender: AnyObject) {
        do {
            try self.realm?.write {
                self.pool.user = self.userTextField.stringValue
                self.pool.password = self.passwordTextField.stringValue
            }
        } catch {
            print("\(error)")
        }
    }

    @IBAction func locate(sender: AnyObject) {
        print("locate")
        self.localizer.locate { (coordinate) in
            print(coordinate)
            self.longitudeTextField.stringValue = String(coordinate.longitude)
            self.latitudeTextField.stringValue = String(coordinate.latitude)

            do {
                try self.realm?.write {
                    self.pool.packets.append(Packet(x: coordinate.latitude, y: coordinate.longitude))
                }
            } catch {
                print("\(error)")
            }

            self.communicator.send(coordinate.longitude, coordinate.latitude)
        }
    }
}

