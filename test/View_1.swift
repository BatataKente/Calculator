//
//  ViewController.swift
//  test
//
//  Created by Josicleison on 06/10/22.
//

import UIKit

class View_1: UIViewController {
    
    private struct ValueGetter {
        
        let stack: UIStackView, a: UITextField, b: UITextField, c: UITextField
    }
    
    private let valueGetter: ValueGetter = {
        
        let a = Create.textField("a")
        let b = Create.textField("b")
        let c = Create.textField("c")
        
        let valueInStack = UIStackView(arrangedSubviews: [a, b, c])
        valueInStack.distribution = .fillEqually
        
        return ValueGetter(stack: valueInStack,
                           a: a, b: b, c: c)
    }()
    
    private let resultLabel: UILabel = {
        
        let resultLabel = Create.label()
        
        return resultLabel
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let button = Create.button("Go") {_ in
            
            let view = View_2()
            view.modalPresentationStyle = .fullScreen
            
            self.present(view, animated: true)
        }
        
        view.addSubviews([valueGetter.stack, resultLabel, button])
        view.backgroundColor = .systemRed
        
        valueGetter.stack.constraint(by: [.top, .leading, .trailing])
        button.constraint([.bottom: -Default.margins, .leading: Default.margins])
        resultLabel.constraint(by: [.centerX, .centerY])
        
        valueGetter.a.addTarget(self, action: #selector(textFieldsTarget), for: .editingDidEnd)
        valueGetter.b.addTarget(self, action: #selector(textFieldsTarget), for: .editingDidEnd)
        valueGetter.c.addTarget(self, action: #selector(textFieldsTarget), for: .editingDidEnd)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        valueGetter.a.endEditing(true)
        valueGetter.b.endEditing(true)
        valueGetter.c.endEditing(true)
    }
    
    @objc private func textFieldsTarget(_ sender: UITextField) {
        
        let result = Calculator.baskara(a: readText(valueGetter.a.text),
                                        b: readText(valueGetter.b.text),
                                        c: readText(valueGetter.c.text))
        
        guard let result = result else {resultLabel.text = "Valor indeterinado"; return}
        resultLabel.text = "x1: \(result.x_1)\nx2: \(result.x_2)"
    }
    
    private func readText(_ text: String?) -> Float {
        
        return Float(text ?? "0") ?? 0
    }
}

