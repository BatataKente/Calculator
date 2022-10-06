//
//  AdviceView.swift
//  test
//
//  Created by Josicleison on 06/10/22.
//

import UIKit

class View_2: UIViewController {
    
    private let label = Create.label()
    
    private lazy var button = Create.button("Back") {_ in
        
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubviews([label, button])
        view.backgroundColor = .systemMint
        
        label.constraint([.centerY: 0, .leading: Default.margins, .trailing: -Default.margins])
        button.constraint([.top: 0, .trailing: -Default.margins])
        
        Network.request {[weak self] data in
            
            self?.label.text = data.slip.advice
        }
    }
}
