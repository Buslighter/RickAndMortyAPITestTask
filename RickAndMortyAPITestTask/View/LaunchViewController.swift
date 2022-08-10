//
//  ViewController.swift
//  RickAndMortyAPITestTask
//
//  Created by gleba on 02.08.2022.
//

import UIKit

class LaunchViewController: UIViewController {
    
    private let cellID = "LaunchCellID"
    private let launchData = ["people","location","tv"]
    private let launchNames = ["Персонажи", "Локации", "Эпизоды"]
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        tableView.isPagingEnabled = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureUI()
        setConstraints()
        setDelegate()
        tableView.register(LaunchTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.reloadData()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupNavigationItems()
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupNavigationItems() {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "The Rick and Morty"
        label.textColor = .orange
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 34, weight: .bold)
        navigationItem.titleView = label
    }
    
}

extension LaunchViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.height/10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! LaunchTableViewCell
        cell.pictureImage.image = UIImage(named: launchData[indexPath.row])
        cell.nameLabel.text = launchNames[indexPath.row]
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.orange
        cell.selectedBackgroundView = bgColorView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        var eventVC = UIViewController()
        
        switch launchNames[indexPath.row]{
        case "Персонажи":
            eventVC = CharactersViewController()
        case "Локации":
            eventVC = LocationsViewController()
        case "Эпизоды":
            eventVC = EpisodesViewController()
        default:
            break
        }
        
        self.navigationController?.pushViewController(eventVC, animated: true)
        
    }
    
}



extension LaunchViewController{
    private func setConstraints(){
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 40),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(greaterThanOrEqualTo: margins.bottomAnchor, constant: -8)
        ])
    }
    
}

