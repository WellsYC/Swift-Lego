//
//  ViewController.swift
//  Lego
//
//  Created by 蔡亚超 on 2019/11/22.
//  Copyright © 2019 WellsCai. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    var lego : Lego?
    var config = DefaultConfig()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain)
        self.view.addSubview(tableView)


        let row1 = TestRow("TableView", subTitle: "")
        let row2 = TestRow("TableView2")
        let row3 = TestRow("CollectionView", subTitle: "customCell")

        let section1 = Section.init([row1,row2,row3])
        
        lego = Lego([section1], config: config) { cell, row in
            (cell as? TableViewCell)?.render(row)
        } didSelectCellClosures: { tableView, indexPath in
            print("1233444")
        }

        tableView.bind(lego!)
    }
}


