//
//  VKDelegate.swift
//  VkMap
//
//  Created by Alex on 17.11.16.
//  Copyright © 2016 AnsA. All rights reserved.
//

import Foundation
import SwiftyVK
import UIKit

class VKDelegateClass:VKDelegate {
    let appID = "5720647"
    let scope: Set<VK.Scope> = [.messages,.offline,.friends,.wall,.photos,.audio,.video,.docs,.market,.email]
    
    
    
    init() {
        VK.config.logToConsole = true
        VK.configure(withAppId: appID, delegate: self)
    }
    
    func vkWillAuthorize() -> Set<VK.Scope> {
        return scope
    }
    
    func vkDidAuthorizeWith(parameters: Dictionary<String, String>) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "TestVkDidAuthorize"), object: nil)
    }
    
    func vkAutorizationFailedWith(error: AuthError) {
        print("Autorization failed with error: \n\(error)")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "TestVkDidNotAuthorize"), object: nil)
    }
    
    
    
    func vkDidUnauthorize() {}
    
    
    
    func vkShouldUseTokenPath() -> String? {
        return nil
    }

        func vkWillPresentView() -> UIViewController {
            return UIApplication.shared.delegate!.window!!.rootViewController!
        }

}
