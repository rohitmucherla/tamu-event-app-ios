//
//  SavedEventsCollectionViewCell.swift
//  EventCards
//
//  Created by Riley Norris on 3/13/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import UIKit

class SavedEventsCollectionViewCell: UICollectionViewCell {
    
    
    
    //This file holds all the outlets for the elements of the cards on the Saved Event page
    
    
    
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
    @IBOutlet weak var saveButtonOutlet: UIButton!
    
    var indexP = 0
    
    @IBAction func saveButtonAction(_ sender: Any) {
        print(indexP)
        if eventsClass[savedEventIndexes[indexP]].eventIsSaved {
            eventsClass[savedEventIndexes[indexP]].eventIsSaved = false;
            savedEventIndexes.remove(at: indexP)
            saveButtonOutlet.setImage(#imageLiteral(resourceName: "bookmarkDeselected "), for: UIControlState.normal)
        } else {
            
        }
    }
    
}
