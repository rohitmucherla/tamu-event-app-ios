//
//  backTableVC.swift
//  EventCards
//
//  Created by Riley Norris on 3/1/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import Foundation


class backTableVC: UITableViewController{
    
    
    
    //This file lets us manipulate the side bar/tableView
    
    
    
    //Arrays we need to create the cells in the side bar
    var tableArray = ["Fun Stuff", "Boring Stuff", "Food :D", "Academics (zzz)"]
    var imageArray = [UIImage(named: "music"), UIImage(named: "drinks"), UIImage(named: "food"), UIImage(named: "school")]
    
    
    
    //Sets the number of cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    
    
    //Allows us to manipulate the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Load the outlets from SideBarTableViewCell.swift
        let cell = Bundle.main.loadNibNamed("SideBarTableViewCell", owner: self, options: nil)?.first as! SideBarTableViewCell
        
        cell.cellImage.image = imageArray[indexPath.row]
        cell.cellLabel.text = tableArray[indexPath.row]
        
        // This lets us change the background of the side bar if we wanted
        // tableView.backgroundColor = UIColor(colorLiteralRed: (240/255.0), green: (244/255.0), blue: (255/255.0), alpha: 1.0)
        // cell.backgroundColor = tableView.backgroundColor//UIColor(colorLiteralRed: (245/255.0), green: (230/255.0), blue: (210/255.0), alpha: 1.0)
        
        tableView.separatorStyle = .none                            //Gets rid of lines in between cells in our table view

        return cell
        
    }
    
    
    //Creates the header text
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Filters"
    }
    
    
    

    

}
