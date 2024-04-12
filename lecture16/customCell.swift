//
//  customCell.swift
//  lecture16
//
//  Created by MacBook Pro on 11.04.24.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var contactTitleLabel = UILabel()
    var actionImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureTitleLabel()
        configureActionImageView()
        addSubview(contactTitleLabel)
        addSubview(actionImageView)
        setActionButtonConstraints()
        setContactTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTitleLabel() {
        contactTitleLabel.numberOfLines = 0
        contactTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setContactTitleLabelConstraints() {
        contactTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contactTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        contactTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        contactTitleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func configureActionImageView() {
        actionImageView.contentMode = .scaleAspectFit
        actionImageView.tintColor = .gray
        actionImageView.image = UIImage(systemName: "greaterthan")
    }
    
    func setActionButtonConstraints() {
        actionImageView.translatesAutoresizingMaskIntoConstraints = false
        actionImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        actionImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        actionImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        actionImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
