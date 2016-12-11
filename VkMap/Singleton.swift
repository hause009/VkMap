//
//  Singleton.swift
//  VkMap
//
//  Created by Alex on 27.11.16.
//  Copyright © 2016 AnsA. All rights reserved.
//

import Foundation

class Singleton {
    static let sharedObject = Singleton()
    var arrayObject = [vkObject]()
    private init(){}
}
