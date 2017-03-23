//
//  imageViewController.swift
//  EventCards
//
//  Created by Riley Norris on 3/4/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {
    
    
    
    //This file contains the data for our gallery
    
    
    
    //Outlet for our image view
    @IBOutlet weak var imageView: UIImageView!
    
    //Variable that lets us control the image view outlet
    var imageV = UIImage()
    
    
    
    //If the view loads, set the image view to our variable we set in NewViewController.swift
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageV
    }

   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/

}
