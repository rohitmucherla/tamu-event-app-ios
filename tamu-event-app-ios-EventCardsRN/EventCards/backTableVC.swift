//
//  backTableVC.swift
//  EventCards
//
//  Created by Riley Norris on 3/1/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import Foundation

var activeFilters: [String] = []

class backTableVC: UITableViewController{
    
    
    
    //This file lets us manipulate the side bar/tableView
    
    
    
    //Arrays we need to create the cells in the side bar
    var filterFormal = ["Social", "Music", "Academics", "Community Service", "Fundraiser", "Free Food", "On Campus", "Off Campus"]
    var imageArray = [UIImage(named: "ic_group_18pt"), UIImage(named: "ic_audiotrack_18pt"), UIImage(named: "ic_local_library_18pt"), UIImage(named: "ic_nature_people_18pt"), UIImage(named: "ic_monetization_on_18pt"), UIImage(named: "ic_restaurant_18pt"), UIImage(named: "ic_directions_walk_18pt"), UIImage(named: "ic_directions_car_18pt")]
    let filterMeta = ["social","music","academics","community_service","fundraiser","free_food","on_campus","off_campus"]
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //Sets the number of cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterFormal.count+3
    }
    
    
    
    //Allows us to manipulate the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //if it's the first element we want to display the filter header
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
            return cell
            
        //if it's the last element of the table we want the apply button to show
        } else if indexPath.row == 9{
            let cell = tableView.dequeueReusableCell(withIdentifier: "applyCell", for: indexPath) as! ApplyFilterCell
            
            return cell
        
        //this just blocks out the background, probably a better way to do this but whatever
        } else if indexPath.row == 10 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath)
            return cell
            
        //otherwise we want to display the filters
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath) as! SideBarTableViewCell
            
            cell.filterImage.image = imageArray[indexPath.row-1]
            cell.filterTitle.text = filterFormal[indexPath.row-1]
            cell.indexP = indexPath.row
            
            cell.filterCheckBoxOutlet.setImage(#imageLiteral(resourceName: "checkBoxOUTLINE"), for: UIControlState.normal)
            for item in 0..<activeFilters.count {
                if filterFormal[indexPath.row-1] == activeFilters[item] {
                    cell.filterCheckBoxOutlet.setImage(#imageLiteral(resourceName: "checkBoxFILLED"), for: UIControlState.normal)
                }
            }
            
            tableView.separatorColor = UIColor.clear
            
            return cell
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 9 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshVC"), object: nil)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 60
        } else {
            return 60
        }
    }
    

    

}
