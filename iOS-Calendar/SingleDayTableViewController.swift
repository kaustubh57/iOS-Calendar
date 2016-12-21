//
//  SingleDayTableViewController.swift
//  iOS-Calendar
//
//  Created by Kaustubh Kesarkar on 12/19/16.
//  Copyright © 2016 com.devkau. All rights reserved.
//

import Foundation
import UIKit

class SingleDayTableViewController : UITableViewController {
    
    var monthNumber = -1
    var dayNumber = -1
    var events: [AnyObject] = Array()
    
    override func viewDidLoad() {
        print("\(monthNumber)" + "-" + "\(dayNumber)")
    }
    
    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        let newEvent = "Test Event \(events.count + 1)"
        let defaultsKey = "\(monthNumber)" + "-" + "\(dayNumber)"
        let ce = CalendarEvent(withTitle: newEvent, andDateString: defaultsKey)
        let encodedCE = NSKeyedArchiver.archivedData(withRootObject: ce)
        events.append(encodedCE as AnyObject)
        let defaults = UserDefaults.standard
        defaults.set(events, forKey: defaultsKey)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            events.remove(at: indexPath.row)
            let sections = NSIndexSet (index: 0)
            tableView.reloadSections(sections as IndexSet, with: .fade)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let defaultsKey = "\(monthNumber)" + "-" + "\(dayNumber)"
        let defaults = UserDefaults.standard
        let arrayOfEvents = defaults.array(forKey: defaultsKey)
        if let arrayOfEvents = arrayOfEvents {
            events = arrayOfEvents as [AnyObject]
        }
        
        return events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Basic")!
        if let eventsObject = events [indexPath.row] as? NSData {
            let ce = NSKeyedUnarchiver.unarchiveObject(with: eventsObject as Data) as! CalendarEvent
            cell.textLabel?.text = ce.title
        }
        return cell
    }
}
