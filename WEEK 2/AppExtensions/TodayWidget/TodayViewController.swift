//
//  TodayViewController.swift
//  TodayWidget
//
//  Created by Aasveen Kaur on 7/7/16.
//  Copyright © 2016 Aasveen Kaur. All rights reserved.
//

import UIKit
import NotificationCenter
import AppExtentionKit

class TodayViewController: UIViewController, NCWidgetProviding{
        
    @IBOutlet weak var cityName: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityName.text = DataManager.sharedInstance.getLatestTableEntry()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
        
    
    
}
