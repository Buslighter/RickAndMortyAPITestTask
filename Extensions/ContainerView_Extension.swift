//
//  ContainerView_Extension.swift
//  RickAndMortyAPITestTask
//
//  Created by gleba on 09.08.2022.
//

import UIKit

extension UIView {

    convenience init(bgcolor: UIColor, imageName: String, buttonTitle: String) {
        self.init()
        self.backgroundColor = bgcolor
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton()
        button.backgroundColor = .clear
        button.titleLabel?.text = buttonTitle
        button.titleLabel?.textColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(imageView)
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 8),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            imageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30),
            button.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 30)
        ])

    }
}
