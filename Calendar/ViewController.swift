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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

