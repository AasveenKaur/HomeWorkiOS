//
//  City.swift
//  AppExtensions
//
//  Created by Aasveen Kaur on 7/11/16.
//  Copyright © 2016 Aasveen Kaur. All rights reserved.
//

import UIKit

public class City: NSObject, NSCoding {
    
    
    public let name: String
    
    public init( name: String) {
        self.name = name
        
        super.init()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String
        
    }
    
    public func encodeWithCoder(aCoder: NSCoder)  {
        aCoder.encodeObject(name, forKey: "name")
        
    }
    
}