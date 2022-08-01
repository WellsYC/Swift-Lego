//
//  LegoDelegate.swift
//  Lego
//
//  Created by 蔡亚超 on 2019/11/25.
//  Copyright © 2019 WellsCai. All rights reserved.
//

import UIKit


class TableDelegate: NSObject {
    let preloader: Preloader = Preloader()
    weak var lego : Lego!
}


extension TableDelegate:UITableViewDelegate,UITableViewDataSource{
    /// Commom
    public func numberOfSections(in tableView: UITableView) -> Int {
        return lego.sections.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lego.sections[section].componentCount
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return lego[indexPath].rowHeight
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let legoRowClosures = lego.cellForRowClosures {
            return legoRowClosures(tableView,indexPath)
        }

        let row = lego[indexPath]
        if let rowClosures = row.cellForRowClosures {
            return rowClosures(tableView,indexPath)
        }
        

        let cell = self.preloader.getCell(row, tableView: tableView)
                
        if let renderClosures = row.cellRenderClosures {
            renderClosures(cell,row)
        }else if let legoRenderClosures = lego.cellRenderClosures{
            legoRenderClosures(cell,row)
        }

        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = lego[indexPath]
        if let didSelectRowClosures = row.didSelectRowClosures {
            didSelectRowClosures(tableView,indexPath)
        }else if let legoDidSelectRowClosures = lego.didSelectCellClosures{
            legoDidSelectRowClosures(tableView,indexPath)
        }
    }

    /// Header && Footer
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return lego.sections[section].headerTitle
    }

    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return lego.sections[section].footerTitle
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return lego.sections[section].headerHeight
    }

    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return lego.sections[section].footerHeight
    }
}
