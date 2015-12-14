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
    @IBOutlet weak var tipController: UISegmentedControl!
    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var IconP10: UIImageView!
    @IBOutlet weak var IconP9: UIImageView!
    @IBOutlet weak var IconP8: UIImageView!
    @IBOutlet weak var IconP7: UIImageView!
    @IBOutlet weak var IconP6: UIImageView!
    @IBOutlet weak var IconP5: UIImageView!
    @IBOutlet weak var IconP4: UIImageView!
    @IBOutlet weak var IconP3: UIImageView!
    @IBOutlet weak var IconP2: UIImageView!
    @IBOutlet weak var IconP1: UIImageView!
    
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
        self.billLabel.alpha = 0
        self.plusLabel.alpha = 0
        self.tipController.alpha = 0
        self.P1label.alpha = 0
        self.P2label.alpha = 0
        self.P3label.alpha = 0
        self.P4label.alpha = 0
        self.IconP1.alpha = 0
        self.IconP2.alpha = 0
        self.IconP3.alpha = 0
        self.IconP4.alpha = 0
        self.IconP5.alpha = 0
        self.IconP6.alpha = 0
        self.IconP7.alpha = 0
        self.IconP8.alpha = 0
        self.IconP9.alpha = 0
        self.IconP10.alpha = 0

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
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        UIView.animateWithDuration(0.4, delay: 0.1, options: .CurveEaseOut, animations: {
            self.tipField.frame.offsetInPlace(dx: 0, dy: -50)
            self.billLabel.frame.offsetInPlace(dx: 0, dy: -50)
            self.tipLabel.frame.offsetInPlace(dx: 0, dy: -50)
            self.tipController.frame.offsetInPlace(dx: 0, dy: -50)
            self.plusLabel.frame.offsetInPlace(dx: 0, dy: -50)
            self.P1label.frame.offsetInPlace(dx: 0, dy: -50)
            self.P2label.frame.offsetInPlace(dx: 0, dy: -50)
            self.P3label.frame.offsetInPlace(dx: 0, dy: -50)
            self.P4label.frame.offsetInPlace(dx: 0, dy: -50)
            self.IconP1.frame.offsetInPlace(dx: 0, dy: -40)
            self.IconP2.frame.offsetInPlace(dx: 0, dy: -40)
            self.IconP3.frame.offsetInPlace(dx: 0, dy: -40)
            self.IconP4.frame.offsetInPlace(dx: 0, dy: -40)
            self.IconP5.frame.offsetInPlace(dx: 0, dy: -40)
            self.IconP6.frame.offsetInPlace(dx: 0, dy: -40)
            self.IconP7.frame.offsetInPlace(dx: 0, dy: -40)
            self.IconP8.frame.offsetInPlace(dx: 0, dy: -40)
            self.IconP9.frame.offsetInPlace(dx: 0, dy: -40)
            self.IconP10.frame.offsetInPlace(dx: 0, dy: -40)
            
            self.tipLabel.alpha = 1
            self.billLabel.alpha = 1
            self.tipController.alpha = 1
            self.plusLabel.alpha = 1
            self.P1label.alpha = 1
            self.P2label.alpha = 1
            self.P3label.alpha = 1
            self.P4label.alpha = 1
            self.IconP1.alpha = 1
            self.IconP2.alpha = 1
            self.IconP3.alpha = 1
            self.IconP4.alpha = 1
            self.IconP5.alpha = 1
            self.IconP6.alpha = 1
            self.IconP7.alpha = 1
            self.IconP8.alpha = 1
            self.IconP9.alpha = 1
            self.IconP10.alpha = 1
            
            },
            completion: {
                (finished:Bool) in
        })
    }
    
}

