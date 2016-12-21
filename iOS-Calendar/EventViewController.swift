//
//  EventViewController.swift
//  iOS-Calendar
//
//  Created by Kaustubh Kesarkar on 12/19/16.
//  Copyright © 2016 com.devkau. All rights reserved.
//

import Foundation
import UIKit

class EventViewController : UIViewController {
    var monthNumber = -1
    var dayNumber = -1
    var eventDetails = ""
    
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventDetailsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        eventDateLabel.text = "Month: \(monthNumber)" + "-" + "Day: \(dayNumber)"
        eventDetailsLabel.text = eventDetails
    }
    
}
