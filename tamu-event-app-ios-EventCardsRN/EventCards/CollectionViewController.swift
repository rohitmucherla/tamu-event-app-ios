//
//  ViewController.swift
//  EventCards
//
//  Created by Riley Norris on 2/24/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import UIKit
import MapKit       //Importing MapKit lets us work with Apple Maps



//For those that don't know, this file is the basis of the program. It basically edits the homepage



class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var open: UIBarButtonItem!
    @IBOutlet weak var buttonTo2: UIBarButtonItem!          //This is the outlet to the button for the side bar
    @IBOutlet weak var collectionView: UICollectionView!    //Needed an outlet to transfer data later on
    @IBOutlet weak var viewControl: UIScrollView!           //Simple scroll view lets you scroll
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    //All the variables we need later, stored in a struct
    struct events {
        let eventNames = ["ACDC Concert","Super Bowl XVII","I ran out of event names","Once again I ran out of event names"]
        let imageArray = [UIImage(named: "event1"), UIImage(named: "event2-1"), UIImage(named: "event3"), UIImage(named: "event4")]
        let date = "Saturday, October 31, 2017 | 3:00 PM"
        let price = "Price: From $150.00"
        let address = "123 Sesame Street College Station"
        let desc = "Blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah"
        let plus = "+"
        var directionsURL = "http://maps.apple.com/?q="
        let filters = ["food","drinks","academics","etc."]
        let galleryPics = [UIImage(named: "stock1"),UIImage(named: "stock2"),UIImage(named: "stock3"),UIImage(named: "stock4"),UIImage(named: "stock5"),UIImage(named: "stock6"),UIImage(named: "stock7"),UIImage(named: "stock8")]
        
        
        let addressStreet = "Disney World"
        let city = ""
        let state = ""
        
    }
    
    struct tags {
        var tag1 = 0
    }
    
    var tagVar = tags()
    
    let eventsClass = Event.generateEventArray()
    
    
    //Variable lets us edit the struct
    //var eventsVar = events()
    
    
    
    //These add gestures and a button to the side bar
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        buttonTo2.target = self.revealViewController()
        buttonTo2.action = #selector(SWRevealViewController.revealToggle(_:))
        
    }
    
    
    
    //Function to create a certain amount of cards
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return self.eventsVar.eventNames.count
        return eventsClass.count
    }
    
    
    
    //This is the function for what's on the cards
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        
        //Setting all the labels, title and image are pulled from array up top
        /*  cell.imageView?.image = self.eventsVar.imageArray[indexPath.row]
         cell.titleLabel?.text = self.eventsVar.eventNames[indexPath.row]
         cell.filterLabel.text = self.eventsVar.filters[indexPath.row]
         cell.addressButtonOutlet.setTitle(eventsVar.address, for: UIControlState.normal)
         cell.dateLabel.text = eventsVar.date
         cell.descriptionLabel.text = eventsVar.desc
         cell.priceLabel.text = eventsVar.price
         cell.plusLabel.text = eventsVar.plus        */
        
        cell.imageView?.image = eventsClass[indexPath.row].eventImage
        cell.titleLabel?.text = eventsClass[indexPath.row].eventName
        cell.filterLabel.text = eventsClass[indexPath.row].eventFilter
        cell.addressButtonOutlet.setTitle(eventsClass[indexPath.row].eventAddress, for: UIControlState.normal)
        cell.dateLabel.text = eventsClass[indexPath.row].eventDate
        cell.descriptionLabel.text = eventsClass[indexPath.row].eventDesc
        cell.priceLabel.text = eventsClass[indexPath.row].eventPrice
        cell.plusLabel.text = "+"
        
        
        
        //Setting all the icons
        cell.shareImage.image = UIImage(named: "shareButton")
        cell.saveImage.image = UIImage(named: "bookmark")
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
        
        
        cell.addressButtonOutlet.tag = IndexPath
        tagVar.tag1 = cell.addressButtonOutlet.tag
        print(tagVar.tag1)
        
        return cell
    }
    
    
    
    //This says if a user selects a cell, it will perform a segue to a new view, which in this case will be our Event Page
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
            vc.titleLabelE = eventsClass[indexPath.row].eventName
            vc.topImageE = eventsClass[indexPath.row].eventImage
            
            vc.dateLabelE = eventsClass[indexPath.row].eventDate
            vc.priceLabelE = eventsClass[indexPath.row].eventPrice
            vc.addressLabelE = eventsClass[indexPath.row].eventAddress
            vc.detailsLabelE = eventsClass[indexPath.row].eventDesc
            
        }
    }
}





/*override func didReceiveMemoryWarning() {
 super.didReceiveMemoryWarning()
 // Dispose of any resources that can be recreated.
 }*/
