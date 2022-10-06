//
//  Create.swift
//  test
//
//  Created by Josicleison on 06/10/22.
//

import UIKit

struct Create {
    
    static func textField(_ placeHolder: String) -> UITextField {
        
        let textField = UITextField()
        
        let font = Default.font
        
        let attributedPlaceholder = NSMutableAttributedString(string: placeHolder,
                                                              attributes: [NSAttributedString.Key.font: font as Any])
        
        textField.attributedPlaceholder = attributedPlaceholder
        textField.backgroundColor = .systemYellow
        textField.font = font
        textField.textColor = .white
        
        return textField
    }
    
    static func label(_ text: String? = nil) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.font = Default.font
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }
    
    static func button(_ title: String? = nil,
                       handler: @escaping UIActionHandler) -> UIButton {
        
        let button = UIButton(primaryAction: UIAction(handler: handler))
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Default.font
        
        return button
    }
}
