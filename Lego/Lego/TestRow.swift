//
//  TestRow.swift
//  Lego
//
//  Created by 蔡亚超 on 2020/2/2.
//  Copyright © 2020 WellsCai. All rights reserved.
//

import Foundation
import UIKit

struct TestRow :RowComponent {
   
    
    // 基本属性
    public var rowHeight : CGFloat = 44
    public var cellStyle = UITableViewCell.CellStyle.subtitle
    public var cellClass : UITableViewCell.Type = TableViewCell.self
    public var cellAccessoryType = UITableViewCell.AccessoryType.detailButton
    public var shouldHighlight = true
    public var initalType = CellInitalType.code
    
    public var contentType : ContentType = .default
    public var title : String?
    public var detailTitle : String?
    
    public var content : String?
    public var into : String?
    
    // 闭包回调
    var cellForRowClosures: CellForRowClosures?
    var cellRenderClosures: CellRenderClosures?
    var didSelectRowClosures: CellDidSelectClosures?
    
    init(_ title : String? = "",subTitle: String = "暂无" ) {
        self.title = title
        self.detailTitle = subTitle
    }
}
