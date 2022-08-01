//
//  SystemSection.swift
//  Lego
//
//  Created by 蔡亚超 on 2022/7/15.
//  Copyright © 2022 WellsCai. All rights reserved.
//

import UIKit

struct Section: SectionComponent {
    
    var components : [RowComponent]
    
    var headerHeight: CGFloat = 0
    var footerHeight: CGFloat = 0
    
    var headerTitle: String?
    var footerTitle: String?
    
    init(_ components:[RowComponent]) {
        self.components = components
    }
}
