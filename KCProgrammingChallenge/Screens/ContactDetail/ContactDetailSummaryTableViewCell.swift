//
//  ContactDetailSummaryTableViewCell.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

final class ContactDetailSummaryTableViewCell: UITableViewCell {
    // MARK: - Constants
    private enum Constants {
        enum ProfileImageView {
            static let placeholderImage = UIImage(named: "contactProfilePlaceholder")
            static let padding: UIEdgeInsets = .init(top: 20, left: 0, bottom: 0, right: 0)
            static let dimensions: CGFloat = 150
        }
        
        enum NameLabel {
            static let padding: UIEdgeInsets = .init(top: 12, left: 10, bottom: 0, right: -10)
            static let textColor: UIColor? = .mainContent
            static let font = UIFont.systemFont(ofSize: 20, weight: .bold)
            static let textAlignment: NSTextAlignment = .center
        }
        
        enum CompanyLabel {
            static let padding: UIEdgeInsets = .init(top: 6, left: 0, bottom: 0, right: 0)
            static let textColor: UIColor? = .secundaryContent
            static let font = UIFont.systemFont(ofSize: 12, weight: .light)
            static let textAlignment: NSTextAlignment = .center
        }
        
        enum SeparatorLine {
            static let padding: UIEdgeInsets = .init(top: 20, left: 0, bottom: 0, right: 0)
        }
    }
    
    //MARK: - Variables
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: Constants.ProfileImageView.placeholderImage)
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.NameLabel.textColor
        label.font = Constants.NameLabel.font
        label.textAlignment = Constants.NameLabel.textAlignment
        return label
    }()
    
    private lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.CompanyLabel.textColor
        label.font = Constants.CompanyLabel.font
        label.textAlignment = Constants.CompanyLabel.textAlignment
        return label
    }()
    
    private let separatorLine = SeparatorLineView()
    
    //MARK: - Internal Function
    func configureCell(name: String, company: String, profileImagePath: String) {
        profileImageView.downloadImage(from: profileImagePath)
        nameLabel.text = name
        companyLabel.text = company
        addContent()
    }
    
    //MARK: - Private functions
    private func addContent() {
        contentView.backgroundColor = .background
        contentView.addSubviews([nameLabel, companyLabel, profileImageView, separatorLine])
        profileImageViewConstraints()
        nameLabelViewConstraints()
        companyLabelViewConstraints()
        separatorLineConstaints()
    }
    
    private func profileImageViewConstraints() {
        let constraints = [profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.ProfileImageView.padding.top),
                           profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                           profileImageView.widthAnchor.constraint(equalToConstant: Constants.ProfileImageView.dimensions),
                           profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor, multiplier: profileImageView.aspectRatio)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func nameLabelViewConstraints() {
        let constraints = [nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: Constants.NameLabel.padding.top),
                           nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.NameLabel.padding.left),
                           nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.NameLabel.padding.right)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func companyLabelViewConstraints() {
        let constraints = [companyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.CompanyLabel.padding.top),
                           companyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                           companyLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func separatorLineConstaints() {
        let constraints = [separatorLine.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: Constants.SeparatorLine.padding.top),
                           separatorLine.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                           separatorLine.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
                           separatorLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
}
