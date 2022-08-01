//
//  TableView+Lego.swift
//  Lego
//
//  Created by 蔡亚超 on 2022/7/19.
//  Copyright © 2022 WellsCai. All rights reserved.
//

import UIKit


public protocol BaseType {
    func bind(_ lego: Lego) -> Void
}

extension UITableView : BaseType{
    public func bind(_ lego: Lego) {
        
        self.delegate = lego.delegate
        self.dataSource = lego.delegate
    }
}
