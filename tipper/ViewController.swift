//
//  ViewController.swift
//  tipper
//
//  Created by Aditya Purandare on 08/12/15.
//  Copyright © 2015 Aditya Purandare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var tipController: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tipValue = defaults.integerForKey("tipIndex")
        //print(defaults.integerForKey("tipIndex"))
        tipController.selectedSegmentIndex = tipValue
        if(defaults.objectForKey("lastlogin") == nil)
        {
            defaults.setObject(NSDate(), forKey: "lastlogin")
        }

        
        let start = defaults.objectForKey("lastlogin")
        let end = NSDate();
        
        var timeInterval: Double = start!.timeIntervalSinceDate(end);
        timeInterval = timeInterval * -1.0;
        
        if(timeInterval > 750)
        {
            //do something
        }
        
        defaults.setObject(NSDate(), forKey: "lastlogin")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    

}

