//
//  Lego.swift
//  Lego
//
//  Created by 蔡亚超 on 2019/11/22.
//  Copyright © 2019 WellsCai. All rights reserved.
//  Lego
//  每个TableView都有一个lego


import Foundation
import UIKit


private var delegateKey: Void?

// Closures
public typealias CellForRowClosures     = (UITableView,IndexPath) -> UITableViewCell
public typealias CellRenderClosures     = (UITableViewCell, RowComponent) -> Void
public typealias CellDidSelectClosures  = (UITableView,IndexPath) -> Void


// 简单的Legosections包含和sections
// 以及对sections的相关操作
protocol LegoProtocol {
    var sections : [SectionComponent]   {set get}
}


open class Lego: LegoProtocol{
    
    public var sections: [SectionComponent]

    public var config: ConfigProtocol?
        
    public var cellForRowClosures    : CellForRowClosures?
    public var didSelectCellClosures : CellDidSelectClosures?
    public var cellRenderClosures    : CellRenderClosures?
    
    let delegate : TableDelegate

    public init(_ sections : [SectionComponent] = [],
         config : ConfigProtocol? = nil,
         cellRenderClosures : CellRenderClosures? = Lego.defaultCellRenderClosures,
         didSelectCellClosures : CellDidSelectClosures? = nil) {
        
        self.sections = sections
        
        self.config = config
        self.cellRenderClosures = cellRenderClosures
        self.didSelectCellClosures = didSelectCellClosures

        self.delegate = TableDelegate()
        self.delegate.lego = self
    }
}

extension Lego {
    subscript(_ indexPath:IndexPath)-> RowComponent{
        return self.sections[indexPath.section][indexPath]
    }
    
    func add(_ section: SectionComponent)-> Self{
        self.sections.append(section)
        return self
    }
    
    func add(_ sections: [SectionComponent])-> Self{
        _ = sections.map {self.sections.append($0)}
        return self
    }

    func remove(_ index: Int) -> Self{
        self.sections.remove(at: index)
        return self
    }
    
    func insert(_ section: SectionComponent,at index:Int) -> Self{
        self.sections.insert(section, at: index)
        return self
    }
    
}

extension Lego {
    public final class func defaultCellRenderClosures(cell: UITableViewCell,row: RowComponent) -> Void{
        cell.render(row)
    }
}


