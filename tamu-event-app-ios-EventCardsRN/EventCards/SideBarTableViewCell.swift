//
//  SideBarTableViewCell.swift
//  EventCards
//
//  Created by Riley Norris on 3/1/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import UIKit

class SideBarTableViewCell: UITableViewCell {

    
    //This file holds the outlets for our Side Bar cells, positioning is edited in SideBarTableViewCell.xib
    
    
    @IBOutlet weak var filterImage: UIImageView!
    @IBOutlet weak var filterTitle: UILabel!
    @IBOutlet weak var filterCheckBoxOutlet: UIButton!
    
    var indexP = 0
    
    let filterArray: [Character] = ["S","M","A","C","R","F","O","P","N"]
    
    @IBAction func filterCheckBoxAction(_ sender: Any) {
        
        var doAdd = true
        for item in 0..<filter.count {
            if filter[item] == filterArray[indexP-1] {
                filter.remove(at: item)
                doAdd = false
                if filter.count == 0 {filter.append(filterArray[8])}
                filterCheckBoxOutlet.setImage(#imageLiteral(resourceName: "checkBoxOUTLINE"), for: UIControlState.normal)
                break
            }
        }
        
        if doAdd {
            if filter[0] == "N" {filter.remove(at: 0)}
            filter.append(filterArray[indexP-1])
            filterCheckBoxOutlet.setImage(#imageLiteral(resourceName: "checkBoxFILLED"), for: UIControlState.normal)
        }
        
        print(filter)
    }
}
