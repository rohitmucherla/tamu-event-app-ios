//
//  EventClass.swift
//  EventCards
//
//  Created by Riley Norris on 3/8/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

//This file stores our events class



class Event: NSObject {
    var eventName = ""
    var eventImage = #imageLiteral(resourceName: "event1")
    var eventDate = ""
    var eventPrice = ""
    var eventAddress = ""
    
    var eventDirectionsURL = "http://maps.apple.com/?q="
    var eventFilter = ""
    var eventGalleryPics = UIImage()
    var eventAddressStreet = ""
    var eventCity = ""
    var eventState = ""
    
    var eventDesc = ""
    var eventKey = ""
    var eventRef: FIRDatabaseReference?
    
    
    init(name: String,image: UIImage,date: String,price: String,address: String,desc: String,filter: String,galleryPics: UIImage,addressStreet: String,city: String,state: String, eventRef: String,eventKey: String) {
        
        eventName = name
        eventImage = image
        eventDate = date
        eventPrice = price
        eventAddress = address
        eventDesc = desc
        eventDirectionsURL = "http://maps.apple.com/?q="
        eventFilter = filter
        eventGalleryPics = galleryPics
        eventAddressStreet = addressStreet
        eventCity = city
        eventState = state
        
        //eventKey = "bleh"
        //eventRef = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        eventKey = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        eventName = snapshotValue["name"] as! String
        
        eventImage = #imageLiteral(resourceName: "event1")
        eventDate = "October 31, 2017 | 3:00 PM"
        eventPrice = "From $150.00"
        eventAddress = "123 Sesame Street College Station"
        eventDesc = snapshotValue["desc"] as! String
        eventDirectionsURL = "http://maps.apple.com/?q="
        eventFilter = "Fun"
        eventGalleryPics = #imageLiteral(resourceName: "stock1")
        eventAddressStreet = "Disney World"
        eventCity = ""
        eventState = ""
        
        eventRef = snapshot.ref
    }
    /*
    //This function generates some temporary vales we can use
    class func generateEventArrayLocal() -> [Event]{
        var eventClass = [Event]()
     
        eventClass.append(Event(name: "Lol", image: #imageLiteral(resourceName: "event1"), date: "October 31, 2017 | 3:00 PM", price: "From $150.00", address: "123 Sesame Street College Station", desc: "Blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah", filter: "Fun", galleryPics: #imageLiteral(resourceName: "stock1"), addressStreet: "Disney World", city: "", state: ""))
        
        eventClass.append(Event(name: "Super Bowl LVI", image: #imageLiteral(resourceName: "event2-1"), date: "October 31, 2017 | 3:00 PM", price: "From $150.00", address: "123 Sesame Street College Station", desc: "Blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah", filter: "Academics", galleryPics: #imageLiteral(resourceName: "stock1"), addressStreet: "Apple Inc.", city: "", state: ""))
        
        return eventClass
    }
     
 */
    class func generateEventArrayFir() -> [Event]{
        
        var firClass = [Event]()
        
        EventRef.observeSingleEvent(of: .value, with: { (snapshot) in
            for item in snapshot.children {
                let loadedEvent = Event(snapshot: item as! FIRDataSnapshot)
                firClass.append(loadedEvent)
                //print (loadedEvent.eventName)
            }
            print ("Array in Firebase function")
            print (firClass)
            print ("This one right here is in the Firebase function ^^^^")
        })
        
        /*
        EventRef.observe(.value, with: { snapshot in
            for item in snapshot.children {
                let loadedEvent = Event(snapshot: item as! FIRDataSnapshot)
                firClass.append(loadedEvent)
                //print (loadedEvent.eventName)
            }
            //self.items = newItems
            //reloadData()
            eventClass = firClass
            print (eventClass)
        })*/
        
        print ("Array to be returned")
        print (firClass)
        print ("This one right here is gonna be returned ^^^^")
        return firClass
    }
}
