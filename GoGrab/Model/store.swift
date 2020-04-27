//
//  store.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-14.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import Foundation
class store : Decodable {
    
    var id: Int
    var storeName: String
    
    
    //initializer
    init(id: Int, storeName: String) {
        self.id = id
        self.storeName = storeName
    }
}
