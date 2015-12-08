//
//  ViewController.swift
//  tipper
//
//  Created by Aditya Purandare on 08/12/15.
//  Copyright © 2015 Aditya Purandare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "0.00"
        totalLabel.text = "0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChange(sender: AnyObject) {
        
        var tipPercentages = [0.15, 0.18, 0.20, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: tipField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let totalAmount = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", totalAmount)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

