//
//  iBookAPIError.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import Foundation

enum iBookAPIError: Error {
    case failedToEncodeQueryParams
    case failedToConfigureURL
    case technicalProblem
    case notFound
}
