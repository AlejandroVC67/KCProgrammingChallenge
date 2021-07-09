//
//  ContactListTableViewCell.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

final class ContactListTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    private enum Constants {
        enum ThumbnailImageView {
            static let padding: UIEdgeInsets = .init(top: 24, left: 12, bottom: -24, right: 0)
            static let dimensions: CGFloat = 50
            static let image = UIImage(named: "thumbnailPlaceholder")
        }
        
        enum StarImageView {
            static let padding: UIEdgeInsets = .init(top: 8, left: 16, bottom: 0, right: 0)
            static let dimensions: CGFloat = 20
            static let image = UIImage(named: "favoriteStar")
        }
        
        enum NameLabel {
            static let padding: UIEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: -8)
            static let textColor: UIColor? = .mainContent
            static let font: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
        
        enum CompanyLabel {
            static let padding: UIEdgeInsets = .init(top: 2, left: 0, bottom: 0, right: 0)
            static let textColor: UIColor? = .secundaryContent
            static let font: UIFont = UIFont.systemFont(ofSize: 12, weight: .light)
        }
    }
    
    //MARK: - Properties
    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView(image: Constants.ThumbnailImageView.image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView(image: Constants.StarImageView.image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.NameLabel.textColor
        label.font = Constants.NameLabel.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.CompanyLabel.textColor
        label.font = Constants.CompanyLabel.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Internal function
    func configureCell(name: String, company: String?, isFavorite: Bool, thumbnailPath: String) {
        populateCell(name: name, company: company, isFavorite: isFavorite, thumbnailPath: thumbnailPath)
        addContent(isFavorite: isFavorite)
    }
    
    // MARK: - Private functions
    private func populateCell(name: String, company: String?, isFavorite: Bool, thumbnailPath: String) {
        nameLabel.text = name
        companyLabel.text = company ?? ""
        ServiceFacade.downloadImage(from: thumbnailPath) { [weak self] image in
            if let image = image {
                DispatchQueue.main.async {
                    self?.thumbnailImageView.image = image
                }
            }
        }
    }
    
    private func addContent(isFavorite: Bool) {
        contentView.addSubviews([thumbnailImageView, nameLabel, companyLabel, starImageView])
        starImageView.isHidden = !isFavorite
        setupThumbnailImageViewConstraints()
        setupStarImageViewConstraints()
        nameLabelConstraints()
        companyLabelConstraints()
    }
    
    private func setupThumbnailImageViewConstraints() {
        let constraints = [thumbnailImageView.widthAnchor.constraint(equalToConstant: Constants.ThumbnailImageView.dimensions),
                           thumbnailImageView.heightAnchor.constraint(equalToConstant: Constants.ThumbnailImageView.dimensions),
                           thumbnailImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                           thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.ThumbnailImageView.padding.left),
                           thumbnailImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: Constants.ThumbnailImageView.padding.top),
                           thumbnailImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: Constants.ThumbnailImageView.padding.bottom)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupStarImageViewConstraints() {
        let constraints = [starImageView.widthAnchor.constraint(equalToConstant: Constants.StarImageView.dimensions),
                           starImageView.heightAnchor.constraint(equalToConstant: Constants.StarImageView.dimensions),
                           starImageView.topAnchor.constraint(equalTo: thumbnailImageView.topAnchor, constant: Constants.StarImageView.padding.top),
                           starImageView.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: Constants.StarImageView.padding.left)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func nameLabelConstraints() {
        let constraints = [nameLabel.topAnchor.constraint(equalTo: starImageView.topAnchor),
                           nameLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: Constants.NameLabel.padding.left),
                           nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.NameLabel.padding.right)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func companyLabelConstraints() {
        let constraints = [companyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.CompanyLabel.padding.top),
                           companyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                           companyLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
