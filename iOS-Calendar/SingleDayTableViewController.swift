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
    var events: [String] = Array()
    
    override func viewDidLoad() {
        print("\(monthNumber)" + "-" + "\(dayNumber)")
    }
    
    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        let newEvent = "Test Event \(events.count + 1)"
        events.append(newEvent)
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
        return events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Basic")!
        cell.textLabel?.text = events[indexPath.row]
        return cell
    }
}
