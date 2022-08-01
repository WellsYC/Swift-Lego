//
//  Cell+Lego.swift
//  Lego
//
//  Created by 蔡亚超 on 2020/1/19.
//  Copyright © 2020 WellsCai. All rights reserved.
//

import Foundation
import UIKit


private var indexPathKey: Void?

// 通过类名创建可复用cell
public enum CellInitalType{
    case code
    case xib
}

public protocol ReusableCompatible{
    static var reuseableIdentifier : String {get}
    static var nib : UINib {get}
}

extension ReusableCompatible{
    static public var reuseableIdentifier: String {
        return String(describing: self)
    }
    
    static public var nib: UINib {
        return UINib.init(nibName: String(describing: self), bundle: nil)
    }
}

extension UITableViewCell : ReusableCompatible{}


// ========================================================
// 给cell添加额外的属性和方法
public protocol ComponentRender{

    // cell对应的IndexPath
    var indexPath : IndexPath {set get}

    func render(_ component:RowComponent) -> Void
}

extension ComponentRender{
    
    public func render(_ component: RowComponent) {
        return
    }
    
    public var indexPath : IndexPath{
        set {
            objc_setAssociatedObject(self, &indexPathKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &indexPathKey) as! IndexPath
        }
    }
}

extension UITableViewCell : ComponentRender{}

