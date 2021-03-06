//
//  ViewController.swift
//  EventCards
//
//  Created by Riley Norris on 2/24/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//
import Foundation
import Firebase
import UIKit
import MapKit       //Importing MapKit lets us work with Apple Maps
//let EventRef = FIRDatabase.database().reference(withPath: "Events")



//For those that don't know, this file is the basis of the program. It basically edits the homepage



//Instantiating these class variables outside of a class lets you use them in every file
var eventsClass : [Event] = []  //This is the array that is seen on the main page
var fireClass : [Event] = []    //This is the array that is loaded from Firebase
var savedEventIndexes : [Int] = []      //This array stores the indexes (in EventsClass) of all events that are saved

//Filters: E = Fun Stuff, B = Boring Stuff, F = Food, A = Academics, N = No filter
var filter: [Character] = ["N"]




class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, UICollectionViewDelegateFlowLayout{
    
    
    
    @IBOutlet weak var open: UIBarButtonItem!
    @IBOutlet weak var buttonTo2: UIBarButtonItem!          //This is the outlet to the button for the side bar
    @IBOutlet weak var authButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!    //Needed an outlet to transfer data later on
    @IBOutlet weak var viewControl: UIScrollView!           //Simple scroll view lets you scroll

    var fireRun = 0

    
    
    //These add gestures and a button to the side bar
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        buttonTo2.target = self.revealViewController()
        buttonTo2.action = #selector(SWRevealViewController.revealToggle(_:))
        NotificationCenter.default.addObserver(self, selector: #selector(refreshView), name: NSNotification.Name(rawValue: "refreshVC"), object: nil)
        
        //This listens to the database and refreshes the view whenever it changes
        EventRef.observe(.value, with: { snapshot in
            eventsClass.removeAll()
            fireClass.removeAll()
            for item in snapshot.children {
                let loadedEvent = Event(snapshot: item as! DataSnapshot)
                fireClass.append(loadedEvent)
            }
            eventsClass = self.filterEventArray(rawEvents: fireClass)
            self.refreshView()
        })
    }
    
    
    
    //function that will happen everytime a user navigates to the page
    override func viewWillAppear(_ animated: Bool) {
        eventsClass = self.filterEventArray(rawEvents: fireClass)
        collectionView.reloadData()
    }
    
    
    
    @IBAction func authDidPress(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "showAuthPage", sender: self)
    }
    
    
    
    //This function filters the array of events
    func filterEventArray(rawEvents: [Event]) -> [Event]{
        //This is the filter loop
        var filteredEvents : [Event] = []
        for event in rawEvents {
            for char in event.eventFilter.characters {
                if filter.contains(char) {filteredEvents.append(event)}
            }
        }
        return filteredEvents
    }
    
    
    
    //This function refreshes the view
    @objc func refreshView(){
        eventsClass = self.filterEventArray(rawEvents: fireClass)
        super.viewWillAppear(true)
        self.collectionView.reloadData()
    }
    
    
    
    //Function to create a certain amount of cards
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventsClass.count+1
    }
    
    
    
    //This is the function for what's on the cards
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as! searchCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            
            
            //Setting all the labels, title and image are pulled from eventsClass up top
            
            //This loads image from Firebase and sets it as eventImage
            cell.imageView.sd_setImage(with: eventsClass[indexPath.row-1].eventRef , placeholderImage: cell.imageView?.image) { (image, error, cache, url) in
                if cell.imageView.image != nil {
                    eventsClass[indexPath.row-1].eventImage = cell.imageView.image!
                }
            }
            
            
            cell.titleLabel?.text = eventsClass[indexPath.row-1].eventName
            cell.addressButtonOutlet.setTitle(eventsClass[indexPath.row-1].eventAddress, for: UIControlState.normal)
            cell.dateLabel.text = eventsClass[indexPath.row-1].eventDate
            cell.descriptionLabel.text = eventsClass[indexPath.row-1].eventDesc
            cell.priceLabel.text = eventsClass[indexPath.row-1].eventPrice
            cell.plusLabel.text = "+"
            cell.indexP = indexPath.row-1
            
            
            //Setting all the icons
            cell.shareImage.image = UIImage(named: "shareButton")
            cell.priceIcon.image = UIImage(named: "currency-usd copy")
            cell.addressIcon.image = UIImage(named: "earth")
            cell.detailIcon.image = UIImage(named: "format-list-bulleted")
            
            //Setting the necessary image for the savedButton
            if eventsClass[indexPath.row-1].eventIsSaved {
                cell.saveButton.setImage(#imageLiteral(resourceName: "StarIconSelected"), for: UIControlState.normal)
            } else {
                cell.saveButton.setImage(#imageLiteral(resourceName: "StarIconDeselected"), for: UIControlState.normal)
            }
            
            //This creates the shadows and modifies the cards a little bit
            cell.contentView.layer.cornerRadius = 4.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = false
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            cell.layer.shadowRadius = 4.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            
            return cell
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.contentSize.width - 16, height: 45)
        } else {
            return CGSize(width: collectionView.contentSize.width - 22, height: 450)
        }
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
            vc.titleLabelE = eventsClass[indexPath.row-1].eventName
            vc.topImageE = eventsClass[indexPath.row-1].eventImage

            vc.dateLabelE = eventsClass[indexPath.row-1].eventDate
            vc.priceLabelE = eventsClass[indexPath.row-1].eventPrice
            vc.addressLabelE = eventsClass[indexPath.row-1].eventAddress
            vc.detailsLabelE = eventsClass[indexPath.row-1].eventDesc
            vc.indexP = indexPath.row-1
            
        }
    }
}
