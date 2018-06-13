//
//  BookTableViewController.swift
//  BooksAndJson
//
//  Created by LeMy on 6/13/18.
//  Copyright © 2018 Le_My. All rights reserved.
//

import UIKit

class BookTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var bookTableView: UITableView!
    var typeDetailName:String = String()
    var books = [Book]()
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTableView.delegate = self
        bookTableView.dataSource = self
        self.title = typeDetailName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        let book = books[indexPath.row]
        cell.textLabel?.text = book.title
        return cell
    }
}
