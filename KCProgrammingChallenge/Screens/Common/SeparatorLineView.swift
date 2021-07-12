//
//  SeparatorLineView.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

final class SeparatorLineView: UIView {
    
    private enum Constants {
        static let height: CGFloat = 1
        static let backgroundColor: UIColor = .lightGray
    }
    
    init() {
        super.init(frame: .zero)
        configureLine()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLine() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = Constants.backgroundColor
        heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
    }
}
