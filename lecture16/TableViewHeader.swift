//
//  TableViewHeader.swift
//  lecture16
//
//  Created by MacBook Pro on 12.04.24.
//

import UIKit

class TableViewHeader: UIView {
    
    let imageView: UIImageView = {
        let denzel = UIImageView()
        denzel.contentMode = .scaleAspectFit
        denzel.image = UIImage(named: "denzell")
        denzel.tintColor = .white
        denzel.layer.cornerRadius = denzel.frame.width / 2
        denzel.clipsToBounds = true
        return denzel
    } ()
    
    let myNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sandro Kupatadze"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(myNameLabel)
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        myNameLabel.translatesAutoresizingMaskIntoConstraints = false
        myNameLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        myNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 2).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
