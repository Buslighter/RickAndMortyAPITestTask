//
//  LaunchTableViewCell.swift
//  RickAndMortyAPITestTask
//
//  Created by gleba on 09.08.2022.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel(text: "",
                            font: .systemFont(ofSize: 26, weight: .heavy)
    )
    var pictureImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //MARK:  Override
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .none
    }
    
    override func prepareForReuse() {
        pictureImage.image = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    //MARK:  SetupViews
    
    private func setupViews() {
        self.addSubview(pictureImage)
        self.addSubview(nameLabel)
    }
    
    
    //MARK:  SetConstraints
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            pictureImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            pictureImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            pictureImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            pictureImage.widthAnchor.constraint(equalTo: pictureImage.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: pictureImage.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
