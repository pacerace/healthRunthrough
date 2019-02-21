//
//  healthkitmnager.swift
//  healthRunthrough
//
//  Created by Pace Cranney on 2/20/19.
//  Copyright © 2019 Biopace. All rights reserved.
//

import Foundation
import HealthKit

class HealthkitManager : NSObject{
    
    static let sharedInstance = HealthkitManager()
    //prevent creation of other instances
    private override init() {}
    
    //initialize single instanc eof hkstore
    let healthStore = HKHealthStore()
    
    // add check if access to HK is granted func
    
    //request access to Healthstore
    func authorizeHealthKit(_ completion : @escaping((_ success: Bool, _ error: Error?) ->Void)){
        
        //create heart rate type
        guard let heartRateType :HKQuantityType = HKQuantityType.quantityType(forIdentifier: .heartRate) else{
            return
        //if no heart rate type continue on
        }
        
        //types we plan to share and read, can be added to later as we enter phase 2
        //for now only heart rate type
        let typesToShare = Set([heartRateType])
        let typesToRead = Set([heartRateType])
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            print("authorization was successful? \(success)")
            completion(success, error)
        }
        
    }
}
