//
//  ViewController.swift
//  EventCards
//
//  Created by Riley Norris on 2/24/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//
import Foundation
import FirebaseDatabase
import Firebase
import UIKit
import MapKit       //Importing MapKit lets us work with Apple Maps
//let EventRef = FIRDatabase.database().reference(withPath: "Events")



//For those that don't know, this file is the basis of the program. It basically edits the homepage



//Instantiating these class variables outside of a class lets you use them in every file
var savedEventsClass = [SavedEvent]()
var eventsClass : [Event] = []
var fireClass : [Event] = []



class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var open: UIBarButtonItem!
    @IBOutlet weak var buttonTo2: UIBarButtonItem!          //This is the outlet to the button for the side bar
    @IBOutlet weak var collectionView: UICollectionView!    //Needed an outlet to transfer data later on
    @IBOutlet weak var viewControl: UIScrollView!           //Simple scroll view lets you scroll
    @IBOutlet weak var searchBar: UISearchBar!
    
    //These are likely temporary filters but whatever
    //Filters: E = Fun Stuff, B = Boring Stuff, F = Food, A = Academics, N = No filter
    var filter: Character = "N"
    
    
    
    //All the variables we need later, stored in a struct

    
    
    //These add gestures and a button to the side bar
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        buttonTo2.target = self.revealViewController()
        buttonTo2.action = #selector(SWRevealViewController.revealToggle(_:))
        
        //This listens to the database and refreshes the view whenever it changes
        EventRef.observe(.value, with: { snapshot in
            eventsClass.removeAll()
            fireClass.removeAll()
            
            for item in snapshot.children {
                let loadedEvent = Event(snapshot: item as! FIRDataSnapshot)
                fireClass.append(loadedEvent)
            }
            //This is the filter loop
            for event in fireClass {
                for char in event.eventFilter.characters {
                    if char == self.filter {
                        eventsClass.append(event)
                    }
                }
            }
            //This refreshes the view
            super.viewWillAppear(true)
            self.collectionView.reloadData()
        })
    }
    
    
    
    
    //Function to create a certain amount of cards
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return self.eventsVar.eventNames.count
        return eventsClass.count
    }
    
    
    
    //This is the function for what's on the cards
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        
        //Setting all the labels, title and image are pulled from eventsClass up top
        cell.imageView?.image = eventsClass[indexPath.row].eventImage
        cell.titleLabel?.text = eventsClass[indexPath.row].eventName
        cell.filterLabel.text = eventsClass[indexPath.row].eventFilter
        cell.addressButtonOutlet.setTitle(eventsClass[indexPath.row].eventAddress, for: UIControlState.normal)
        cell.dateLabel.text = eventsClass[indexPath.row].eventDate
        cell.descriptionLabel.text = eventsClass[indexPath.row].eventDesc
        cell.priceLabel.text = eventsClass[indexPath.row].eventPrice
        cell.plusLabel.text = "+"
        cell.indexP = indexPath.row
        
        
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
            vc.indexP = indexPath.row
            
        }
    }
}





/*override func didReceiveMemoryWarning() {
 super.didReceiveMemoryWarning()
 // Dispose of any resources that can be recreated.
 }*/
