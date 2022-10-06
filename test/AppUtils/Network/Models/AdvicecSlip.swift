//
//  AdvicecSlip.swift
//  test
//
//  Created by Josicleison on 06/10/22.
//

import Foundation

// MARK: - Advice
struct Advice: Codable {
    
    let slip: Slip
}

// MARK: - Slip
struct Slip: Codable {
    
    let id: Int
    let advice: String
}
