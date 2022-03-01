//
//  Bundle+Extension.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import Foundation

extension Bundle {
    
    // Computed Property to  gather data from Property list
    var config: [String: Any] {
        let path = Bundle.main.path(forResource: "Config", ofType: "plist")!
        return NSDictionary(contentsOfFile: path) as! [String: Any]
    }
    
}
