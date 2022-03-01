//
//  IBookInteractor.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import Foundation

class IBookInteractor: IBookInputInteractorProtocol {
    

weak var presenter: IBookOutputInteractorProtocol?

func fetchSpecificiBookStarts(with term: String) {
    /// Fetch from backend server
}
    
}

extension IBookInteractor: IBookOutputInteractorProtocol {
    func IBookListDidFetch(AudioBookList: [iBook]) {
        /// Once the fetch is sucessfull
    }
    
    
}

