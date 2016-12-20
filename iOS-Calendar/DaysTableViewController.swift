//
//  DaysTableViewController.swift
//  iOS-Calendar
//
//  Created by Kaustubh Kesarkar on 12/19/16.
//  Copyright © 2016 com.devkau. All rights reserved.
//

import Foundation
import UIKit

class DaysTableViewController : UITableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 31
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Basic")!
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
}
