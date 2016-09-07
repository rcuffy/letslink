//
//  OrganizationsTableDataSource.swift
//  DataDollars
//
//  Created by StreetCode Academy on 7/21/16.
//  Copyright © 2016 StreetCode Academy. All rights reserved.
//

import Foundation
import FirebaseDatabaseUI

class OrganizationsTableDataSource: FirebaseTableViewDataSource {
    
//    var _checked: [Bool]? = nil
//    var checked: [Bool] {
//        get {
//            if _checked == nil {
//                _checked = [Bool]()
//                for _ in 0...tableView.numberOfRowsInSection(0) {
//                    _checked?.append(false)
//                }
//            }
//            return _checked!
//        }
//        set {
//            _checked = newValue
//        }
//    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAtIndexPath: indexPath)
//        if !checked[indexPath.row] {
//            cell.accessoryType = .None
//        } else if checked[indexPath.row] {
//            cell.accessoryType = .Checkmark
//        }
        return cell
    }
    
}

