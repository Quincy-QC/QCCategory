//
//  Category.swift
//  ebeiben
//
//  Created by Quincy-QC on 2019/9/9.
//  Copyright © 2019 Quincy-QC. All rights reserved.
//

import UIKit
import Test

extension UITextField {
    
    class func create(placeHolder: String, textColor: UIColor = .black, placeholderColor: UIColor? = UIColor(white: 1.0, alpha: 0.6), font: UIFont = UIFont.preferredFont(forTextStyle: .body).withSize(18)) -> UITextField {
        let textField = UITextField()
        textField.textColor = textColor
        textField.tintColor = textColor
        textField.font = font
        if let placeholderColor = placeholderColor {
            let placeholderAttributes = [NSAttributedString.Key.foregroundColor : placeholderColor]
            textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: placeholderAttributes)
        } else {
            textField.placeholder = placeHolder
        }
        return textField
    }
    
    func config(placeHolder: String, textColor: UIColor = .white, placeholderColor: UIColor? = UIColor(white: 1.0, alpha: 0.6), font: UIFont = UIFont.preferredFont(forTextStyle: .body).withSize(18)) {
        self.textColor = textColor
        tintColor = textColor
        self.font = font
        if let placeholderColor = placeholderColor {
            let placeholderAttributes = [NSAttributedString.Key.foregroundColor : placeholderColor]
            attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: placeholderAttributes)
        } else {
            placeholder = placeHolder
        }
    }
}


extension UIButton {
    
    class func create(title: String, textColor: UIColor, font: UIFont) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = font
        return button
    }
    
    func config(title: String, titleColor: UIColor, font: UIFont) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = font
    }
    
    class func createRadio(title: String, textColor: UIColor = .black, font: UIFont = UIFont.preferredFont(forTextStyle: .body).withSize(15)) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "选择"), for: .selected)
        button.setImage(UIImage(named: "未选"), for: .normal)
        button.setTitle(" \(title)", for: .normal)
        button.titleLabel?.font = font
        button.setTitleColor(textColor, for: .normal)
        return button
    }
}


extension UILabel {
    
    class func create(title: String, textColor: UIColor = .black, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = textColor
        label.font = font
        return label
    }
    
    func config(title: String, textColor: UIColor = .black, font: UIFont) {
        text = title
        self.textColor = textColor
        self.font = font
    }
}


extension UIView {
    
    func parentViewController() -> UIViewController? {
        var next = superview
        while next != nil {
            if let responser = next!.next, responser.isKind(of: UIViewController.self) {
                return responser as? UIViewController
            }
            next = next?.superview
        }
        return nil
    }
}


extension UIViewController {
    
    func presentAlertController(_ viewControllerToPresent: UIViewController, _ completion: (() -> Void)? = nil) {
        present(viewControllerToPresent, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                viewControllerToPresent.dismiss(animated: true)
                if let completion = completion {
                    completion()
                }
            })
        }
    }
}

