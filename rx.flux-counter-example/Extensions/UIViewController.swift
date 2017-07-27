//
//  UIViewController.swift
//  rx.flux
//
//  Created by Hung Dinh Van on 7/7/17.
//  Copyright © 2017 ChuCuoi. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupView(_ stackView: UIStackView) {
        view.addSubview(stackView)
        view.backgroundColor = UIColor.white
        NSLayoutConstraint.autoCreateAndInstallConstraints {
            stackView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 64, left: 12, bottom: 0, right: 12), excludingEdge: .bottom)
        }
    }
    
    func createTextField() -> UITextField {
        let textField = UITextField()
        textField.autoSetDimension(.height, toSize: 44)
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }
    
    func createButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }
    
    func createStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }
}
