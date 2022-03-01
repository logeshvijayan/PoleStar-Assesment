//
//  BookListTableViewCell.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-03-01.
//

import UIKit

class BookListTableViewCell: UITableViewCell {

    @IBOutlet weak var audioBookImage: UIImageView!
    @IBOutlet weak var iBookTitle: UILabel!
    @IBOutlet weak var iBookAuthorname: UILabel!
    @IBOutlet weak var publishedYearLabel: UILabel!
    func setupCell(with ibook: iBook) {
        iBookTitle.text = ibook.title
        if let authorName = ibook.authorName  {
            iBookAuthorname.text = "by" + " " + authorName.joined(separator: ",")
        } else {
            iBookAuthorname.text = "Unknown"
        }
       
        guard let publishedYear = ibook.publishedYear else {
            publishedYearLabel.isHidden = true
            return
        }
        publishedYearLabel.text = "First Published in" + " " + "\(publishedYear)"
    }
    
}
