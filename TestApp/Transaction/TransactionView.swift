//
//  TransactionView.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/2/21.
//

import UIKit

class TransactionView: UIView {
    
    let amountLabel = UILabel(text: "Amount:", color: .black, size: 24)
    let textField : UITextField = {
        let field = UITextField()
        field.constraintHeight(constant: 44)
        field.placeholder = "Enter Amount"
        field.textAlignment = .center
        field.borderStyle = .roundedRect
        field.font = UIFont.systemFont(ofSize: 22)
        field.keyboardType = .numberPad
        return field
    }()
    
    let creditButton = UIButton(title: "Credit", titleColor: .white, backgroundColor: .systemBlue, fontSize: 22, cornerRadius: 8)
    let debitButton = UIButton(title: "Debit", titleColor: .white, backgroundColor: .systemRed, fontSize: 22, cornerRadius: 8)
    
    lazy var buttonStack = VerticalStackView(arrangedSubViews: [creditButton, debitButton], spacing: 40, distribution: .fillEqually)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        addSubview(amountLabel)
        amountLabel.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 62, left: 22, bottom: 0, right: 0))
        
        addSubview(textField)
        textField.anchor(top: amountLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 22, bottom: 0, right: 22))
        
        addSubview(buttonStack)
        buttonStack.anchor(top: textField.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 60, left: 22, bottom: 0, right: 22))
        creditButton.constraintHeight(constant: 52)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
