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
    
    func showListofIBooks() {
        DispatchQueue.main.async {
            self.preRequisiteStackView.isHidden = true
            NSLayoutConstraint.activate([
                self.preRequisiteStackView.heightAnchor.constraint(equalToConstant: 0),
            ])
            self.listTableView.reloadData()
        }
    }
    

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        presenter.configureView(viewRef: self)
        configureStackView()
    }

    //MARK: - Outlets and Variables
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var preRequisiteStackView: UIStackView!
    @IBOutlet weak var listTableView: UITableView!
    
    //MARK: - View Functions
    func configureStackView() {
        for description in PreRequisites.allCases {
           preRequisiteStackView.addArrangedSubview(UILabel.createLabel(prefixText: "•", text: description.preRequisiteDescription))
        }
    }
    
    func registerTableView() {
        listTableView.dataSource = self
        listTableView.register(UINib(nibName: "BookListTableViewCell", bundle: nil), forCellReuseIdentifier: "BookListTableViewCell")
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

