//
//  UILabel+Ext.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/2/21.
//

import UIKit

extension UILabel {
    convenience init(text: String, color: UIColor = .white, size: CGFloat, numberOfLines: Int? = nil, alignment: NSTextAlignment? = nil) {
        self.init(frame: .zero)
        self.text = text
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: size)
        if let lines = numberOfLines {
            self.numberOfLines = lines
        }
        if let alignment = alignment {
            self.textAlignment = alignment
        }
    }
}
