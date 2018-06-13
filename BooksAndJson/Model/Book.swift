//
//  Book.swift
//  BooksAndJson
//
//  Created by LeMy on 6/12/18.
//  Copyright © 2018 Le_My. All rights reserved.
//

import UIKit

class Book:Decodable{
    var title:String
    var author:String
    var price:Double
    var pages:Int
    init(json: [String:Any]){
        title = json["title"] as? String ?? ""
        author = json["author"] as? String ?? ""
        price = json ["price"] as? Double ?? 0.0
        pages = json ["pages"] as? Int ?? 0
    }
}
