//
//  LocationsViewController.swift
//  RickAndMortyAPITestTask
//
//  Created by gleba on 10.08.2022.
//


import UIKit

class LocationsViewController: UIViewController {
    
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
    private let cellID = "LocationsCellID"
    private var cellNumber = 0
    private var searchController = UISearchController()
    private var searchedText = String()
    private var isSearched = false
    
    private var numberOfPages = 0
    private var loader = DataLoader()
    private var allLocationsArray = [LocationResult]()
    private var searchLocationsArray = [LocationResult]()
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setDelegate()
        setConstraints()
        getData()
        tableView.register(LocationsTableViewCell.self, forCellReuseIdentifier: cellID)
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
        label.text = "Локации"
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
        searchLocationsArray.removeAll()
        isSearched = false
        tableView.reloadData()
    }
    
    private func searchCharacters(text: String) {
        for location in allLocationsArray {
            if location.name.lowercased().contains(text.lowercased())  {
                searchLocationsArray.append(location)
            }
        }
        isSearched = true
        tableView.reloadData()
    }

    
    private func getData(){
        loader.loadLocationsData(completion: { result in
            self.allLocationsArray.append(contentsOf: result.results)
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

extension LocationsViewController: UISearchBarDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        refreshSearch()
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text{
            searchLocationsArray = [LocationResult]()
            searchCharacters(text: text)
        }else{return}
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        refreshSearch()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchLocationsArray = [LocationResult]()
        isSearched = (searchText.count > 0 ? false : true)
        searchCharacters(text: searchText)
        self.searchedText = searchText
        tableView.reloadData()
    }
}

//MARK: Table View Extensions

extension LocationsViewController: UITableViewDataSource,UITableViewDelegate,UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearched{
            return searchLocationsArray.count
        } else{
            return allLocationsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var array = [LocationResult]()
        if isSearched{
            array = searchLocationsArray
        }else{
            array = allLocationsArray
        }
        
        let model = array[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! LocationsTableViewCell
        cell.nameLabel.text = model.name
        cell.dimensionCurrentLabel.text = model.dimension
        cell.typeCurrentLabel.text = model.type
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

extension LocationsViewController{
    
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


