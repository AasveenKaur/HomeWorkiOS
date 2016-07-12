//
//  DataManager.swift
//  AppExtensions
//
//  Created by Aasveen Kaur on 7/7/16.
//  Copyright © 2016 Aasveen Kaur. All rights reserved.
//



import UIKit


public class DataManager: NSObject {
    var defaults: NSUserDefaults = NSUserDefaults(suiteName: "group.aasveen.appextensions")!
    
    public static let sharedInstance = DataManager()
    private override init() { }
    
   
    
    public lazy var cityList: [City] = DataManager.sharedInstance.loadTableData()

    public func loadTableData() -> [City] {
        cityList = getCityList()
        return cityList
    }
    
    public func getLatestTableEntry() -> String {
        cityList = getCityList()
        return cityList.last?.name != nil ? (cityList.last?.name)! : "NO ENTRY"
    }
    
    
    
    func getCityList() -> [City] {
       
        let encodedObject:NSData? = defaults.dataForKey("cities")
        if let encodedObject = encodedObject{
        let loadedCities = NSKeyedUnarchiver.unarchiveObjectWithData(encodedObject)
            return loadedCities as! [City]
        }
        
        return [City]()
    }
    
    public func saveCityList() {
        let encodedObject:NSData = NSKeyedArchiver.archivedDataWithRootObject(cityList)
        defaults.setObject(encodedObject, forKey: "cities")
        defaults.synchronize()
    }
    
    public func addCity(city: City) {
       
        cityList.append(city)
    }
    
   
    

    
   
    
    
    
}
