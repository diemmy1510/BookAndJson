//
//  BookTypeDetail.swift
//  BooksAndJson
//
//  Created by LeMy on 6/13/18.
//  Copyright © 2018 Le_My. All rights reserved.
//

import UIKit

class BookTypeDetail:Decodable{
    var type:String
    var books:[Book]
    init(json:[String:Any]) {
        type = json["type"] as? String ?? ""
        books = json["books"] as? [Book] ?? []
    }
}
