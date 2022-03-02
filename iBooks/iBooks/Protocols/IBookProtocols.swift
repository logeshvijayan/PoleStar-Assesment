//
//  IBookProtocols.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import UIKit

/// Presenter  ->  View
protocol IBookViewProtocol: AnyObject {
    var presenter: IBookPresenterProtocol & IBookOutputInteractorProtocol {get set}
    func showListofIBooks()
    func showAlert(for action: AlertAction)
    
}

/// View -> Presenter
protocol IBookPresenterProtocol: AnyObject {
    
    var interactor: IBookInputInteractorProtocol? {get set}
    var view: IBookViewProtocol? {get set}
    var router:IBookRouterProtocol? {get set}
    var iBooks: [iBook]? {get set}
    var filteredBooks: [iBook]? {get set}
    
    func viewDidLoad()
    func searchForIBook(with term: String)
    func configureView(viewRef: ViewController)

}

/// Presenter -> Interactor
protocol IBookInputInteractorProtocol: AnyObject {
    var presenter: IBookOutputInteractorProtocol? {get set}
    func fetchSpecificiBookStarts(with term: String)
}

/// Interactor -> Presenter
protocol IBookOutputInteractorProtocol: AnyObject {
    func IBookListDidFetch(iBookList: [iBook])
    func showAlert(with action: AlertAction)
}

protocol IBookRouterProtocol: AnyObject {
    //Presenter -> Router
}
