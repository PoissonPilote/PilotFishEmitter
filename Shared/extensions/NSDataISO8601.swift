//
//  NSDataISO8601.swift
//  PilotFishEmitter
//
//  Created by Martin Delille on 05/08/2016.
//  Copyright © 2016 Phonations. All rights reserved.
//

import Foundation

public extension NSDate {
    public class func ISOStringFromDate(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"

        return dateFormatter.stringFromDate(date).stringByAppendingString("Z")
    }

    public class func dateFromISOString(string: String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        return dateFormatter.dateFromString(string)
    }
}