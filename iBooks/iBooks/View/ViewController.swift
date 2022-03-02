//
//  ViewController.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-02-28.
//

//MARK: - Framework
import UIKit

//MARK: -  Class
class ViewController: UIViewController {
  
    //MARK: - Outlets and Variables
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var preRequisiteStackView: UIStackView!
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var presenter: IBookPresenterProtocol & IBookOutputInteractorProtocol = IBookPresenter()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        presenter.configureView(viewRef: self)
        configureStackView()
        configureViewController()
    }
    
    //MARK: - View Functions
    func registerTableView() {
        listTableView.dataSource = self
        searchBar.delegate = self
        listTableView.register(UINib(nibName: "BookListTableViewCell", bundle: nil), forCellReuseIdentifier: "BookListTableViewCell")
    }
    
    func configureStackView() {
        for description in PreRequisites.allCases {
           preRequisiteStackView.addArrangedSubview(UILabel.createLabel(prefixText: "•", text: description.preRequisiteDescription))
        }
    }
    
    func configureViewController() {
        activityIndicatorView.hidesWhenStopped = true
        searchBar.enablesReturnKeyAutomatically = true
    }
}

//MARK: - TableView Data Source
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let books = presenter.iBooks  else {
            return 0
        }
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: BookListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.selectionStyle = .none
        guard let iBook = presenter.iBooks?[indexPath.row] else {
            return cell
        }
        cell.setupCell(with: iBook)
        return cell
    }
}

//MARK: - Search Bar Delegate function
extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard NetworkMonitor.shared.isConnected else {
            showAlert(for: .networkError)
            return
        }
        presenter.searchForIBook(with: searchBar.text!)
        activityIndicatorView.startAnimating()
        searchBar.endEditing(true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.endEditing(true)
    }
}

//MARK: - Protocol Conformance
extension ViewController: IBookViewProtocol {
    
    func showListofIBooks() {
            preRequisiteStackView.isHidden = true
            NSLayoutConstraint.activate([
               preRequisiteStackView.heightAnchor.constraint(equalToConstant: 0),
            ])
            activityIndicatorView.stopAnimating()
            listTableView.reloadData()
    }
    
    func showAlert(for action: AlertAction) {
        activityIndicatorView.stopAnimating()
        self.showAlertWithCompletion(title: action.title, message: action.description, okTitle: "Ok", cancelTitle: nil ,completionBlock: {okPressed in })
    }
    
}

