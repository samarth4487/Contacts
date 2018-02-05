//
//  Contact.swift
//  Contacts
//
//  Created by Samarth Paboowal on 05/02/18.
//  Copyright © 2018 Samarth Paboowal. All rights reserved.
//

import Foundation
import ObjectMapper

class Contact: Mappable {
    
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var phone: String?
    var website: String?
    var address: Address?
    var company: Company?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        id          <- map["id"]
        name        <- map["name"]
        username    <- map["username"]
        email       <- map["email"]
        phone       <- map["phone"]
        website     <- map["website"]
        address     <- map["address"]
        company     <- map["company"]
    }
}

class Address: Mappable {
    
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: Geo?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        street      <- map["street"]
        suite       <- map["suite"]
        city        <- map["city"]
        zipcode     <- map["zipcode"]
        geo         <- map["geo"]
    }
}

class Geo: Mappable {
    
    var lat: String?
    var lng: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        lat     <- map["lat"]
        lng     <- map["lng"]
    }
}

class Company: Mappable {
    
    var name: String?
    var catchPhrase: String?
    var bs: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        name               <- map["name"]
        catchPhrase         <- map["catchPhrase"]
        bs                <- map["bs"]
    }
}
