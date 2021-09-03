//
//  HomeView.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/2/21.
//

import UIKit

class HomeView: UIView {
    
    let accountBalanceLabel = UILabel(text: "Account Balance:", color: .black, size: 24, alignment: .center)
    let balance = UILabel(text: "$ 0.00", color: .black, size: 28, alignment: .center)
    let transactionLabel = UILabel(text: "Transactions", color: .black, size: 24)
    let tableView: UITableView = {
        let table = UITableView()
        table.tableFooterView = UIView()
        table.backgroundColor = .white
        table.allowsSelection = false
        return table
    }()
    
    lazy var balanceStack = VerticalStackView(arrangedSubViews: [accountBalanceLabel, balance], spacing: 10)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        addSubview(balanceStack)
        balanceStack.anchor(top: safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 34, left: 0, bottom: 0, right: 0))
        balanceStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(transactionLabel)
        transactionLabel.anchor(top: balanceStack.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 34, left: 22, bottom: 0, right: 0))
        
        addSubview(tableView)
        tableView.anchor(top: transactionLabel.bottomAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 22, bottom: 10, right: 22))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
