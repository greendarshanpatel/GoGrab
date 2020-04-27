//
//  user.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-14.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import Foundation
public final class User: Codable {
    
    public var id : Int
    public var email : String
    public var name : String
    public var password : String
    public var contactNumber: String
    public var unit : String
    public var street : String
    public var city : String
    public var postalCode : String
    public var isAdmin : Bool

    init(id : Int, email : String, name : String, password : String,contactNumber: String,unit : String,street : String,city : String,postalCode : String,isAdmin : Bool) {
        self.id = id
        self.email = email
        self.name = name
        self.password = password
        self.contactNumber = contactNumber
        self.unit = unit
        self.street = street
        self.city = city
        self.postalCode = postalCode
        self.isAdmin = isAdmin
    }
}
