//
//  LoginView.swift
//  SexyBundle
//
//  Created by Gabriel Pereira on 22/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import UIKit

protocol LoginDelegate: class {
    func userDidInputPhone(_ phone: String)
}

class LoginView: UIView {
    weak var delegate: LoginDelegate?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Vamos começar"
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        
        label.text = "O primeiro passo do cadastro é informar seu número do WhatsApp \n\n Enviaremos um código para validar seu número, ele será seu login na Ame."
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Número do WhatsApp"
        textField.borderStyle = .roundedRect
        textField.keyboardType = UIKeyboardType.phonePad
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    init(delegate: LoginDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }
    
    func setupComponents() {
        addSubview(titleLabel)
        addSubview(bodyLabel)
        addSubview(phoneTextField)
        addSubview(startButton)
    }
    
    func setupConstraints() {
        // VFL (Visual Format Language)
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0).isActive = true
        bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0).isActive = true
        
        phoneTextField.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 20).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor, constant: 0).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: bodyLabel.trailingAnchor, constant: 0).isActive = true
        
        startButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 20).isActive = true
        startButton.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor, constant: 0).isActive = true
        startButton.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor, constant: 0).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupExtraConfiguration() {
        backgroundColor = .white
        startButton.addTarget(self, action: #selector(userDidInputPhone), for: .touchUpInside)
    }
    
    @objc func userDidInputPhone() {
        delegate?.userDidInputPhone(phoneTextField.text!)
        phoneTextField.resignFirstResponder()
    }
}
