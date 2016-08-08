//
//  Communicator.swift
//  PilotFishEmitter
//
//  Created by Martin Delille on 05/08/2016.
//  Copyright © 2016 Phonations. All rights reserved.
//

import Foundation
import Alamofire


typealias CommunicatorHandler = (_: String) -> ()

class Communicator {


    func send(longitude: Double, latitude: Double, depth: Double, paddle: Int, humor: String?, callback: CommunicatorHandler) {
        print("send")

        let dateISO8601: String = NSDate.ISOStringFromDate(NSDate())
        var parameters: [String: AnyObject] = [
            "boat-1": [
                "x": latitude,
                "y": longitude,
                "depth": depth,
            ],
            "paddle": paddle,
            "datetime": dateISO8601
        ]
        if let humor = humor {
            parameters["humor"] = humor
        }


        let request = Alamofire.request(.POST, "http://www.projetpoissonpilote.com/api/datum", parameters: parameters)
            .validate(contentType: ["application/json"])
            .authenticate(user: Configuration.user, password: Configuration.password)

        //        if let body = request.request?.HTTPBody, let bodyString = NSString(data: body, encoding: NSUTF8StringEncoding).stringByRemovingPercentEncoding {
        //            print("request before: \(bodyString)")  // original URL request
        //        }

        request.responseJSON(completionHandler: { (response) in
            //            if let body = response.request?.HTTPBody {
            //                print("request after: \(NSString(data: body, encoding:NSUTF8StringEncoding).stringByRemovingPercentEncoding)")  // original URL request
            //            }
            if let response = response.response {
                print("response: \(response)") // URL response
                callback("Success")
            } else {
                callback("Failed")
            }
        })
        
    }
}