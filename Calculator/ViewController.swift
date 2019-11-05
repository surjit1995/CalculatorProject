//
//  ViewController.swift
//  Calculator
//
//  Created by MacStudent on 2019-10-29.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit                                             // provides framework to run GUI applications




class ViewController: UIViewController {                // class viewController extends from                                                                                              UIViewController
    
    // data members
    var previousNumber = 0.0            //12    number that we entered before the operator is stored in this variable
    var operation = 0                  // +
    var numberOnScreen : Double = 0    //15     number that we entered after the operator that is currently on the screen
    
    @IBOutlet weak var label: UILabel!                 // outlet for showing results
    
    
    @IBAction func numbers(_ sender: UIButton)         // method to get numbers from screen
    {
        
        if(label.text == "0"){
            label.text = ""
        }
        
        if sender.tag == 12                            // tag 12 = Decimal
            
        {
            label.text = label.text! + String(".")
            
        }
        else{
            
            label.text = label.text! +  String(sender.tag)
        }
        
        numberOnScreen = Double(label.text!) ?? 0.0
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if  label.text != "" && sender.tag != 10 && sender.tag != 17          // tag 10 = clear button(AC) tag 17 = equal button(=)
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 13                                               // tag 13 = Division
            {
                //label.text = "/"
            }
            else if sender.tag == 14                                          //tag 14 = Multiplication
            {
                //label.text = "*"
            }
            else if sender.tag == 15                                          // tag 15 = Subtraction
            {
                //label.text = "-"
            }
            else if sender.tag == 16                                          // tag 16 = Addition
            {
                //label.text = "+"
            }
            else if sender.tag == 11                                         // tag 11 = Modulous
            {
                //label.text = "%"
            }
            label.text = ""
            operation = sender.tag
            
            
        }
        else if sender.tag == 17                                           // tag 17 = equal to button
        {
            
            var numq:Double! = 0.0
            if operation == 13
            {
                numq = previousNumber / numberOnScreen
                //label.text = String(previousNumber / num)
            }
            else if operation == 14
            {
                numq = previousNumber * numberOnScreen
                //label.text = String(previousNumber * num)
            }
            else if operation == 15
            {
                numq = previousNumber - numberOnScreen
                //label.text = String(previousNumber - num)
            }
            else if operation == 16
            {
                numq = previousNumber + numberOnScreen
                //label.text = String(previousNumber + num)
            }
            else if operation == 11
            {
                numq = previousNumber.truncatingRemainder(dividingBy: numberOnScreen)
                //label.text = String(previousNumber + num)
            }
            roundOff(num: numq)
        }
        else if sender.tag == 10                                         // tag 10 = clear button (AC)
        {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    func roundOff(num: Double) {                                        // method to round off the output
        if num.rounded(.up) == num.rounded(.down) {
            guard !(num.isNaN || num.isInfinite)
                else {
                    label.text = "Error"
                    return                                              // or do some error handling
            }
            let result = Int(num)
            label.text = String(result)
            self.numberOnScreen = Double(result)
        } else {
            label.text = String(num)
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}


