//
//  DummyData.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-14.
//  Copyright © 2020 GoGrabing. All rights reserved.
//
import UIKit
import Foundation
/// Struct DummyData holds values of curruntUser, userCart, Orders, users
struct DummyData {
    static var curruntUser : User = users[2]
    static var userCart: Cart = Cart(cartCost: 0.0, user: DummyData.curruntUser, cartItems: [])
    static var orders = [Order]()
    /// users array of class User
    static var users : [User] = [
        User(id: 1, email: "test1@gmail.com", name: "test Admin", password: "test", contactNumber: "123456789", unit: "123", street: "Abc street", city: "Waterloo", postalCode: "A2AB2B", isAdmin: true),
        User(id: 2, email: "test2@gmail.com", name: "test User", password: "test", contactNumber: "1234562345", unit: "234", street: "Pqr Street", city: "Cambridge", postalCode: "A3AE4E", isAdmin: false),
        User(id: 3, email: "NoUser@Nil@gmail.com", name: "Please Log In", password: "test", contactNumber: "1231231234", unit: "000", street: "No Address", city: "No Where", postalCode: "A2A2B2", isAdmin: false)]
    
    /// items Array  of class Item
    static var items: [Item] = [
        Item(id: 1, cost: 1.99, weight: 560, name: "Broccoli", image: "broccoli.png", itemType: itemtypes[0], store: stores[0]),
        Item(id: 2, cost: 1.79, weight: 560, name: "Broccoli", image: "broccoli.png", itemType:  itemtypes[0], store: stores[1]), 
        Item(id: 3, cost: 1.69, weight: 560, name: "Broccoli", image: "broccoli.png", itemType:  itemtypes[0], store: stores[2]),
        Item(id: 4, cost: 1.49, weight: 560, name: "Broccoli", image: "broccoli.png", itemType: itemtypes[0], store: stores[3]),
        Item(id: 5, cost: 1.59, weight: 560, name: "Tomato", image: "tomato.png", itemType: itemtypes[0], store: stores[0]),
        Item(id: 6, cost: 1.79, weight: 560, name: "Tomato", image: "tomato.png", itemType:  itemtypes[0], store: stores[1]),
        Item(id: 7, cost: 1.29, weight: 560, name: "Tomato", image: "tomato.png", itemType:  itemtypes[0], store: stores[2]),
        Item(id: 8, cost: 1.99, weight: 560, name: "Tomato", image: "tomato.png", itemType:  itemtypes[0], store: stores[3]),
        Item(id: 9, cost: 1.59, weight: 560, name: "Poteto", image: "poteto.png", itemType: itemtypes[0], store: stores[0]),
        Item(id: 10, cost: 1.79, weight: 560, name: "Potato", image: "poteto.png", itemType:  itemtypes[0], store: stores[1]),
        Item(id: 11, cost: 1.29, weight: 560, name: "Potato", image: "poteto.png", itemType:  itemtypes[0], store: stores[2]),
        Item(id: 12, cost: 1.99, weight: 560, name: "Poteto", image: "poteto.png", itemType:  itemtypes[0], store: stores[3])
    ]
    ///itemType Array of class itemType
    static var itemtypes : [itemType] = [
        itemType(id: 1, itemType: "Produce"),
        itemType(id: 2, itemType: "Frozen"),
        itemType(id: 3, itemType: "Cold"),
        itemType(id: 4, itemType: "Ambient")]
    /// stores Array of class store
    static var stores : [store] = [
        store(id: 1, storeName: "Zehrs"),
        store(id: 2, storeName: "Walmart"),
        store(id: 3, storeName: "T&T"),
        store(id: 4, storeName: "FreshCo")]
}
