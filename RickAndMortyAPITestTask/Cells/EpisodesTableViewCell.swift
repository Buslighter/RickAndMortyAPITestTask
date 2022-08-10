//
//  EpisodesTableViewCell.swift
//  RickAndMortyAPITestTask
//
//  Created by gleba on 10.08.2022.
//

import UIKit


import UIKit

class EpisodesTableViewCell: UITableViewCell {
    
    
    var nameLabel = UILabel(text: "",
                            font: .systemFont(ofSize: 26, weight: .heavy)
    )
    private var airDateLabel = UILabel(text: "air date: ",
                                   font: .systemFont(ofSize: 14, weight: .bold)
    )
    var airDateCurrentLabel = UILabel(text: "",
                                   font: .systemFont(ofSize: 14, weight: .regular)
    )
    private var seasonLabel = UILabel(text: "season: ",
                                   font: .systemFont(ofSize: 14, weight: .bold)
    )
    var seasonCurrentCurrentLabel = UILabel(text: "",
                                   font: .systemFont(ofSize: 14, weight: .regular)
    )
    private var episodeLabel = UILabel(text: "episode: ",
                                   font: .systemFont(ofSize: 14, weight: .bold)
    )
    var episodeCurrentCurrentLabel = UILabel(text: "",
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
        self.addSubview(airDateLabel)
        self.addSubview(airDateCurrentLabel)
        self.addSubview(seasonLabel)
        self.addSubview(seasonCurrentCurrentLabel)
        self.addSubview(episodeLabel)
        self.addSubview(episodeCurrentCurrentLabel)
    }
    
    
    //MARK: - SetConstraints
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            airDateLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            airDateCurrentLabel.topAnchor.constraint(equalTo: airDateLabel.topAnchor),
            airDateCurrentLabel.leadingAnchor.constraint(equalTo: airDateLabel.trailingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            seasonLabel.topAnchor.constraint(equalTo: airDateLabel.bottomAnchor, constant: 4),
            seasonLabel.leadingAnchor.constraint(equalTo: airDateLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            seasonCurrentCurrentLabel.topAnchor.constraint(equalTo: seasonLabel.topAnchor),
            seasonCurrentCurrentLabel.leadingAnchor.constraint(equalTo: airDateCurrentLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            episodeLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor, constant: 4),
            episodeLabel.leadingAnchor.constraint(equalTo: airDateLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            episodeCurrentCurrentLabel.topAnchor.constraint(equalTo: episodeLabel.topAnchor),
            episodeCurrentCurrentLabel.leadingAnchor.constraint(equalTo: airDateCurrentLabel.leadingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
