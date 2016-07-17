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
    
    @IBAction func saveEvent(sender: UIButton) {
        eventStore.requestAccessToEntityType(.Event, completion: { (granted, error) in
        
            if (granted == false ) {
                print("Access Denied")
            } else {
                let arrayCalrs = self.eventStore.calendarsForEntityType(.Event)
                var theCal: EKCalendar!
                for calr in arrayCalrs {
                    if(calr.title == self.eventCalenda.text) {
                        theCal = calr
                        print(theCal.title)
                    }
                    
                }
                if(theCal != nil) {
                    let event = EKEvent(eventStore: self.eventStore)
                    event.title = self.titleEvent.text!
                    event.startDate = self.dataPicker.date
                    event.endDate = self.dataPicker.date.dateByAddingTimeInterval(3600)
                    event.calendar = theCal
                    do {
                        try! self.eventStore.saveEvent(event, span: .ThisEvent)
                        let alert = UIAlertController(title: "Calendar", message: "event created \(event.title) in \(theCal.title)", preferredStyle: .Alert)
                        alert.addAction(UIAlertAction(title: "Accept", style: .Default, handler: nil))
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.presentViewController(alert, animated: true, completion: nil)
                            
                        })
                        
                    }
                }
                else {
                    print("No calendar with that name")
                }
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

