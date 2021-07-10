//
//  ContactDetailItemTableViewCell.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

final class ContactDetailItemTableViewCell: UITableViewCell {
    
    private enum Constants {
        enum TitleLabel {
            static let padding: UIEdgeInsets = .init(top: 20, left: 10, bottom: 0, right: 0)
            static let textColor: UIColor? = .secundaryContent
            static let font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        }
        
        enum InformationLabel {
            static let padding: UIEdgeInsets = .init(top: 10, left: 0, bottom: -20, right: -30)
            static let textColor: UIColor? = .mainContent
            static let font = UIFont.systemFont(ofSize: 14, weight: .bold)
            static let numberOfLines = 0
        }
        
        enum HintLabel {
            static let padding: UIEdgeInsets = .init(top: 20, left: 10, bottom: 0, right: -10)
            static let textColor: UIColor? = .secundaryContent
            static let font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        }
        
        enum SeparatorLine {
            static let padding: UIEdgeInsets = .init(top: 20, left: 10, bottom: 0, right: -10)
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.TitleLabel.textColor
        label.font = Constants.TitleLabel.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.InformationLabel.textColor
        label.font = Constants.InformationLabel.font
        label.numberOfLines = Constants.InformationLabel.numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var hintLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.HintLabel.textColor
        label.font = Constants.HintLabel.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorLine = SeparatorLineView()
    
    func configureCell(title: String, information: String, hint: String? = nil) {
        titleLabel.text = title
        informationLabel.text = information
        hintLabel.text = hint
        
        addContent()
    }
    
    private func addContent() {
        contentView.addSubviews([titleLabel, informationLabel, hintLabel, separatorLine])
        
        titleLabelConstraints()
        informationLabelConstraints()
        hintLabelConstraints()
        separatorLineConstraints()
    }
    
    private func titleLabelConstraints() {
        let constraints = [titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.TitleLabel.padding.top),
                           titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.TitleLabel.padding.left)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func informationLabelConstraints() {
        let constraints = [informationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.InformationLabel.padding.top),
                           informationLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                           informationLabel.trailingAnchor.constraint(lessThanOrEqualTo: hintLabel.leadingAnchor, constant: Constants.InformationLabel.padding.right)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func hintLabelConstraints() {
        let constraints = [hintLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.HintLabel.padding.right),
                           hintLabel.centerYAnchor.constraint(equalTo: informationLabel.centerYAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func separatorLineConstraints() {
        let constraints = [separatorLine.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: Constants.SeparatorLine.padding.top),
                           separatorLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.SeparatorLine.padding.left),
                           separatorLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.SeparatorLine.padding.right),
                           separatorLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
}
