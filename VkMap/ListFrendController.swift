//
//  LisrFrendController.swift
//  VkMap
//
//  Created by Alex on 27.11.16.
//  Copyright © 2016 AnsA. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import SwiftyVK
import SwiftyJSON

class ListFrendController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var Action: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var arryObject = [vkObject]()
    
    @IBAction func relodTable(){
    
        tableView.reloadData()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(arryObject)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.sharedObject.arrayObject.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        if Singleton.sharedObject.arrayObject.count > 0 {
            let textCell = Singleton.sharedObject.arrayObject[indexPath.row].first_name! + " " + Singleton.sharedObject.arrayObject[indexPath.row].last_name!
            
            cell.textLabel?.text = textCell

        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         print("You selected cell #\(indexPath.row)!")
    }
    
 
}
