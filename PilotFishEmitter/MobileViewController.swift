//
//  MobileViewController.swift
//  PilotFishEmitter
//
//  Created by Martin Delille on 10/07/2016.
//  Copyright © 2016 Phonations. All rights reserved.
//

import UIKit

class MobileViewController: UIViewController {

    var localizer = Localizer()
    let communicator = Communicator()

    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if !self.localizer.enabled {
            let alert = UIAlertController(title: "No localization", message: "You need to activate localization", preferredStyle: .Alert);

            let defaultAction = UIAlertAction.init(title: "Ok", style: .Default, handler: { (action) in
            })

            alert.addAction(defaultAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        self.locate(self)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func locate(sender: AnyObject) {
        self.stateLabel.text = "locate"
        self.localizer.locate { (coordinate) in
            self.longitudeLabel.text = String(coordinate.longitude)
            self.latitudeLabel.text = String(coordinate.latitude)

            self.stateLabel.text = "send"
            self.communicator.send(coordinate.longitude, latitude: coordinate.latitude, depth: 0, paddle: 0, humor: "Fine", callback: { (info) in
                self.stateLabel.text = info
            })
        }
    }
}

