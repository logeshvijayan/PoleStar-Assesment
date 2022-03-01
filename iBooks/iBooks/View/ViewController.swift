//
//  ViewController.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-02-28.
//

//MARK: - Framework
import UIKit

//MARK: -  Class
class ViewController: UIViewController,IBookViewProtocol {
    
    var presenter: IBookPresenterProtocol & IBookOutputInteractorProtocol = IBookPresenter()
        
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        presenter.configureView(viewRef: self)
        configureStackView()
        activityIndicatorView.hidesWhenStopped = true
    }

    //MARK: - Outlets and Variables
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var preRequisiteStackView: UIStackView!
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    //MARK: - View Functions
    func configureStackView() {
        for description in PreRequisites.allCases {
           preRequisiteStackView.addArrangedSubview(UILabel.createLabel(prefixText: "•", text: description.preRequisiteDescription))
        }
    }
    
    func registerTableView() {
        listTableView.dataSource = self
        searchBar.delegate = self
        listTableView.register(UINib(nibName: "BookListTableViewCell", bundle: nil), forCellReuseIdentifier: "BookListTableViewCell")
    }
    
    func showListofIBooks() {
        DispatchQueue.main.async {
            self.preRequisiteStackView.isHidden = true
            NSLayoutConstraint.activate([
                self.preRequisiteStackView.heightAnchor.constraint(equalToConstant: 0),
            ])
            self.activityIndicatorView.stopAnimating()
            self.listTableView.reloadData()
        }
    }
}

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

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.searchForIBook(with: searchBar.text!)
        activityIndicatorView.startAnimating()
        searchBar.endEditing(true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.endEditing(true)
    }
}

