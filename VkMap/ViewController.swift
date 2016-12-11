//
//  ViewController.swift
//  VkMap
//
//  Created by Alex on 14.11.16.
//  Copyright © 2016 AnsA. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import SwiftyVK
import SwiftyJSON

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    var object: vkObject?
    var arryObject = [vkObject]()
    
    @IBAction func buttonDown(_ sender: AnyObject) {
        
        self.getDataFrends()
        
    }
    
    func getDataFrends()
    {
        print(object?.first_name as Any)
        
        VK.API.Friends.get([VK.Arg.userId : "12638730" ,VK.Arg.order:"name",VK.Arg.fields : "city"]).send(
            onSuccess: {
                response in print("!!Database!!\(response)")
                
                let list: Array = response["items"].arrayValue
                var cityCheck:String = ""
                
                for item in list {
                    //7165896
                    var dictArry = item.dictionary!
                    print(dictArry);
                    
                    let idUser = (dictArry["id"]?.stringValue)!
                    print(idUser);
                    
                    let first_name = (dictArry["first_name"]?.stringValue)!
                    print(first_name);
                    
                    let last_name = (dictArry["last_name"]?.stringValue)!
                    print(last_name);
                    
                    var titleCity = ""
                    
                    let checkDict = (dictArry["city"]?.stringValue)
                    var latPar = "47.435833"
                    var lonPar = "40.098611"
                    
                    if (checkDict?.characters.count != nil)
                    {
                        var cityDic = (dictArry["city"]?.dictionaryValue)!
                        titleCity = (cityDic["title"]?.stringValue)!
                        
                        if (idUser == "7165896")
                        {
                            cityCheck = titleCity
                           
                        }
                        else
                        {
                            let random1: Int = Int(arc4random()) //% 10
                            print(random1)
                            let random2: Int = Int(arc4random()) //% 10
                            print(random2)
                            latPar = "47.4" + String(random1)
                            lonPar = "40.0" + String(random2)
                        }
                    }
                    else{
                        
                        titleCity = ""
                       
                    }
                    
                    if (cityCheck == titleCity){
                        

                        self.object = vkObject(first: first_name, last: last_name, city: titleCity, idUser:idUser,lat:latPar ,lon:lonPar)
                        self.arryObject.append(self.object!)
                        
                    }
                    
                
                }
                Singleton.sharedObject.arrayObject = self.arryObject
                self.drawPoint()
                
        },
            onError: {error in print(error)}
        )
         print("END");
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDataFrends()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func drawPoint() {
        
        for item in Singleton.sharedObject.arrayObject
        {
            
            let latPer:Double =  Double(item.latCoord!)!
            let lonPer:Double =  Double(item.lonCoord!)!
            
            let location = CLLocationCoordinate2D(latitude: latPer,longitude: lonPer)
            
            let span = MKCoordinateSpanMake(0.18, 0.18)
            let region = MKCoordinateRegion(center: location, span: span)
            map.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = item.first_name
            annotation.subtitle = item.last_name
            map.addAnnotation(annotation)

        }
    }
    
}


