//
//  SavedEventsClass.swift
//  EventCards
//
//  Created by Riley Norris on 3/13/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import Foundation


//This fle holds our saved events class, all the events that are bookmarked


class SavedEvent: NSObject {
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
/*
    class func generateSavedEventArray(indexP: Int) -> [SavedEvent]{
        
        savedEventsClass.append(SavedEvent(name: eventsClass[indexP].eventName, image: eventsClass[indexP].eventImage, date: eventsClass[indexP].eventDate, price: eventsClass[indexP].eventPrice, address: eventsClass[indexP].eventAddress, desc: eventsClass[indexP].eventDesc, filter: eventsClass[indexP].eventFilter, galleryPics: eventsClass[indexP].eventGalleryPics, addressStreet: eventsClass[indexP].eventAddressStreet, city: eventsClass[indexP].eventCity, state: eventsClass[indexP].eventState))

        
        return savedEventsClass
    }
 */
}
