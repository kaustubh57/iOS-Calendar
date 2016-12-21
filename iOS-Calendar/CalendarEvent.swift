//
//  CalendarEvent.swift
//  iOS-Calendar
//
//  Created by Kaustubh Kesarkar on 12/19/16.
//  Copyright © 2016 com.devkau. All rights reserved.
//

import Foundation

class CalendarEvent : NSObject, NSCoding {
    var title: String
    var dateString: String
    
    init(withTitle t: String, andDateString ds: String) {
        title = t
        dateString = ds
    }
    
    required init(coder decoder: NSCoder) {
        dateString = decoder.decodeObject(forKey: "dateString") as? String ?? ""
        title = decoder.decodeObject(forKey: "title") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(dateString, forKey: "dateString")
        coder.encode(title, forKey: "title")
    }
}
