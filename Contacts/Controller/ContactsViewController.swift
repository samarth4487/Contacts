//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Samarth Paboowal on 05/02/18.
//  Copyright © 2018 Samarth Paboowal. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Variables
    
    let contactsUrl = "http://jsonplaceholder.typicode.com/users"
    var contacts: [Contact]?
    var isDisplayingAscendingOrder = true
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        fetchContactsData()
    }
    
    
    //MARK: - User Defined Mthods
    
    func fetchContactsData() {
        
        Alamofire.request(contactsUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if let data = response.result.value as? [NSDictionary] {
                self.contacts = Mapper<Contact>().mapArray(JSONObject: data)
                self.sortContactsIn(ascending: true)
            }
        }
    }
    
    func sortContactsIn(ascending: Bool) {
        
        if ascending {
            contacts = contacts?.sorted(by: { $0.name! < $1.name! })
        } else {
            contacts = contacts?.sorted(by: { $0.name! > $1.name! })
        }
        
        self.tableView.reloadData()
    }
    
    @IBAction func sortTapped(_ sender: UIBarButtonItem) {
        
        if isDisplayingAscendingOrder {
            sortContactsIn(ascending: false)
            isDisplayingAscendingOrder = false
        } else {
            sortContactsIn(ascending: true)
            isDisplayingAscendingOrder = true
        }
        
        self.tableView.reloadData()
    }
    
    
    //MARK: - Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = contacts?.count {
            return count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.selectionStyle = .none
        cell.textLabel?.text = contacts?[indexPath.row].name
        cell.detailTextLabel?.text = contacts?[indexPath.row].phone
        return cell
    }

}
