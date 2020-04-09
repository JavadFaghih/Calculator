//
//  ViewController.swift
//  Calculator
//
//  Created by JavadFaghih on 1/20/1399 AP.
//  Copyright © 1399 AP JavadFaghih. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

  
    private var isFinishedTypingNumber: Bool = true
    
   
         var displayValue: Double {
               
               get {
                   
                guard let number = Double(displayLabel.text!) else {
                       fatalError("Cannot covert display label to a Double.")
                   }
                   return number
                   
               }
               set {
               displayLabel.text = String(newValue)
                   
               }
        
        }

    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    private var calculate = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        if let calcMethod = sender.currentTitle {
              
     
            guard let result = calculate.calculate(Symbol: calcMethod) else {
                fatalError("the result of the calculation is nil")
            }
            
            displayValue = result
            
            
            
            
        }
        
  
        isFinishedTypingNumber = true
        
        
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numPressed = sender.currentTitle {
            
            if isFinishedTypingNumber {
                
                displayLabel.text = numPressed
                isFinishedTypingNumber = false
            } else {
                
                if  numPressed == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                    
                }
                
                
                
                displayLabel.text = displayLabel.text! + numPressed
                
            }
            
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}


