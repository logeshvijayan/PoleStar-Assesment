//
//  AlertAction.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import Foundation

/// Enum for different kind of Alert actions
enum AlertAction  {
    
    case noDocumentsFound
    case technicalError
    case networkError
    case tryAgain
    case unkown
    
    var title: String{
        switch self {
        case .noDocumentsFound:
            return "No Document Found"
        case .technicalError:
            return "Technical Error"
        case .networkError:
            return "Network Error"
        case .tryAgain:
            return "Try Again"
        case .unkown:
            return "Unknown"
        }
    }
    
    var description: String {
        switch self {
        case .noDocumentsFound:
            return "We couldn't able to find a book that matches your search criteria.Please try with a different search"
        case .technicalError:
            return "We are facing some technical issues at the moment.We are trying to rectify from our end"
        case .networkError:
            return "Please make sure you are connected to the Internet"
        case .tryAgain:
            return "Do you wish to try again?"
        case .unkown:
            return "Unknown error occured"
        }
    }
    
    
    
    
    
}
