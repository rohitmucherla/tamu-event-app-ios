//
//  CollectionViewCell.swift
//  EventCards
//
//  Created by Riley Norris on 2/24/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    
    //This file holds all the outlets for the elements of the cards on the homepage
    
    
    
    @IBOutlet weak var addressButtonOutlet: UIButton!               //This is for the address, it lets us manipulate the name
    @IBOutlet weak var addressIcon: UIImageView!
    @IBOutlet weak var priceIcon: UIImageView!
    @IBOutlet weak var detailIcon: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shareImage: UIImageView!
    @IBOutlet weak var saveImage: UIImageView!
    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var filterLabel: UILabel!
    
    
    var eventsVar = ViewController.events()                         //Variable lets us import our events struct
    
    
    //This action opens up eventsVar.directionsURL in Apple Maps
    @IBAction func addressButton(_ sender: UIButton) {
        
        var directions = eventsVar.addressStreet + " " + eventsVar.city + " " + eventsVar.state
        directions = directions.replacingOccurrences(of: " ", with: "+")
        eventsVar.directionsURL = eventsVar.directionsURL + directions
        
        if let url = NSURL(string: eventsVar.directionsURL) {
            
            UIApplication.shared.open(url as URL)
            
        }
    }
}
