//
//  UIComponentsFactory.swift
//  Game Connect
//
//  Created by Enver Dashdemirov on 23.12.24.
//

import UIKit

struct UIComponentsFactory {
    
    // We are using static function because static func belongs to the type itself. No need to instantiate
    static func createLabel(text: String, font: UIFont, textColor: UIColor, alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = alignment
        return label
    }
    
    static func createAttributedLabel(text: String, font: UIFont, textColor: UIColor, alignment: NSTextAlignment, actionTarget: Any?, action: Selector) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = alignment
        label.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: actionTarget, action: action)
        label.addGestureRecognizer(tapGestureRecognizer)
        return label
    }
    
    static func createTextField(placeholder: String, backgroundColor: UIColor, cornerRadius: CGFloat, iconName: String?) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = backgroundColor
        textField.layer.cornerRadius = cornerRadius
        textField.placeholder = placeholder

        if let iconName = iconName {
            let iconView = UIImageView(image: UIImage(named: iconName))
            iconView.contentMode = .scaleAspectFit
            iconView.frame = CGRect(x: 5, y: 5, width: 20, height: 20)
            
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
            paddingView.addSubview(iconView)
            iconView.center = paddingView.center
            
            textField.leftView = paddingView
            textField.leftViewMode = .always
        }
        
        return textField
    }
    
    static func createButton(title: String, backgroundColor: UIColor, actionTarget: Any?, action: Selector) -> UIButton {
         let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.setTitle(title, for: .normal)
         button.setTitleColor(.white, for: .normal)
         button.titleLabel?.font = .boldSystemFont(ofSize: 16)
         button.backgroundColor = backgroundColor
         button.layer.cornerRadius = 7.5
         button.addTarget(actionTarget, action: action, for: .touchUpInside)
         return button
     }
    
    static func createImageView(imageName: String, cornerRadius: CGFloat, contentMode: UIView.ContentMode) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: imageName)
        imageView.layer.cornerRadius = cornerRadius
        imageView.contentMode = contentMode
        imageView.clipsToBounds = true
        return imageView
    }
}
