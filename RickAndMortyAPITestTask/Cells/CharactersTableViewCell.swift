//
//  CharactersTableViewCell.swift
//  RickAndMortyAPITestTask
//
//  Created by gleba on 09.08.2022.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {
    
    
    var nameLabel = UILabel(text: "",
                            font: .systemFont(ofSize: 26, weight: .heavy)
    )
    private var genderLabel = UILabel(text: "gender: ",
                                   font: .systemFont(ofSize: 14, weight: .bold)
    )
    var genderCurrentLabel = UILabel(text: "",
                                   font: .systemFont(ofSize: 14, weight: .regular)
    )
    private var speciesLabel = UILabel(text: "species: ",
                                   font: .systemFont(ofSize: 14, weight: .bold)
    )
    var speciesCurrentLabel = UILabel(text: "",
                                   font: .systemFont(ofSize: 14, weight: .regular)
    )
    private var locationLabel = UILabel(text: "location: ",
                                   font: .systemFont(ofSize: 14, weight: .bold)
    )
    var locationCurrentLabel = UILabel(text: "",
                                   font: .systemFont(ofSize: 14, weight: .regular)
    )
    
    var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //MARK: - Override
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .none
    }
    
    override func prepareForReuse() {
        characterImageView.image = UIImage(named: "default")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    //MARK: - SetupViews
    
    private func setupViews() {
//        addSubview(containerView)
        self.addSubview(characterImageView)
        self.addSubview(nameLabel)
        self.addSubview(genderLabel)
        self.addSubview(genderCurrentLabel)
        self.addSubview(speciesLabel)
        self.addSubview(speciesCurrentLabel)
        self.addSubview(locationLabel)
        self.addSubview(locationCurrentLabel)
    }
    
    
    //MARK: - SetConstraints
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            characterImageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -8),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            characterImageView.widthAnchor.constraint(equalTo: characterImageView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 4),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            genderLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            genderCurrentLabel.topAnchor.constraint(equalTo: genderLabel.topAnchor),
            genderCurrentLabel.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            speciesLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 4),
            speciesLabel.leadingAnchor.constraint(equalTo: genderLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            speciesCurrentLabel.topAnchor.constraint(equalTo: speciesLabel.topAnchor),
            speciesCurrentLabel.leadingAnchor.constraint(equalTo: genderCurrentLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 4),
            locationLabel.leadingAnchor.constraint(equalTo: genderLabel.leadingAnchor),
        ])
        NSLayoutConstraint.activate([
            locationCurrentLabel.topAnchor.constraint(equalTo: locationLabel.topAnchor),
            locationCurrentLabel.leadingAnchor.constraint(equalTo: genderCurrentLabel.leadingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

