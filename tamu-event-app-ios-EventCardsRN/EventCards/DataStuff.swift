//
//  DataStuff.swift
//  EventCards
//
//  Created by Kaleb Lewis on 7/1/17.
//  Copyright © 2017 Aggie Coding Club. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

let baseURL = "https://eventcards-3a476.firebaseio.com/"

let EventRef = FIRDatabase.database().reference(withPath: "Events")
