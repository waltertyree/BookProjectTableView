//
//  ButtonTableViewCell.swift
//  ButtonExample
//
//  Created by Walter Tyree on 12/6/14.
//  Copyright (c) 2014 Cocoaconf. All rights reserved.
//

import Foundation
import UIKit

class FancyTableViewCell : UITableViewCell {

    var bookData : Book?

    
    @IBOutlet weak var stateIndicator: UIButton!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    
    @IBAction func stateIndicatorTapped(sender: UIButton) {
        if let bookData = bookData {
            bookData.incrementStatus()
        }
        self.updateUI()
    }
    
    func updateUI() -> () {
        if let bookData = bookData {
            self.bookAuthor.text = bookData.author
            self.bookTitle.text = bookData.title
            self.stateIndicator.backgroundColor = bookData.status.indicatorColor()
            
        }
    }
}
