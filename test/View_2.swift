//
//  AdviceView.swift
//  test
//
//  Created by Josicleison on 06/10/22.
//

import UIKit

class View_2: UIViewController {
    
    private let label = Create.label("Farofa")
    
    private lazy var button = Create.button("Back") {_ in
        
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubviews([label, button])
        view.backgroundColor = .systemMint
        
        label.constraint(by: [.centerY, .centerX])
        button.constraint([.top: 0, .trailing: -20])
    }
}
