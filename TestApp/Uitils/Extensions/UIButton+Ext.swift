//
//  UIButton+Ext.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/2/21.
//

import UIKit

extension UIButton {
    
    convenience init(buttonImage: UIImage) {
        self.init(type: .system)
        self.imageView?.contentMode = .scaleAspectFit
        self.setImage(buttonImage.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    convenience init(title: String, titleColor: UIColor, backgroundColor: UIColor? = nil, fontSize: CGFloat, numberOfLines: Int = 1, cornerRadius: CGFloat? = nil) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        self.titleLabel?.numberOfLines = numberOfLines
        self.titleLabel?.textAlignment = .center
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
        self.backgroundColor = backgroundColor
    }
    
}
