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

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

