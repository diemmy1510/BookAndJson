//
//  BookTypeTableViewController.swift
//  BooksAndJson
//
//  Created by LeMy on 6/12/18.
//  Copyright © 2018 Le_My. All rights reserved.
//

import UIKit
class BookTypeTableViewController: UITableViewController {
    @IBOutlet var bookTypeTableView: UITableView!
    var arrBookTypes = [BookType]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //parse json
        parseJson {
            self.bookTypeTableView.reloadData()
        }
        
    }
    func parseJson(completed: @escaping () -> ()){
        let strUrl = "https://jsonblob.com/api/jsonBlob/d09236e8-6efb-11e8-92e2-7bff0070f940"
        guard let url = URL(string: strUrl) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do{
                //decode json
                self.arrBookTypes = try JSONDecoder().decode([BookType].self, from: data)
                print(self.arrBookTypes)
                DispatchQueue.main.async {
                    completed()
                }
                
            }catch let jsonError{
                print("Json Error: ", jsonError)
            }
        }
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBookTypes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let bookType = arrBookTypes[indexPath.row]
        cell.textLabel?.text = bookType.name
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBookTypeDetail" {
            let bookTypeDetailVC = segue.destination as! BookTypeDetailTableViewController
            bookTypeDetailVC.typeName = arrBookTypes[(tableView.indexPathForSelectedRow?.row)!].name
            bookTypeDetailVC.bookTypeDetails = arrBookTypes[(tableView.indexPathForSelectedRow?.row)!].types
        }
    }
}
