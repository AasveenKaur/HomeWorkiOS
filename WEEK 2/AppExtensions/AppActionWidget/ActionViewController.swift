//
//  ActionViewController.swift
//  AppActionWidget
//
//  Created by Aasveen Kaur on 7/8/16.
//  Copyright © 2016 Aasveen Kaur. All rights reserved.
//

import UIKit
import MobileCoreServices
import AppExtentionKit

class ActionViewController: UIViewController {
var bookmarkURL: NSURL!
    
    @IBOutlet weak var newRowTitle: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let extensionItem = extensionContext?.inputItems.first as! NSExtensionItem
        let itemProvider = extensionItem.attachments?.first as! NSItemProvider
        
        let propertyList = String(kUTTypePropertyList)
        if itemProvider.hasItemConformingToTypeIdentifier(propertyList) {
            
          
            
            
            itemProvider.loadItemForTypeIdentifier(propertyList, options: nil, completionHandler: { (item, error) -> Void in
             
                let URLValue = item as! NSURL
                    self.bookmarkURL = URLValue
                
            })
        } else {
            print("errorrrrrr")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func done() {
        // Return any edited content to the host app.
        // This template doesn't do anything, so we just echo the passed in items.
        
        var statusMessage: NSString
        
        if (newRowTitle.text!.isEmpty) {
            statusMessage = "Cannot save empty title"
        } else {
            let newCity = City(name:newRowTitle.text!)
            let dataManagerInstance = DataManager.sharedInstance
            dataManagerInstance.addCity(newCity)
            dataManagerInstance.saveCityList()
           
            statusMessage = "Saved successfully"
        }
            
        self.extensionContext!.completeRequestReturningItems(self.extensionContext!.inputItems, completionHandler: nil)
    }

}
