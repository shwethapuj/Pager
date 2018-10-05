//
//  CUtils.swift
//  pagerTrial
//
//  Created by ios1 on 19/04/18.
//  Copyright © 2018 ios1. All rights reserved.
//

import Foundation
import UIKit

class CUtils{
    public static func tableViewAutoLayout(tableView: UITableView, contentView: UIView){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        tableView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1).isActive = true
        tableView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    public static func containerViewAutoLayout(contentView: UIView, containerView: UIView){
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1).isActive = true
    contentView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1).isActive = true
    contentView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
}
