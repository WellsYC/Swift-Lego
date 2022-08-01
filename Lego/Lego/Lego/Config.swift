//
//  Config.swift
//  Lego
//
//  Created by 蔡亚超 on 2022/7/19.
//  Copyright © 2022 WellsCai. All rights reserved.
//

import UIKit

public protocol ConfigProtocol {
    var cellClass : UITableViewCell.Type {get}
    var fullSeparatorLine : Bool {get}
}


public struct DefaultConfig: ConfigProtocol {
    
    public var cellClass: UITableViewCell.Type{
        get{
            return UITableViewCell.self
        }
    }
    
    public var fullSeparatorLine: Bool{
        get{
            return true
        }
    }
}
