//
//  ViewController.swift
//  healthRunthrough
//
//  Created by Pace Cranney on 2/19/19.
//  Copyright © 2019 Biopace. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    let healthkitManager = HealthkitManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        // Check if health is available on this device
        func isHealthAvailable() -> Bool {
            return HKHealthStore.isHealthDataAvailable()
        }
        
        // Check if this app is authorized to write the necessary data to Health
        func isHealthAuthorized() -> Bool {
            return healthStore!.authorizationStatus(for: bpmType!) == HKAuthorizationStatus.sharingAuthorized
        }
        // Do any additional setup after loading the view, typically from a nib.
        healthkitManager.authorizeHealthKit{ (success, error) in print("was healthkit uccessful?\(success)")
            
        }
    }
}

