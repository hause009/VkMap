//
//  AppDelegate.swift
//  VkMap
//
//  Created by Alex on 14.11.16.
//  Copyright © 2016 AnsA. All rights reserved.
//
//5720647
//#access_token=
//2957056efe8ce34dbe3e2652a19a2cb9f7614eca77690c0b00e13ac4a5a5195c69440509ee60832b7614b

import UIKit
import SwiftyVK

var vkDelegateReference : VKDelegate?
//private let sharedSingleton = AppDelegate()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
//    class var sharedInstance: AppDelegate {
//        return sharedSingleton
//    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        vkDelegateReference = VKDelegateClass()
        return true
    }
    
    

    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        VK.process(url: url, options: options)
        return true
    }
    
    
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        VK.process(url: url, sourceApplication: sourceApplication)
        return true
    }
}

extension AppDelegate {
    @IBAction func buttonDown(_ sender: AnyObject) {
        APIWorker.action(sender.tag)
    }
}



