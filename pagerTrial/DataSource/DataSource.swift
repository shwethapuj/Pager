//
//  DataSource.swift
//  pagerTrial
//
//  Created by ios1 on 19/04/18.
//  Copyright © 2018 ios1. All rights reserved.
//

import Foundation
import UIKit
class DataSource<T: BaseVC> : NSObject, UITableViewDelegate,UITableViewDataSource{
    var items: [QuestionItem]
    private var containerVC: NSObject!
    init(dataItem : [QuestionItem], vc: BaseVC) {
        self.items = dataItem
        self.containerVC = vc
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.items.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch(self.items[indexPath.row].viewType!){
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldTVC", for: indexPath) as! TextFieldTVC
            cell.label.text = self.items[indexPath.row].title
            cell.textField.accessibilityValue = self.items[indexPath.row].title
            cell.textField.delegate = containerVC as! TextFieldVC
            return cell
          case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownTVC", for: indexPath) as! DropDownTVC
            cell.textField.accessibilityValue = self.items[indexPath.row].title
            cell.textField.delegate = containerVC as! DropDownVC
            cell.label.text = self.items[indexPath.row].title
            return cell
           
         case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToggleTVC", for: indexPath) as! ToggleTVC
            cell.textfield.accessibilityValue = self.items[indexPath.row].title
            cell.textfield.delegate = containerVC as! ToggleVC
            cell.label.text = self.items[indexPath.row].title
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTVC", for: indexPath) as! ReviewTVC
            cell.label.text = self.items[indexPath.row].title
            cell.detailLabel.text = self.items[indexPath.row].value
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitTVC", for: indexPath) as! SubmitTVC
             cell.submitButton.addTarget(containerVC as! ReviewVC, action: #selector((containerVC as! ReviewVC).api), for: .touchUpInside)
            return cell
           
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
}
