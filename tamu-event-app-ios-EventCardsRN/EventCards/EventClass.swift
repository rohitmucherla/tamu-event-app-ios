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
import SDWebImage
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
    var eventRef = ""
    
    
    init(name: String,image: UIImage,date: String,price: String,address: String,desc: String,filter: String,galleryPics: UIImage,addressStreet: String,city: String,state: String, ref: String, key: String) {
        
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
        eventKey = key
        eventRef = ref
    }
    
    init(snapshot: FIRDataSnapshot) {
        eventKey = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        eventName = snapshotValue["name"] as! String
        eventDate = snapshotValue["date"] as! String
        eventPrice = snapshotValue["price"] as! String
        eventAddress = snapshotValue["address"] as! String
        eventDesc = snapshotValue["desc"] as! String
        
        //These are likely temporary filters but whatever
        //Filters: E = Fun Stuff, B = Boring Stuff, F = Food, A = Academics, N = No filter
        eventFilter = snapshotValue["filters"] as! String + "n"
        eventFilter = eventFilter.uppercased()
        
        
        eventAddressStreet = snapshotValue["street"] as! String
        eventCity = snapshotValue["city"] as! String
        eventState = snapshotValue["state"] as! String
        eventRef = eventName + eventDate + ".jpg"
        
        //let testRef = ImageRef.child("Illuminati.jpg")
        //let url = URL(string:"https://firebasestorage.googleapis.com/v0/b/eventcards-3a476.appspot.com/o/Illuminati.jpg?alt=media&token=92d124fb-b9ad-4720-988d-1ca668f52c55")
        
        eventImage = #imageLiteral(resourceName: "event1")
        //eventImage = UIImage(named: "garbage.jpg")!
        //UIImageView.sd_setImage(with: URL(string: "https://firebasestorage.googleapis.com/v0/b/eventcards-3a476.appspot.com/o/Illuminati.jpg?alt=media&token=92d124fb-b9ad-4720-988d-1ca668f52c55"), placeholderImage: eventImage)
        
        //[UIImageView.sd_setImageWithStorageReference:testRef, eventImage]
        eventGalleryPics = #imageLiteral(resourceName: "stock1")
        eventDirectionsURL = "http://maps.apple.com/?q="
    }
    
    
    //This function generates some temporary vales we can use
    /*class func generateEventArrayLocal() -> [Event]{
        var eventClass = [Event]()
     
        eventClass.append(Event(name: "Lol", image: #imageLiteral(resourceName: "event1"), date: "October 31, 2017 | 3:00 PM", price: "From $150.00", address: "123 Sesame Street College Station", desc: "Blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah", filter: "Fun", galleryPics: #imageLiteral(resourceName: "stock1"), addressStreet: "Disney World", city: "", state: "", ref: "ref", key: "key"))
        
        eventClass.append(Event(name: "Super Bowl LVI", image: #imageLiteral(resourceName: "event2-1"), date: "October 31, 2017 | 3:00 PM", price: "From $150.00", address: "123 Sesame Street College Station", desc: "Blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah", filter: "Academics", galleryPics: #imageLiteral(resourceName: "stock1"), addressStreet: "Apple Inc.", city: "", state: "", ref: "ref", key: "key"))
        
        return eventClass
    }*/
    
    //Deprecated way to load from database, left in for reference
    /*class func generateEventArrayFir() -> [Event]{
        var firClass = [Event]()
        EventRef.observeSingleEvent(of: .value, with: { (snapshot) in
            for item in snapshot.children {
                let loadedEvent = Event(snapshot: item as! FIRDataSnapshot)
                firClass.append(loadedEvent)
                //print (loadedEvent.eventName)
            }
        })
        return firClass
     }*/
}
