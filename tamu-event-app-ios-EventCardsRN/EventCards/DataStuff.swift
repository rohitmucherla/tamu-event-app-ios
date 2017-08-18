//
//  DataStuff.swift
//  EventCards
//
//  Created by Kaleb Lewis on 7/1/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseStorageUI
import SDWebImage
let baseURL = "https://eventcards-3a476.firebaseio.com/"
let appspotURL = "gs://eventcards-3a476.appspot.com/"
let EventRef = FIRDatabase.database().reference(withPath: "Events")
let ImageRef = FIRStorage.storage().reference(withPath: "Images")
