//
//  Preloader.swift
//  Lego
//
//  Created by 蔡亚超 on 2020/5/17.
//  Copyright © 2020 WellsCai. All rights reserved.
//  

import UIKit

class Preloader{
    var lock:NSRecursiveLock = NSRecursiveLock()
    
    func preload(_ row:RowComponent,tableView:UITableView) -> UITableViewCell {
        assert(Thread.isMainThread)
        
        var cell: UITableViewCell?
        let cellID = row.cellClass.reuseableIdentifier
        if tableView.dequeueReusableCell(withIdentifier: cellID) == nil{
            switch row.initalType {
            case .code:
                cell  = row.cellClass.init(style: row.cellStyle, reuseIdentifier: cellID)
            case .xib:
                tableView.register(row.cellClass.nib, forCellReuseIdentifier: cellID)
                cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            }
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        }
        return cell!
    }
    
    
    func getCell(_ row:RowComponent,tableView:UITableView) -> UITableViewCell {
        lock.lock(); defer{lock.unlock()}

        return preload(row, tableView: tableView)
    }
}
