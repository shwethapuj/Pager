//
//  ToggleVC.swift
//  pagerTrial
//
//  Created by ios1 on 19/04/18.
//  Copyright © 2018 ios1. All rights reserved.
//

import UIKit

class ToggleVC: BaseVC,UITextFieldDelegate {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.allowsMultipleSelection = false
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName:"ToggleTVC",bundle : nil), forCellReuseIdentifier: "ToggleTVC")
        tableView.register(UINib(nibName:"DropDownTVC",bundle : nil), forCellReuseIdentifier: "DropDownTVC")
        tableView.register(UINib(nibName:"TextFieldTVC",bundle : nil), forCellReuseIdentifier: "TextFieldTVC")
        return tableView
    }()
    
    var dataSource : DataSource<ToggleVC>?
    var arrayData : [QuestionItem]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName:"ToggleTVC",bundle : nil), forCellReuseIdentifier: "ToggleTVC")
        let contentView = UIView()
        self.view.addSubview(contentView)
        CUtils.containerViewAutoLayout(contentView: contentView, containerView: self.view)
        contentView.addSubview(tableView)
        
        CUtils.tableViewAutoLayout(tableView: tableView, contentView: contentView)
        self.arrayData = ((parent as! wizardPageVCViewController).pageModels[wizardPageVCViewController.page.SCREEN3] as! Screen3DataModel).getDataItem()
        dataSource = DataSource<ToggleVC>(dataItem: self.arrayData!, vc: self)
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch(textField.accessibilityValue!)
        {
        case "Are you minor?":
            self.arrayData![0].changeValue(changedvalue: textField.text)
            break
        case "Are you married?":
            self.arrayData![1].changeValue(changedvalue: textField.text)
            break
        case "Any Complaints?":
            self.arrayData![2].changeValue(changedvalue: textField.text)
            break
        default: break
        }
        self.view.endEditing(true)
    }
}
