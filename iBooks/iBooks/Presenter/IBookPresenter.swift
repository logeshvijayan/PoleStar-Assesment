//
//  IBookPresenter.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import Foundation

//MARK: - Class
class IBookPresenter: IBookPresenterProtocol {
    
    //MARK: - Variables
    var interactor: IBookInputInteractorProtocol?
    weak var view: IBookViewProtocol?
    var router: IBookRouterProtocol?
    var iBooks: [iBook]?
    var filteredBooks: [iBook]?
    
    //MARK: - Presenter Functions
    func viewDidLoad() {
        // Do Nothing
    }
    /// Asks the interactor to search for books with certain character
    func searchForIBook(with term: String) {
        interactor?.fetchSpecificiBookStarts(with: term)
    }
    
    /// Creates appropriate instances for view,presenter,interactor and router
    func configureView(viewRef: ViewController) {
        viewRef.presenter.view = viewRef
        //   viewRef.presenter.router = IBookRouter()
        viewRef.presenter.interactor = IBookInteractor()
        viewRef.presenter.interactor?.presenter = viewRef.presenter
        
    }
}

//MARK: - Extension

/// Interactor let know about the outcome of the network call
extension IBookPresenter: IBookOutputInteractorProtocol {
    func showAlert(with action: AlertAction) {
        view?.showAlert(for: action)
    }
    
    
    func IBookListDidFetch(iBookList: [iBook]) {
        iBooks = iBookList
        view?.showListofIBooks()
    }
}
