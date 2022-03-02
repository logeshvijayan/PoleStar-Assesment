//
//  IBookInteractor.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import UIKit
import Combine

//MARK: - Class
class IBookInteractor: IBookInputInteractorProtocol {

    //MARK: - Combine variables
    private let baseService = iBooksAPI()
    private var bag = Set<AnyCancellable>()
    
    weak var presenter: IBookOutputInteractorProtocol?

    //MARK: - Interactor Functions
    
    /// This function interacts with network layer to get data from the server
    func fetchSpecificiBookStarts(with term: String) {
        
        baseService.search(term: term)
            .sink(receiveCompletion: {  completion in
                switch completion {
                case .finished:
                    print("Finished Sucessfully")
                case .failure(_):
                    self.showAlert(with: .technicalError)
                }}) { ibooks in
                if ibooks.isEmpty {
                    self.showAlert(with: .noDocumentsFound)
                } else {
                    self.IBookListDidFetch(iBookList: ibooks)
                }
            }
            .store(in: &bag)
    }
    
}

//MARK: - Output Interactor function

///This function communicates back to the presenter about the acquired output
extension IBookInteractor: IBookOutputInteractorProtocol {
    func showAlert(with action: AlertAction) {
        presenter?.showAlert(with: action)
    }
    
    func IBookListDidFetch(iBookList: [iBook]) {
        presenter?.IBookListDidFetch(iBookList: iBookList)
    }
    
    
}

