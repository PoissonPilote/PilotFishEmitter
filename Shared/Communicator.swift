//
//  Communicator.swift
//  PilotFishEmitter
//
//  Created by Martin Delille on 05/08/2016.
//  Copyright © 2016 Phonations. All rights reserved.
//

import Foundation
import Alamofire

class Communicator {


    func send(longitude: Double, latitude: Double) {
        //            let user = self.userTextField.stringValue
        //            let password = self.passwordTextField.stringValue
        let user = "boat-1"
        let password = "aquingooR4yooneizuwuDeekohj7zi"

        let dateISO8601: String = NSDate.ISOStringFromDate(NSDate())
        let parameters: [String: AnyObject] = [
            "boat-1": [
                "x": latitude,
                "y": longitude
            ],
            "datetime": dateISO8601
        ]


        Alamofire.request(.POST, "http://www.projetpoissonpilote.com/api/datum", parameters: parameters)
            .validate(contentType: ["application/json"])
            .authenticate(user: user, password: password)
            .responseJSON(completionHandler: { (response) in
                if let body = response.request?.HTTPBody {
                    print("request: \(NSString(data: body, encoding:NSUTF8StringEncoding))")  // original URL request
                }
                print("response: \(response.response)") // URL response
                print("data: \(response.data)")     // server data
                print("result: \(response.result)")   // result of response serialization
            })
            
    }
}