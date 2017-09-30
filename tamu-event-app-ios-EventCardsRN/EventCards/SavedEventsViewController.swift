//
//  SavedEventsViewController.swift
//  EventCards
//
//  Created by Riley Norris on 2/24/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import UIKit
import MapKit       //Importing MapKit lets us work with Apple Maps




//This file generates the saved events



class SavedEventsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
    

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewControl: UIScrollView!           //Simple scroll view lets you scroll
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    //These add gestures and a button to the side bar
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        searchBar.delegate = self
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    
    
    //This refreshes the view
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    
    
    //Function to create a certain amount of cards
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return self.eventsVar.eventNames.count
        return savedEventsClass.count
    }
    
    
    
    //This is the function for what's on the cards
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! SavedEventsCollectionViewCell
        
        
        //Setting all the labels, title and image are pulled from eventsClass
        cell.imageView?.image = savedEventsClass[indexPath.row].eventImage
        cell.titleLabel?.text = savedEventsClass[indexPath.row].eventName
        cell.filterLabel.text = savedEventsClass[indexPath.row].eventFilter
        cell.addressButtonOutlet.setTitle(savedEventsClass[indexPath.row].eventAddress, for: UIControlState.normal)
        cell.dateLabel.text = savedEventsClass[indexPath.row].eventDate
        cell.descriptionLabel.text = savedEventsClass[indexPath.row].eventDesc
        cell.priceLabel.text = savedEventsClass[indexPath.row].eventPrice
        cell.plusLabel.text = "+"
        
        
        //Setting all the icons
        cell.shareImage.image = UIImage(named: "shareButton")
        cell.priceIcon.image = UIImage(named: "currency-usd copy")
        cell.addressIcon.image = UIImage(named: "earth")
        cell.detailIcon.image = UIImage(named: "format-list-bulleted")
        
        
        //This creates the shadows and modifies the cards a little bit
        cell.contentView.layer.cornerRadius = 2.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    
    
  /*  //This says if a user selects a cell, it will perform a segue to a new view, which in this case will be our Event Page
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showEventPage", sender: self)
    }
    
    
    
    //Basically the settings of the segue, we pass data from our cards to the event page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEventPage"
        {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems!
            let indexPath = indexPaths[0] as NSIndexPath                //Grabbing the index path of the cell the user touches so we can pull the right data
            
            
            let vc = segue.destination as! NewViewController            //Allows us to manipulate elements in the Event Page
            
            
            //Actually passing the data from this file to the Event Page
            vc.titleLabelE = eventsVar.eventsClass[indexPath.row].eventName
            vc.topImageE = eventsVar.eventsClass[indexPath.row].eventImage
            
            vc.dateLabelE = eventsVar.eventsClass[indexPath.row].eventDate
            vc.priceLabelE = eventsVar.eventsClass[indexPath.row].eventPrice
            vc.addressLabelE = eventsVar.eventsClass[indexPath.row].eventAddress
            vc.detailsLabelE = eventsVar.eventsClass[indexPath.row].eventDesc
            
            vc.indexP = indexPath.row
            
        }
    }*/
}

