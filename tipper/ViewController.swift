//
//  ViewController.swift
//  tipper
//
//  Created by Aditya Purandare on 08/12/15.
//  Copyright © 2015 Aditya Purandare. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipField: UITextField!
    @IBOutlet weak var P1label: UILabel!
    @IBOutlet weak var P2label: UILabel!
    @IBOutlet weak var P3label: UILabel!
    @IBOutlet weak var P4label: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        
        let tipValue = defaults.integerForKey("tipIndex")
        //print(defaults.integerForKey("tipIndex"))
        tipController.selectedSegmentIndex = tipValue
        
        //Animate from alpha
        self.tipLabel.alpha = 0
        
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
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.15, 0.18, 0.20, 0.25]
        let tipPercentage = tipPercentages[tipController.selectedSegmentIndex]
        
        let billAmount = NSString(string: tipField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = tip + billAmount
        
        tipLabel.text = String(format: "$%.2f", tip)
        
        let tipFor1 = total
        let tipFor2 = total/2
        let tipFor3 = total/3
        let tipFor4 = total/4
        
        P1label.text = String(format: "$%.2f", tipFor1)
        P2label.text = String(format: "$%.2f", tipFor2)
        P3label.text = String(format: "$%.2f", tipFor3)
        P4label.text = String(format: "$%.2f", tipFor4)


    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    /*@IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipField: UITextField!
    @IBOutlet weak var P1label: UILabel!
    @IBOutlet weak var P2label: UILabel!
    @IBOutlet weak var P3label: UILabel!
    @IBOutlet weak var P4label: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!*/
    
    func textFieldDidBeginEditing(textField: UITextField) {
        UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseInOut, animations: {
            self.tipField.frame.origin = CGPointMake(self.view.frame.size.width/2, (self.view.frame.size.width/2) - 20 )
            self.tipLabel.alpha = 1
  

            
            },
            completion: {
                (finished:Bool) in
        })
    }
    
}

