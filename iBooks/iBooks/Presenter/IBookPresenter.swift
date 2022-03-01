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
    
    func searchForIBook(with term: String) {
        interactor?.fetchSpecificiBookStarts(with: term)
    }
    
    func configureView(viewRef: ViewController) {
        
        viewRef.presenter.view = viewRef
        //   viewRef.presenter.router = IBookRouter()
        viewRef.presenter.interactor = IBookInteractor()
        viewRef.presenter.interactor?.presenter = viewRef.presenter
        
    }
    
    
}

//MARK: - Extension
extension IBookPresenter: IBookOutputInteractorProtocol {
    
    func IBookListDidFetch(iBookList: [iBook]) {
        iBooks = iBookList
        view?.showListofIBooks()
    }
    
    
}
