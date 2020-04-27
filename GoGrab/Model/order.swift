//
//  order.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-15.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import Foundation
enum Status : String {
    case Pending = "Pending"
    case Canceled = "Canceled"
    case Refunded = "Refunded"
    case Delivered = "Delivered"
    case Default = "Default"
    
}
public final class Order {
    
    var id: Int
    var orderTotal: Double
    var orderStatus:String = Status.Default.rawValue
    var user: User
    var orderItems : [Cart.cartStuff]
    
    
    
    
    //initializer
    init( id: Int, orderTotal: Double,orderStatus:String, user: User, orderItems : [Cart.cartStuff] ) {
        self.id = id
        self.orderTotal = orderTotal
        self.orderStatus = orderStatus
        self.user = user
        self.orderItems = orderItems
        
    }
}
