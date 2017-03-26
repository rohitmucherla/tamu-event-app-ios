//
//  EventClass.swift
//  EventCards
//
//  Created by Riley Norris on 3/8/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import Foundation



//This file stores our events class



class Event: NSObject {
    var eventName = ""
    var eventImage = UIImage()
    var eventDate = ""
    var eventPrice = ""
    var eventAddress = ""
    var eventDesc = ""
    var eventDirectionsURL = "http://maps.apple.com/?q="
    var eventFilter = ""
    var eventGalleryPics = UIImage()
    var eventAddressStreet = ""
    var eventCity = ""
    var eventState = ""
    
    init(name: String,image: UIImage,date: String,price: String,address: String,desc: String,filter: String,galleryPics: UIImage,addressStreet: String,city: String,state: String) {
        
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
        
    }
    
    //This function generates some temporary vales we can use
    class func generateEventArray() -> [Event]{
        var eventClass = [Event]()
        
        eventClass.append(Event(name: "ACDC Concert", image: #imageLiteral(resourceName: "event1"), date: "October 31, 2017 | 3:00 PM", price: "From $150.00", address: "123 Sesame Street College Station", desc: "Blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah", filter: "Fun", galleryPics: #imageLiteral(resourceName: "stock1"), addressStreet: "Disney World", city: "", state: ""))
        
        eventClass.append(Event(name: "Super Bowl LVI", image: #imageLiteral(resourceName: "event2-1"), date: "October 31, 2017 | 3:00 PM", price: "From $150.00", address: "123 Sesame Street College Station", desc: "Blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah", filter: "Academics", galleryPics: #imageLiteral(resourceName: "stock1"), addressStreet: "Apple Inc.", city: "", state: ""))
        
        return eventClass
    }
}
