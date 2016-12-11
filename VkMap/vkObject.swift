//
//  vkObject.swift
//  VkMap
//
//  Created by Alex on 20.11.16.
//  Copyright © 2016 AnsA. All rights reserved.
//

import Foundation

public class vkObject {

    public var first_name :String?
    public var last_name :String?
    public var city :String?
    public var idUser :String?
    public var latCoord :String?
    public var lonCoord :String?
    
    init(first:String, last:String,city:String, idUser:String, lat:String, lon:String) {
        self.first_name = first
        self.last_name = last
        self.city = city
        self.idUser = idUser
        self.latCoord = lat
        self.lonCoord = lon
    }
    

}
