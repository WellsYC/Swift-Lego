//
//  CollectionViewCell.swift
//  Lego
//
//  Created by 蔡亚超 on 2020/5/16.
//  Copyright © 2020 WellsCai. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
