//
//  Section.swift
//  Lego
//
//  Created by 蔡亚超 on 2019/11/22.
//  Copyright © 2019 WellsCai. All rights reserved.
//

import Foundation
import UIKit

public protocol SectionComponent{
    
    var components : [RowComponent] {get set}
    
    var headerHeight : CGFloat {get set}
    var footerHeight : CGFloat {get set}
    
    var headerTitle : String? {get set}
    var footerTitle : String? {get set}
    
    // Method
    mutating func add(_ component:RowComponent)-> Self
    mutating func add(_ components:[RowComponent])-> Self

    mutating func remove(_ index:Int) -> Self
    mutating func insert(_ component:RowComponent,at index:Int) -> Self

}

extension SectionComponent{
    var componentCount:Int{
        get{
            return components.count
        }
    }
    
    mutating func add(_ component:RowComponent)-> Self{
        self.components.append(component)
        return self
    }
    
    mutating func add(_ components:[RowComponent])-> Self{
        _ = components.map {self.components.append($0)}
        return self
    }
    
    mutating func remove(_ index:Int) -> Self{
        self.components.remove(at: index)
        return self
    }
    
    mutating func insert(_ component:RowComponent,at index:Int) -> Self{
        self.components.insert(component, at: index)
        return self
    }
    
    subscript(_ indexPath:IndexPath)-> RowComponent{
        return components[indexPath.row]
    }
}

