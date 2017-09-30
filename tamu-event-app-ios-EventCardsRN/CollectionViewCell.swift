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
    
    
    //This is for the address, it lets us manipulate the name
    @IBOutlet weak var addressButtonOutlet: UIButton!
    @IBOutlet weak var addressIcon: UIImageView!
    @IBOutlet weak var priceIcon: UIImageView!
    @IBOutlet weak var detailIcon: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shareImage: UIImageView!
    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    
    //indexP is the index path we passed from ViewController.swift
    var indexP: Int = 0
    
    
    //This is for the save button, it isn't finished yet
    @IBAction func saveAction(_ sender: UIButton) {
        if eventsClass[indexP].eventIsSaved {
            eventsClass[indexP].eventIsSaved = false
            saveButton.setImage(#imageLiteral(resourceName: "StarIconDeselected"), for: UIControlState.normal)
            for index in 0..<savedEventIndexes.count {
                if indexP == savedEventIndexes[index] {
                    savedEventIndexes.remove(at: index)
                    break
                }
            }
        } else {
            eventsClass[indexP].eventIsSaved = true
            savedEventIndexes.append(indexP)
            saveButton.setImage(#imageLiteral(resourceName: "StarIconSelected"), for: UIControlState.normal)
        }
        
        //UserDefaults.standard.set(isBookmarked, forKey: "saveButton")
        //UserDefaults.standard.synchronize()
        
    }
    
    
    
    //This action opens up eventsVar.directionsURL in Apple Maps
    @IBAction func addressButton(_ sender: UIButton) {
        
        //var directions = eventsClass[indexP].eventAddressStreet + " " + eventsClass[indexP].eventCity + " " + eventsClass[indexP].eventState
        var directions = eventsClass[indexP].eventAddress
        directions = directions.replacingOccurrences(of: " ", with: "+")
        eventsClass[indexP].eventDirectionsURL = eventsClass[indexP].eventDirectionsURL + directions
        
        if let url = NSURL(string: eventsClass[indexP].eventDirectionsURL) {
            UIApplication.shared.open(url as URL)
        }
        
        eventsClass[indexP].eventDirectionsURL = "http://maps.apple.com/?q="
    }
}
