//
//  DataServices.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-14.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import Foundation
class DataServices {
    /// getCurrentUser returns loged in user from DummyData
    func getCurruntUser() -> User{
        return DummyData.curruntUser
    }
    //fuction to get all Items from DummyData
    func getItems() -> [Item] {
        return DummyData.items
    }
    //fuction to get all Users from DummyData
    func getUsers() -> [User] {
        return DummyData.users
    }
    /// getOrders returns  array of Order by current user , if user is admin it  returns all Orders
    func getOrders()->[Order]{
        if DummyData.curruntUser.isAdmin {
            return DummyData.orders
        }else{
            var userOrders = [Order]()
            for Order in DummyData.orders {
                if Order.user.email == DummyData.curruntUser.email{
                    userOrders.append(Order)
                }else{continue}
            }
            return userOrders
        }
        
    }
    
    /// LoginServices check if userexists in database and if user exists it will check  if password matches, On sucess it returns userId
    func loginService(email : String, password : String) -> Int {
        let users = getUsers()
        if  let result = users.first(where: { $0.email == email && $0.password == password }){
            DummyData.curruntUser = result
            print("login successful")
            print(result.email)
            return result.id
        } else {
            return 0
        }
    }
    // addingNewUser adds new user if user's email does not exist
    func addingNewUser(newUser :User) -> Int {
        let users = getUsers()
        if  users.first(where: { $0.email == newUser.email}) != nil{
            return 0
        } else {
            DummyData.users.append(newUser)
            return DummyData.users.count + 1
        }
    }
    ///getCart returns current users cart frm dummydata
    func getCart() -> Cart{
        return DummyData.userCart
    }
    /// addItemToCart adds item and quanti in cartItem Object and stores in cart array.
    func addItemToCart(thisItem :Item, quantity : Double) -> Double {
        let thisStuff = Cart.cartStuff(StuffItem: thisItem, Stuffquantity: quantity)
        
        let price = thisItem.cost
        let quantityPrice = price * quantity
        print(quantityPrice)
        print( DummyData.userCart.cartItems.count + 1)
        DummyData.userCart.cartItems.append(thisStuff)
        DummyData.userCart.cartCost = DummyData.userCart.cartCost + quantityPrice
        // for Item in DummyData.userCart.cartItmes
        return  DummyData.userCart.cartCost
        
        
    }
    /// Place order adds order in order Array and returns OrderID.
    func placeOrder(newOrder : Order) -> Int {
        DummyData.orders.append(newOrder)
        return DummyData.orders.count + 1
    }
}


