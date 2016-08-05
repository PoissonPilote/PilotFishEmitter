//
//  Packet.swift
//  PilotFishEmitter
//
//  Created by Martin Delille on 02/08/2016.
//  Copyright © 2016 Phonations. All rights reserved.
//

import Foundation
//import Realm
//import RealmSwift

class Packet/*: Object*/ {
    var x: Double?
    var y: Double?
    var depth: Double?
    var paddle: Int?
    var datetime = NSDate()
    var published = false

    required init(x: Double? = nil, y: Double? = nil) {
        self.x = x
        self.y = y
    }
    
//    required init(value: AnyObject, schema: RLMSchema) {
//        fatalError("init(value:schema:) has not been implemented")
//    }
//    
//    required init(realm: RLMRealm, schema: RLMObjectSchema) {
//        fatalError("init(realm:schema:) has not been implemented")
//    }
//    
//    required init() {
//        super.init()
//    }
}
