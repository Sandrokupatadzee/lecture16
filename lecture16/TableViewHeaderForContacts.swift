//
//  TableViewHeader2.swift
//  lecture16
//
//  Created by MacBook Pro on 12.04.24.
//

import UIKit

class TableViewHeader2: UIView {
    
    let imageView: UIImageView = {
        let person = UIImageView()
        person.contentMode = .scaleAspectFit
        person.image = UIImage(systemName: "person.and.background.striped.horizontal")
        person.tintColor = .darkGray
        person.clipsToBounds = true
        return person

    }()
    
    let contactNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contactNameLabel)
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contactNameLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        contactNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 2).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

