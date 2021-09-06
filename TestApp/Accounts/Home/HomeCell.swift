//
//  HomeCell.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/2/21.
//

import UIKit

class HomeCell: UITableViewCell {
    
    static let cellId = "homeCell"
    
    let label = UILabel(text: "Label", color: .black, size: 18)
    let amount = UILabel(text: "$ 0.00", color: .black, size: 24)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private func setupUI(){
        addSubview(label)
        label.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 22, bottom: 0, right: 0))
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(amount)
        amount.anchor(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 22))
        amount.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with data: transactionModel){
        let labelText = data.label
        if labelText == "Debit" {
            label.textColor = .systemRed
            amount.textColor = .systemRed
        }
        if labelText == "Credit" {
            label.textColor = .systemBlue
            amount.textColor = .systemBlue
        }
        label.text = labelText
        amount.text = "$ " + data.amount
    }
}


