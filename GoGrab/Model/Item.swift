//
//  Item.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-14.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import Foundation
public final class Item : Decodable {
    
    var id: Int
    var cost: Double
    var weight: Decimal
    var name: String
    var image: String
    var itemType: itemType
    var store: store
    
    //initializer
    init( id: Int,cost: Double,weight: Decimal,name: String,image: String,itemType: itemType,store: store) {
        self.id = id
        self.cost = cost
        self.weight = weight
        self.name = name
        self.image = image
        self.itemType = itemType
        self.store = store
    }
}
