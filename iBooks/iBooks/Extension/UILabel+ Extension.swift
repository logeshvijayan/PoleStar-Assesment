//
//  UILabel+ Extension.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-02-28.
//

import UIKit

//MARK: - Label Extension
extension UILabel {
    
    //MARK: - function to create Label
    static func createLabel(prefixText: String = "",text: String, with color: UIColor? = .lightGray) -> UILabel {
        
        var label : UILabel {
            let label = UILabel(frame: .zero)
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.textColor = color
            label.text = prefixText + " " + text
            label.textAlignment = .left
            label.textColor = color
            return label
        }
        return label
    }
}
