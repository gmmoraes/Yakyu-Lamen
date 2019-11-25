//
//  FireBaseRequest.swift
//  Yakyu Lamen
//
//  Created by Gabriel on 24/11/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import Foundation
import FirebaseDatabase


class FireBaseRequest {
    // 1
    let rootRef = Database.database().reference()

    // 2
    let childRef = Database.database().reference(withPath: "grocery-items")
    
    
    
    
    func retrieveData(){
        childRef.observe(.value, with: { snapshot in
          // This is the snapshot of the data at the moment in the Firebase database
          // To get value from the snapshot, we user snapshot.value
          print(snapshot.value as Any)
        })
    }
    

}

