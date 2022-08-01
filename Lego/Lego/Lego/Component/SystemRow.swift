//
//  SystemRow.swift
//  Lego
//
//  Created by 蔡亚超 on 2022/7/15.
//  Copyright © 2022 WellsCai. All rights reserved.
//

import UIKit

public struct SystemRow :RowComponent {
    
    // Base Property
    public var rowHeight : CGFloat = 44
    public var cellStyle = UITableViewCell.CellStyle.value1
    public var cellClass : UITableViewCell.Type = SystemCell.self
    public var cellAccessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    public var shouldHighlight = true
    public var initalType = CellInitalType.code
    
    public var contentType : ContentType = .default
    public var title : String? = ""
    public var detailTitle : String? = ""

    
    // Closures
    public var cellForRowClosures: CellForRowClosures? = nil
    public var cellRenderClosures: CellRenderClosures? = nil
    public var didSelectRowClosures:CellDidSelectClosures? = nil
    
}

