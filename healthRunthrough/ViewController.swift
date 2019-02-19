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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if HKHealthStore.isHealthDataAvailable(){
            //if available add func
        }
        else{
            let alertController = UIAlertController(title: "Warning", message: "HealthKit is not available on this device", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title : "OK", style : UIAlertAction.Style.cancel, handler: nil ))
            
            self.present(alertController,animated: true, completion: nil)
        }
    }
    func dataToRead() -> NSSet {
        guard let heartRate : HKQuantityType = HKQuantityType.quantityType (forIdentifier: .heartRate){
            else{
                return
            }
            
        }
        return NSSet(objects: heartRate)
    }
    

}

