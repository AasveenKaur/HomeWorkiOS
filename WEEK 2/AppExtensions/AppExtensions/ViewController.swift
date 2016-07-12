//
//  ViewController.swift
//  AppExtensions
//
//  Created by Aasveen Kaur on 7/7/16.
//  Copyright © 2016 Aasveen Kaur. All rights reserved.
//

import UIKit
import AppExtentionKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
     var cities:NSArray!
    
     @IBOutlet weak  var  tableView: UITableView!
    
    @IBAction func addNewCity(sender: AnyObject) {
        let newCity:City = City(name: "Seattle")
        DataManager.sharedInstance.addCity(newCity)
        DataManager.sharedInstance.saveCityList()
        cities = DataManager.sharedInstance.loadTableData()
       dispatch_async(dispatch_get_main_queue()) {
        self.tableView.reloadData()

        }
        
        
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
        cities = DataManager.sharedInstance.loadTableData()
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let object = cities[indexPath.row] as! City
        //self.configureCell(cell, withObject: object)
        cell.textLabel?.text = object.name
        return cell
    }
    
    

}

