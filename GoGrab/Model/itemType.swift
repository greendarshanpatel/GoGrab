//
//  itemType.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-14.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import Foundation
public final class itemType : Decodable {

var id: Int
var itemType: String


//initializer
init(id: Int, itemType: String) {
    self.id = id
    self.itemType = itemType
    }
}
