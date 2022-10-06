//
//  Assets.swift
//  test
//
//  Created by Josicleison on 06/10/22.
//

import UIKit

struct App {
    
    static let font = UIFont.systemFont(ofSize: 30, weight: .bold)
    
    struct Create {
        
        static func textField(_ placeHolder: String) -> UITextField {
            
            let textField = UITextField()
            
            let font = App.font
            
            let attributedPlaceholder = NSMutableAttributedString(string: placeHolder,
                                                                  attributes: [NSAttributedString.Key.font: font as Any])
            
            textField.attributedPlaceholder = attributedPlaceholder
            textField.backgroundColor = .systemYellow
            textField.font = font
            textField.textColor = .white
            
            return textField
        }
    }
}
