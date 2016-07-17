//
//  ViewController.swift
//  Calendar
//
//  Created by Jalloh on 17/07/2016.
//  Copyright © 2016 CodeWithJalloh. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // properties
    var eventStore: EKEventStore!
    var calendar: EKCalendar!
    
    // outlets
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var eventCalenda: UITextField!
    @IBOutlet weak var titleEvent: UITextField!
    
    
    
    @IBAction func saveCal(sender: UIButton) {
        let cal = EKCalendar(forEntityType: .Event, eventStore: eventStore)
        eventStore.requestAccessToEntityType(.Event, completion: { (granted, error) in
        
            if (granted == false ) {
                print("Access Denied")
            } else {
                var auxiliar = self.eventStore.sources
                cal.source = auxiliar[0]
                cal.title = self.textField.text!
                print(cal.title)
                
                try! self.eventStore.saveCalendar(cal, commit: true)
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

