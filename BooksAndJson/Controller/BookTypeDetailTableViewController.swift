//
//  BookTypeDetailTableViewController.swift
//  BooksAndJson
//
//  Created by LeMy on 6/13/18.
//  Copyright © 2018 Le_My. All rights reserved.
//

import UIKit

class BookTypeDetailTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var bookTypeDetailTableView: UITableView!
    var typeName:String = String()
    var bookTypeDetails = [BookTypeDetail]()

    override func viewDidLoad() {
        super.viewDidLoad()
        bookTypeDetailTableView.delegate = self
        bookTypeDetailTableView.dataSource = self
        self.title = typeName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookTypeDetails.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookTypeDetailCell", for: indexPath)
        let bookTypeDetail = bookTypeDetails[indexPath.row]
        cell.textLabel?.text = bookTypeDetail.type
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBook"{
            let bookVC = segue.destination as! BookTableViewController
            bookVC.typeDetailName = bookTypeDetails[(bookTypeDetailTableView.indexPathForSelectedRow?.row)!].type
            bookVC.books = bookTypeDetails[(bookTypeDetailTableView.indexPathForSelectedRow?.row)!].books
        }
    }
}
