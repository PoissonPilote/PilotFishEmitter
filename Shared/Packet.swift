//
//  Packet.swift
//  PilotFishEmitter
//
//  Created by Martin Delille on 02/08/2016.
//  Copyright © 2016 Phonations. All rights reserved.
//

import Foundation

struct Packet {
    var x: Double?
    var y: Double?
    var depth: Double?
    var paddle: Int?
    var datetime: NSDate?
    var published = false

    init(x: Double? = nil, y: Double? = nil) {
        self.x = x
        self.y = y
    }
}