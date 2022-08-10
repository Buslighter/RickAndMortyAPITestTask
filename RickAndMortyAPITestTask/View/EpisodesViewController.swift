//
//  EpisodesViewController.swift
//  RickAndMortyAPITestTask
//
//  Created by gleba on 08.08.2022.
//


import UIKit

class EpisodesViewController: UIViewController {
    
    //MARK: Initialization
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .darkGray
        tableView.showsVerticalScrollIndicator = true
        tableView.isPagingEnabled = true
        tableView.isScrollEnabled = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var nextPage = true
    private let cellID = "EpisodesCellID"
    private var cellNumber = 0
    private var searchController = UISearchController()
    private var searchedText = String()
    private var isSearched = false
    
    private var numberOfPages = 0
    private var loader = DataLoader()
    private var allEpisodesArray = [EpisodeResult]()
    private var searchEpisodesArray = [EpisodeResult]()
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setDelegate()
        setConstraints()
        getData()
        tableView.register(EpisodesTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    //MARK: Set UI
    
    private func configureUI() {
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupNavigationItems()
    }
    
    //MARK: Set Delegates
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        searchController.searchBar.delegate = self
    }
    
    private func setupNavigationItems() {
        
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Эпизоды"
        label.textColor = .orange
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 34, weight: .bold)
        navigationItem.titleView = label
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.returnKeyType = .done
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.isActive = true
    }
    
    private func refreshSearch() {
        searchEpisodesArray.removeAll()
        isSearched = false
        tableView.reloadData()
    }
    
    private func searchCharacters(text: String) {
        for episode in allEpisodesArray {
            if episode.name.lowercased().contains(text.lowercased())  {
                searchEpisodesArray.append(episode)
            }
        }
        isSearched = true
        tableView.reloadData()
    }

    
    private func getData(){
        loader.loadEpisodesData(completion: { result in
            self.allEpisodesArray.append(contentsOf: result.results)
            self.numberOfPages = result.info.pages
            self.tableView.reloadData()
        })
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboard()
    }
    func dismissKeyboard() {
        navigationController?.view.endEditing(true)
    }
    
    
    
    
}
//MARK: Search View Extensions

extension EpisodesViewController: UISearchBarDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        refreshSearch()
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text{
            searchEpisodesArray = [EpisodeResult]()
            searchCharacters(text: text)
        }else{return}
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        refreshSearch()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchEpisodesArray = [EpisodeResult]()
        isSearched = (searchText.count > 0 ? false : true)
        searchCharacters(text: searchText)
        self.searchedText = searchText
        tableView.reloadData()
    }
}

//MARK: Table View Extensions

extension EpisodesViewController: UITableViewDataSource,UITableViewDelegate,UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearched{
            return searchEpisodesArray.count
        } else{
            return allEpisodesArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var array = [EpisodeResult]()
        if isSearched{
            array = searchEpisodesArray
        }else{
            array = allEpisodesArray
        }
        
        let model = array[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! EpisodesTableViewCell
        cell.nameLabel.text = model.name
        let episode = loader.getRightEpisode(episode: model.episode)
        cell.episodeCurrentCurrentLabel.text = episode.1
        cell.airDateCurrentLabel.text = model.airDate
        cell.seasonCurrentCurrentLabel.text = episode.0
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths{
            if indexPath.row%10 == 0 {
                            getData()
            }
        }
    }
    
    
}

//MARK: Set Constraints

extension EpisodesViewController{
    
    private func setConstraints(){
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 40),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -8)
        ])
    }
}


