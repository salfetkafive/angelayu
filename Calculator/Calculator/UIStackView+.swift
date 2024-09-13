//
//  UIStackView+.swift
//  Calculator
//
//  Created by salfetkafive on 12.09.2024.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
