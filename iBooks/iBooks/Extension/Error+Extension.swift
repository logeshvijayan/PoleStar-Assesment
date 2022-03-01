//
//  Error+Extension.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import Foundation
import Combine

extension Error {
    func asPublisher<T>() -> AnyPublisher<T, Error> {
        return Fail<T, Error>(error: self).eraseToAnyPublisher()
    }
}
