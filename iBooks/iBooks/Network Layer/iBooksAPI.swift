//
//  iBooksAPI.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import Foundation
import Combine

//MARK: - Classs
class iBooksAPI {

    //MARK: - Variables
    private let session: URLSession
    private let cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    private let decoder: JSONDecoder = JSONDecoder()
    
    //MARK: - HTTP Method
    enum HTTPMethod {
        case get
        case put
        case post
        case patch
        case delete
    }

    //MARK: - Type of Environment
    enum Environment: String {
        case Dev = "DEV"
        case UAT = "UAT"
        case PROD = "PROD"
    }

    //MARK: - Service
    enum HTTPService: String {
        case title = "Title"
    }
    
    //MARK: - Basic URL Computed Property
    var baseURL: String {
        let hosts = Bundle.main.config["HOSTS"] as! [String: String]
        return hosts[Environment.Dev.rawValue]!
    }
    
    //MARK: -  Function to return URL
    func urlForService(_ service: HTTPService, additionalParts: String?) -> URL? {
        let path = Bundle.main.config["PATHS"] as! [String: String]
        var url =  baseURL + path[service.rawValue]!
        if let additionalParts = additionalParts {
            url =  url + additionalParts
        }
        guard let completeURL = URL(string: url) else {
            return nil
        }
        return completeURL
    }
    
    init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: - Function to interact with the backend server
    func search(term: String) -> AnyPublisher<[iBook], Error> {

        // 1. Configure URL
        let updatedSearchterm = term + "&limit=10"
        guard let percentEncoded = updatedSearchterm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return iBookAPIError.failedToEncodeQueryParams.asPublisher()
        }
        guard let url =  urlForService(.title, additionalParts: percentEncoded)  else {
            return iBookAPIError.failedToConfigureURL.asPublisher()
        }

        // 2. Perform Request
        return session
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: iBooksAPIResponse.self, decoder: decoder)
            .map(\.docs)
            .eraseToAnyPublisher()
    }

}


