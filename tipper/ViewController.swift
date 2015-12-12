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
    @IBOutlet weak var tipController: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let intValue = defaults.integerForKey("tipIndex")
        //print(intValue)
        //print(defaults.integerForKey("tipIndex"))
        tipController.selectedSegmentIndex = intValue
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

