//
//  PreRequisites.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-02-28.
//

import Foundation

//MARK: - Enum for Book search
enum PreRequisites: CaseIterable {
    
    static var allCases: [PreRequisites] {
        return [.noSpecialCharacters,.noEmojis,.caseInsensitive,.moreDesciptive,.networkConnection]
    }
    
    //MARK: - Enumeration Values
    case noSpecialCharacters
    case noEmojis
    case caseInsensitive
    case moreDesciptive
    case networkConnection
    
    //MARK: - Prerequsite Description
    var preRequisiteDescription: String {
        switch self {
        case .noSpecialCharacters:
            return "Avoid using special characters such as  !,@,#,$,%,^,&,*,(,)"
        case .noEmojis:
            return "Avoid using emojis in search texts"
        case .caseInsensitive:
            return "Given charcters are case Insensitive"
        case .moreDesciptive:
            return "Try to provide more accurate spellings"
        case .networkConnection:
            return "Make sure your device is connected to the Internet"
        }
        
    }
}
