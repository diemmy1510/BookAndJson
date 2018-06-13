//
//  BookType.swift
//  BooksAndJson
//
//  Created by LeMy on 6/12/18.
//  Copyright © 2018 Le_My. All rights reserved.
//

import UIKit

class BookType: Decodable{
    var name:String
    var types:[BookTypeDetail]
    init(json: [String:Any]) {
        name = json["name"] as? String ?? ""
        types = json["types"] as? [BookTypeDetail] ?? []
    }
    
}
