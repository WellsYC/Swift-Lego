//
//  Row.swift
//  Lego
//
//  Created by 蔡亚超 on 2019/11/22.
//  Copyright © 2019 WellsCai. All rights reserved.
//

import Foundation
import UIKit

// contain some view about default cell
public enum ContentType{
    case `default`
    case  image (UIImage ,CGFloat )
    case `switch`(Bool)
}

public protocol ComponentType{
    var initalType : CellInitalType {set get}
}

// Be suitable for TableView
public protocol RowComponent : ComponentType{
    var cellClass : UITableViewCell.Type {set get}
    
    var rowHeight : CGFloat {set get}
    
    var cellStyle : UITableViewCell.CellStyle {set get}
    
    var cellAccessoryType : UITableViewCell.AccessoryType {set get}

    var shouldHighlight : Bool {set get}
    
    var contentType : ContentType {set get}
    var title : String? {set get}
    var detailTitle : String? {set get}

    
    // Closures
    var cellForRowClosures: CellForRowClosures? {set get}
    
    var cellRenderClosures: CellRenderClosures? {set get}
    
    var didSelectRowClosures: CellDidSelectClosures? {set get}
}
