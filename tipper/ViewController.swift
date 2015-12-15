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
    
    var movedFlag = false
    var topFlag = false
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
//        self.navigationItem.r
        tipLabel.text = "$0.00"
        let tipValue = defaults.integerForKey("tipIndex")
        tipController.selectedSegmentIndex = tipValue
        
        //Navigation Bar to Transparent
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        self.navigationController!.view.backgroundColor = UIColor.clearColor()

        //Make Text field first responder
        self.tipField.becomeFirstResponder()
        
        //Animate from alpha
        self.tipLabel.alpha = 0
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
        
        topFlag = true

        //Persists the data across restarts
        if(defaults.objectForKey("lastlogin") == nil)
        {
            defaults.setObject(NSDate(), forKey: "lastlogin")
        }
        let start = defaults.objectForKey("lastlogin")
        let end = NSDate();
        
        var timeInterval: Double = start!.timeIntervalSinceDate(end);
        timeInterval = timeInterval * -1.0;

        if(timeInterval > 600.0)
        {
            defaults.setDouble(0, forKey: "billAmount")
            defaults.setInteger(0, forKey: "tipIndex")
        }

        tipField.text = String(defaults.doubleForKey("billAmount"))
        print(tipField.text)

        defaults.setObject(NSDate(), forKey: "lastlogin")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        //print(tipField.text)
        var tipPercentages = [0.15, 0.18, 0.20, 0.25]
        let tipPercentage = tipPercentages[tipController.selectedSegmentIndex]
        
        let billAmount = NSString(string: tipField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = tip + billAmount
        //print(billAmount, tip, total)
        
        tipLabel.text = String(format: "$%.2f", tip)
        
        let tipFor1 = total
        let tipFor2 = total/2
        let tipFor3 = total/3
        let tipFor4 = total/4
        
        P1label.text = String(format: "$%.2f", tipFor1)
        P2label.text = String(format: "$%.2f", tipFor2)
        P3label.text = String(format: "$%.2f", tipFor3)
        P4label.text = String(format: "$%.2f", tipFor4)

        defaults.setDouble(billAmount, forKey: "billAmount")
        topFlag = true
        
        if(movedFlag == false)
        {
            animateViewMoving(true, moveValue: 100)
            UIView.animateWithDuration(0.4, delay: 0, options: .CurveEaseOut, animations:
                {
                    self.tipLabel.alpha = 1
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
                completion:
                {
                    (finished:Bool) in
                }
            )
            movedFlag = true
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if(topFlag == true)
        {
            animateViewMoving(false, moveValue: 100)
            topFlag = false
        }
        if(tipField.text == "$" && movedFlag == true)
        {
            UIView.animateWithDuration(0.2, delay: 0, options: .CurveEaseOut, animations:
                {
                    self.tipLabel.alpha = 0
                    self.tipController.alpha = 0
                    self.plusLabel.alpha = 0
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
                },
                completion:
                {
                    (finished:Bool) in
                }
            )
            movedFlag = false
        }
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:NSTimeInterval = 0.4
        let movement:CGFloat = (up ? -moveValue : moveValue)
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        UIView.commitAnimations()
    }
    
}

