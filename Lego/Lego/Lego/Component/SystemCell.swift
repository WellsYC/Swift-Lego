//
//  SystemCell.swift
//  Lego
//
//  Created by 蔡亚超 on 2020/1/19.
//  Copyright © 2020 WellsCai. All rights reserved.
//

import UIKit

class SystemCell: UITableViewCell {

    lazy var contentImageView : UIImageView = {
        let imageView = UIImageView.init()
        return imageView
    }()
    
    lazy var systemSwitch : UISwitch = {
        let switchBtn = UISwitch.init(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        switchBtn.addTarget(self, action: #selector(systemSwitchClick(_ :)), for: .valueChanged)
        return switchBtn
    }()
    
    var switchActionClosures : ((Bool) -> Void)? = nil
}


extension SystemCell{
    @objc func systemSwitchClick(_ sender:UISwitch) -> Void {
        sender.isOn = !sender.isOn
        if let switchActionClosures = switchActionClosures {
            switchActionClosures(sender.isOn)
        }
    }
}


extension SystemCell{
    func render(_ component:RowComponent) -> Void{

        let systemRow = component as! SystemRow
        
        accessoryType = systemRow.cellAccessoryType
        textLabel?.text = systemRow.title
        detailTextLabel?.text = systemRow.detailTitle
        
        switch systemRow.contentType {
        case .default:
            print("Do Nothing")
        case .image(let image, let width):
            addSubview(contentImageView)
            contentImageView.image = image
            contentImageView.frame = CGRect(x: contentView.bounds.size.width - width - 30, y: contentView.bounds.size.height * 0.5 - width * 0.5, width: width, height: width)
        case .switch(let isOn):
            accessoryView = systemSwitch
            systemSwitch.isOn = isOn
        }
    }

}

