//
//  BookListTableViewCell.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import UIKit

class BookListTableViewCell: UITableViewCell {

    @IBOutlet weak var audioBookImage: UIImageView!
    @IBOutlet weak var audioBookTitle: UILabel!
    @IBOutlet weak var audioBookDescription: UILabel!

    func setupCell(with ibook: iBook) {
       // audioBookImage.setImage(url: audiobook.iconImageURL)
        audioBookTitle.text = ibook.title
        audioBookDescription.text = "First Published in" + "\(ibook.publishedYear)"
    }
    
}
