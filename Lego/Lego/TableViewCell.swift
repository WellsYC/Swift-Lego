//
//  TableViewCell.swift
//  Lego
//
//  Created by 蔡亚超 on 2020/2/4.
//  Copyright © 2020 WellsCai. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func render(_ component: RowComponent) {        
        textLabel?.text = component.title
        detailTextLabel?.text = component.detailTitle
    }
}



