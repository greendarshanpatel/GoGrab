//
//  UserCart.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-15.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import Foundation

public final class Cart {
    struct cartStuff {
        var StuffItem : Item
        var Stuffquantity : Double
    }
    
    var cartCost: Double = 0.0
    var user: User = DummyData.curruntUser
    var cartItems : [cartStuff]
    
    //initializer
    init( cartCost: Double, user: User, cartItems:[cartStuff]) {
        self.cartCost = cartCost
        self.user = user
        self.cartItems = cartItems
    }
    
}
