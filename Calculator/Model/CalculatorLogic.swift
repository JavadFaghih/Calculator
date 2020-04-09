//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by JavadFaghih on 1/20/1399 AP.
//  Copyright © 1399 AP JavadFaghih. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcmethod: String)?
    
    
    mutating func setnumber(_ number: Double) {
        self.number = number
    }
    
   
    
    mutating func calculate(Symbol: String) -> Double?{
        if let n = number {
            switch Symbol {
            case "+/-":
                return  n * -1
            case "%":
                return  n * 0.01
            case "AC":
                return 0
            case "=":
              return  performTwoNumCalclation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcmethod: Symbol)
            }
        }
        return nil
    }
    
    
    private func performTwoNumCalclation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcmethod {
            
            
            switch operation {
            case "+":
                n1 + n2
            case "-":
                n1 - n2
            case "*":
                n1 * n2
            case "/":
                n1 / n2
            default:
                 fatalError("the operation does not match any of the cases.")
            }
            
            
        }
        
        return nil
        
    }
    
    
}



