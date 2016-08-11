//
//  ViewController.swift
//  AutoLayoutsChatDemo
//
//  Created by Aasveen Kaur on 8/10/16.
//  Copyright © 2016 Aasveen Kaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var messageList:NSMutableArray = []

    @IBOutlet weak var tableView: UITableView!
     @IBOutlet weak var enterMessageField: UITextField!
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterMessageField.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

extension ViewController:UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath) as! MyCustomTableViewCell
        
        if(indexPath.row % 2 == 0){
            cell.message.textAlignment = .Left
        }
        else{
            cell.message.textAlignment = .Right
            
        }
        
        cell.message.text = messageList[indexPath.row] as? String
        
        
        cell.date.text = getCurrentTime()
        return cell
    }
    
    func getCurrentTime() -> String {
    
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year, .Hour , .Minute], fromDate: date)
        
        let year =  components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        
       return "\(month)\\\(day)\\\(year)|\(hour):\(minute)"
    }
    
    
}


extension ViewController:UITextFieldDelegate{
    
   
    func textFieldShouldReturn(textField: UITextField) -> Bool {
     textField.resignFirstResponder()
     addRow()
     textField.text = ""
     return true
        
    }
}

extension ViewController{
    func addRow()  {
        messageList.addObject(enterMessageField.text!)
        tableView.beginUpdates()
        tableView.insertRowsAtIndexPaths([
            NSIndexPath(forRow: messageList.count-1, inSection: 0)
            ], withRowAnimation: .Automatic)
        tableView.endUpdates()
        
    }

}
