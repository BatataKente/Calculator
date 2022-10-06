//
//  ViewController.swift
//  test
//
//  Created by Josicleison on 06/10/22.
//

import UIKit

class View: UIViewController {
    
    private struct ValueGetter {
        
        let stack: UIStackView, a: UITextField, b: UITextField, c: UITextField
    }
    
    private let valueGetter: ValueGetter = {
        
        let a = App.Create.textField("a")
        let b = App.Create.textField("b")
        let c = App.Create.textField("c")
        
        let valueInStack = UIStackView(arrangedSubviews: [a, b, c])
        valueInStack.distribution = .fillEqually
        
        return ValueGetter(stack: valueInStack,
                           a: a, b: b, c: c)
    }()
    
    private let resultLabel: UILabel = {
        
        let resultLabel = UILabel()
        resultLabel.numberOfLines = 0
        resultLabel.font = App.font
        resultLabel.textColor = .white
        
        return resultLabel
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(valueGetter.stack)
        view.addSubview(resultLabel)
        view.backgroundColor = .systemRed
        
        valueGetter.stack.translatesAutoresizingMaskIntoConstraints = false
        
        valueGetter.stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        valueGetter.stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        valueGetter.stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
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

