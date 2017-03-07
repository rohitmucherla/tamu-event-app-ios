//
//  NewViewController.swift
//  EventCards
//
//  Created by Riley Norris on 2/24/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    //This file holds all the data for our Event Page
    
    
    
    //Outlets and variables we need
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabelEvent: UILabel!
    @IBOutlet weak var titleLabelEvent: UILabel!
    @IBOutlet weak var addressButtonLabel: UIButton!
    @IBOutlet weak var priceLabelEvent: UILabel!
    @IBOutlet weak var detailsLabelEvent: UILabel!
    @IBOutlet weak var priceImageEvent: UIImageView!
    @IBOutlet weak var detailsImageEvent: UIImageView!
    @IBOutlet weak var addressImageEvent: UIImageView!
    @IBOutlet weak var collectionViewGallery: UICollectionView!
    
    
    //Variable lets us import our events struct
    var eventsVar = ViewController.events()
    
    
    //This action opens up eventsVar.directionsURL in Apple Maps
    @IBAction func addressButtonAction(_ sender: Any) {
        
        var directions = eventsVar.addressStreet + " " + eventsVar.city + " " + eventsVar.state
        directions = directions.replacingOccurrences(of: " ", with: "+")
        eventsVar.directionsURL = eventsVar.directionsURL + directions
        
        if let url = NSURL(string: eventsVar.directionsURL) {
            UIApplication.shared.open(url as URL)
        }
        
    }
    
    
    
    //Variables we need to instantiate for later
    var titleLabelE = ""
    var dateLabelE = ""
    var addressLabelE = ""
    var priceLabelE = ""
    var detailsLabelE = ""
    var topImageE = UIImage()
    
    
    
    //Basically, if the view loads we want to do this code:
    override func viewDidLoad() {
        super.viewDidLoad()                                     //I'm not really sure what this does, but I know it's important
        
        //Assigning the icon images
        priceImageEvent.image = UIImage(named: "currency-usd copy")!
        addressImageEvent.image = UIImage(named: "earth")!
        detailsImageEvent.image = UIImage(named: "format-list-bulleted")!
        
        //Assigning the data to the labels, this data was passed here from ViewController.swift
        titleLabelEvent.text = titleLabelE
        addressButtonLabel.setTitle(addressLabelE, for: UIControlState.normal)              //Sets the text of the address button
        imageView.image = topImageE
        dateLabelEvent.text = dateLabelE
        priceLabelEvent.text = priceLabelE
        detailsLabelEvent.text = detailsLabelE
    }
    
    
    
    //Setting up the number of cells in our gallery
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventsVar.galleryPics.count
    }
    
    
    
    //Customising our gallery cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let EPCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EPCell", for: indexPath) as! EventPageCVCell
        EPCell.EPImageView.image = eventsVar.galleryPics[indexPath.row]
        
        return EPCell
    }
    
    
    
    //If the user selects a cell, perform this segue
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showImage", sender: self)
    }
    
    
    
    //Setting up options for the segue, allows us to pass data so the picture we select is the one that's enlarged
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImage"
        {
            let indexPaths = collectionViewGallery!.indexPathsForSelectedItems!
            let indexPath = indexPaths[0] as NSIndexPath                  //Grabbing the index path of the cell the user touches so we can pull the right data
            
            
            let vd = segue.destination as! imageViewController            //Allows us to manipulate elements in imageViewController
            
            
            //Passing data from the event struct to our image variable in imageViewController
            vd.imageV = eventsVar.galleryPics[indexPath.row]!
        }
    }
    
}

















/* override func didReceiveMemoryWarning() {
 super.didReceiveMemoryWarning()
 // Dispose of any resources that can be recreated.
 }
 
 
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


