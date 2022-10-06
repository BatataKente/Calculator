//
//  Calculator.swift
//  test
//
//  Created by Josicleison on 06/10/22.
//

import Foundation

struct Calculator {
    
    static func baskara(a: Float, b: Float, c: Float) -> (x_1: Float, x_2: Float)? {
        
        let delta = b*b - 4*a*c
        if delta < 0 {return nil}
        
        let x_1 = ((-b) + (pow(delta,0.5)))/(2*a)
        
        let x_2 = ((-b) - (pow(delta,0.5)))/(2*a)
        
        return (x_1: x_1, x_2: x_2)
    }
}
