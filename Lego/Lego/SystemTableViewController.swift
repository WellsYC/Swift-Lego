//
//  SystemTableViewController.swift
//  Lego
//
//  Created by 蔡亚超 on 2020/5/16.
//  Copyright © 2020 WellsCai. All rights reserved.
//

import UIKit

class SystemTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain)
        self.view.addSubview(tableView)
        
        let rowClosures : ((UITableView, IndexPath) -> UITableViewCell)? = {(tableView,indexPath) in
            var cell = tableView.dequeueReusableCell(withIdentifier: SystemCell.reuseableIdentifier)  as? SystemCell
            if cell == nil {
                cell = SystemCell.init(style: .default, reuseIdentifier: SystemCell.reuseableIdentifier)
            
            }
//            cell?.render(tableView.lg[indexPath] as! SystemRow)
            
            return cell!
        }
        
        var row1 = SystemRow()
        row1.title = "姓名"
        row1.detailTitle = "张三"
        row1.cellForRowClosures = rowClosures
        
        
        var row2 = SystemRow()
        row2.title = "保存"
        row2.contentType = .switch(false)
        row2.cellForRowClosures = rowClosures
        
        
        var row3 = SystemRow()
        row3.title = "CollectionView"
        row3.contentType = .image(UIImage(named: "testImage")!, 30)
        row3.cellForRowClosures = rowClosures
        
        let section1 = Section.init([row1,row2,row3])
        
        print("sss初始化了")
    }
}
