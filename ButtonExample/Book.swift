//
//  Book.swift
//  ButtonExample
//
//  Created by Walter Tyree on 12/6/14.
//  Copyright (c) 2014 Cocoaconf. All rights reserved.
//

import Foundation
import UIKit

enum BookStatus : Int {
    case Unpurchased = 0
    case Unread = 1
    case Read = 2
    
    func indicatorColor() -> UIColor {
        switch self {
        case .Unpurchased:
            return UIColor.redColor()
        case .Unread:
            return UIColor.yellowColor()
        case .Read:
            return UIColor.greenColor()
        }
    }
    
    func fromString(statusString : String) -> Int {
        var defaultStatus = 0
        
        if statusString == "Read" {
            defaultStatus = 2
        }
        if statusString == "Unread" {
            defaultStatus = 1
        }
        return defaultStatus
    }
}


class Book {
    var status : BookStatus = BookStatus.Unpurchased
    let title : String?
    let author : String?
    
    init(_ bookDictionary: Dictionary<String,String>) {

        if let unwrappedStatus = bookDictionary["status"] {
            self.status = BookStatus(rawValue:status.fromString(unwrappedStatus))!
        }
        self.title = bookDictionary["title"]
        self.author = bookDictionary["author"]
    }
    
    func incrementStatus() {
        if self.status == BookStatus.Unpurchased {
            self.status = BookStatus.Unread
            return
        }
        
        if self.status == BookStatus.Unread {
            self.status = BookStatus.Read
            return
        }
        
        if self.status == BookStatus.Read {
            self.status = BookStatus.Unpurchased
            return
        }
        
        
        
    }
    
}
