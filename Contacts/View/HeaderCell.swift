//
//  HeaderCell.swift
//  Contacts
//
//  Created by Samarth Paboowal on 06/02/18.
//  Copyright © 2018 Samarth Paboowal. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    let thumbnailLabel = UILabel()
    let nameLabel = UILabel()
    
    func setupViews() {
        
        thumbnailLabel.frame = CGRect(x: self.center.x - 50, y: 20, width: 100, height: 100)
        thumbnailLabel.backgroundColor = UIColor.lightGray
        thumbnailLabel.layer.masksToBounds = true
        thumbnailLabel.layer.cornerRadius = 50
        thumbnailLabel.text = "SP"
        thumbnailLabel.textColor = UIColor.white
        thumbnailLabel.font = UIFont.boldSystemFont(ofSize: 36)
        thumbnailLabel.textAlignment = .center
        addSubview(thumbnailLabel)
        
        nameLabel.frame = CGRect(x: 10, y: thumbnailLabel.frame.maxY + 10, width: frame.width - 20, height: 30)
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 26)
        addSubview(nameLabel)
    }

}
