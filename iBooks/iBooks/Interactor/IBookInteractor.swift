//
//  IBookInteractor.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import UIKit
import Combine

class IBookInteractor: IBookInputInteractorProtocol {

    weak var presenter: IBookOutputInteractorProtocol?
    
    //MARK: - Combine variables
    private let baseService = iBooksAPI()
    private var bag = Set<AnyCancellable>()

func fetchSpecificiBookStarts(with term: String) {
    
    baseService.search(term: term)
        .sink(receiveCompletion: {  completion in
            switch completion {
            case .finished:
               print("Finished Sucessfully")
            case .failure(let error):
               print("Finished with errors",error)
           
            }
        }) { ibooks in
            self.IBookListDidFetch(iBookList: ibooks)
        }
        .store(in: &bag)
}
    
}

extension IBookInteractor: IBookOutputInteractorProtocol {
    func IBookListDidFetch(iBookList: [iBook]) {
        presenter?.IBookListDidFetch(iBookList: iBookList)
    }
    
    
}

