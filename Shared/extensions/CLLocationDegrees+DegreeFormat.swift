//
//  CLLocationDegrees+DegreeFormat.swift
//  PilotFishEmitter
//
//  Created by Martin Delille on 08/08/2016.
//  Copyright © 2016 Phonations. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocationDegrees {
    var degreeFormat: String {
        let degree = Int(self)
        // Simpler with http://stackoverflow.com/questions/24047374/string-formatting-of-a-double
        let minute = Double(self > 0 ? Int(60000 * self) - 60000 * degree : 60000 * degree - Int(60000 * self)) / 1000
        return "\(degree)° \(minute)"
    }
}