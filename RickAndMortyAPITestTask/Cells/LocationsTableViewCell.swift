//
//  LocationsTableViewCell.swift
//  RickAndMortyAPITestTask
//
//  Created by gleba on 10.08.2022.
//

import UIKit

class LocationsTableViewCell: UITableViewCell {
    
    
    var nameLabel = UILabel(text: "",
                            font: .systemFont(ofSize: 26, weight: .heavy)
    )
    private var typeLabel = UILabel(text: "type: ",
                                   font: .systemFont(ofSize: 14, weight: .bold)
    )
    var typeCurrentLabel = UILabel(text: "",
                                   font: .systemFont(ofSize: 14, weight: .regular)
    )
    private var dimensionLabel = UILabel(text: "dimension: ",
                                   font: .systemFont(ofSize: 14, weight: .bold)
    )
    var dimensionCurrentLabel = UILabel(text: "",
                                   font: .systemFont(ofSize: 14, weight: .regular)
    )
    
    
    //MARK: - Override
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .none
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    //MARK: - SetupViews
    
    private func setupViews() {
        self.addSubview(nameLabel)
        self.addSubview(typeLabel)
        self.addSubview(typeCurrentLabel)
        self.addSubview(dimensionLabel)
        self.addSubview(dimensionCurrentLabel)

    }
    
    
    //MARK: - SetConstraints
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            typeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            typeCurrentLabel.topAnchor.constraint(equalTo: typeLabel.topAnchor),
            typeCurrentLabel.leadingAnchor.constraint(equalTo: typeLabel.trailingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            dimensionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 4),
            dimensionLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            dimensionCurrentLabel.topAnchor.constraint(equalTo: dimensionLabel.topAnchor),
            dimensionCurrentLabel.leadingAnchor.constraint(equalTo: typeCurrentLabel.leadingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

