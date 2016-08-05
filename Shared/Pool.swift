//
//  Pool.swift
//  PilotFishEmitter
//
//  Created by Martin Delille on 03/08/2016.
//  Copyright © 2016 Phonations. All rights reserved.
//

import Foundation
//import RealmSwift

class Pool: Object {
    dynamic var user = ""
    dynamic var password = ""
    let packets = List<Packet>()
}