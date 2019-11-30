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

    let firebaseRootDb = Database.database().reference()

    
    
    
    
    func retrieveData(){
        firebaseRootDb.observe(.value, with: { snapshot in

         print("-------------------------------------1")
            let valueDict = snapshot.value as? NSDictionary
            let firebaseDB = valueDict?["tabelog-ffe28:"] as? NSDictionary
            let citiesDict = firebaseDB?["Cities"]
            

            print(citiesDict)

            print("-------------------------------------2")
        })
    }
    

}

