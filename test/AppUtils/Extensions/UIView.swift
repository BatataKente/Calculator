//
//  UIView.swift
//  test
//
//  Created by Josicleison on 06/10/22.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        
        for view in views {
            
            addSubview(view)
        }
    }
    
    func constraint(to view: Any? = nil,
                    by attributes: [NSLayoutConstraint.Attribute]? = nil,
                    _ attributes_constants: [NSLayoutConstraint.Attribute: CGFloat]? = nil,
                    relation: NSLayoutConstraint.Relation = .equal,
                    multiplier: CGFloat = 1,
                    constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        guard let safeAreaLayoutGuide = superview?.safeAreaLayoutGuide else {return}
        
        if let attributes = attributes {
            
            for attribute in attributes {
                
                superview?.addConstraint(NSLayoutConstraint(item: self,
                                                            attribute: attribute,
                                                            relatedBy: relation,
                                                            toItem: view ?? safeAreaLayoutGuide,
                                                            attribute: attribute,
                                                            multiplier: multiplier,
                                                            constant: constant))
            }
        }
        
        if let attributes = attributes_constants {
            
            for attribute in attributes {
                
                superview?.addConstraint(NSLayoutConstraint(item: self,
                                                            attribute: attribute.key,
                                                            relatedBy: relation,
                                                            toItem: view ?? safeAreaLayoutGuide,
                                                            attribute: attribute.key,
                                                            multiplier: multiplier,
                                                            constant: attribute.value))
            }
        }
    }
}
