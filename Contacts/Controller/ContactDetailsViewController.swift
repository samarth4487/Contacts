//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by Samarth Paboowal on 05/02/18.
//  Copyright © 2018 Samarth Paboowal. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Variables
    
    var contact: Contact?
    var contentArray = [String]()
    let headerCellIdentifier = "headerCell"
    let normalCellIdentifier = "normalCell"
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - View Controller Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillContentArray()
        tableView.register(HeaderCell.self, forCellReuseIdentifier: headerCellIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    //MARK: - User Defined Methods
    
    func fillContentArray() {
        
        contentArray.append("Mobile - " + (contact?.phone)!)
        contentArray.append("Username - " + (contact?.username)!)
        contentArray.append("Email - " + (contact?.email)!)
        contentArray.append("Website - " + (contact?.website)!)
        contentArray.append("Address - " + (contact?.address?.suite)! + (contact?.address?.street)!)
        contentArray.append("City - " + (contact?.address?.city)! + ", " + (contact?.address?.zipcode)!)
        contentArray.append("Company - " + (contact?.company?.name)!)
    }
    
    
    //MARK: - Orientation Methods
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        let indexPath = NSIndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath as IndexPath) as! HeaderCell
        cell.thumbnailLabel.center.x = cell.center.x
        cell.nameLabel.center.x = cell.center.x
        tableView.reloadData()
    }
    
    
    //MARK: - Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 170
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: headerCellIdentifier, for: indexPath) as! HeaderCell
            cell.setupViews()
            cell.backgroundColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
            cell.selectionStyle = .none
            cell.nameLabel.text = contact?.name
            return cell
        } else {
            let cell = UITableViewCell(style: .default, reuseIdentifier: normalCellIdentifier)
            cell.textLabel?.textColor = UIColor.blue
            cell.textLabel?.text = contentArray[indexPath.row - 1]
            cell.selectionStyle = .none
            return cell
        }
    }

}
