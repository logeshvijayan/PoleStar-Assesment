//
//  IBookProtocols.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import UIKit

protocol IBookViewProtocol: AnyObject {
    
    // PRESENTER -> VIEW
    
    var presenter: IBookPresenterProtocol? {get set}
    func showListofAudioBooks()
}

protocol IBookPresenterProtocol: AnyObject {
    
    //View -> Presenter
    var interactor: IBookInputInteractorProtocol? {get set}
    var view: IBookViewProtocol? {get set}
    var router:IBookRouterProtocol? {get set}
    var audioBooks: [iBook]? {get set}
    var filteredBooks: [iBook]? {get set}
    
    func viewDidLoad()
    func searchForAudioBook(with term: String)
    func configureView(viewRef: ViewController)

}

protocol IBookInputInteractorProtocol: AnyObject {
    
    //Presenter -> Interactor
    var presenter: IBookOutputInteractorProtocol? {get set}

    func fetchSpecificiBookStarts(with term: String)
}

protocol IBookOutputInteractorProtocol: AnyObject {
    
    //Interactor -> Presenter
    func IBookListDidFetch(AudioBookList: [iBook])
}

protocol IBookRouterProtocol: AnyObject {
    //Presenter -> Router
}
