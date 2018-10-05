//
//  ReviewVC.swift
//  pagerTrial
//
//  Created by ios1 on 19/04/18.
//  Copyright © 2018 ios1. All rights reserved.
//

import UIKit

class ReviewVC: BaseVC {
     var finalData : [QuestionItem] = []
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.allowsMultipleSelection = false
        tableView.allowsSelection = true
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName:"ReviewTVC",bundle : nil), forCellReuseIdentifier: "ReviewTVC")
        tableView.register(UINib(nibName:"SubmitTVC",bundle : nil), forCellReuseIdentifier: "SubmitTVC")
        return tableView
    }()
    
    var dataSource : DataSource<ReviewVC>?
    var arrayData : [QuestionItem]? = []
    override func viewDidLoad() {
       
        super.viewDidLoad()
        let contentView = UIView()
        self.view.addSubview(contentView)
        CUtils.containerViewAutoLayout(contentView: contentView, containerView: self.view)
        contentView.addSubview(tableView)
        
        CUtils.tableViewAutoLayout(tableView: tableView, contentView: contentView)
//        self.arrayData = ((parent as! wizardPageVCViewController).pageModels[wizardPageVCViewController.page.SCREEN3] as! Screen3DataModel).getDataItem()
       // dataSource = DataSource<ReviewVC>(dataItem: self.arrayData!, vc: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.finalData.removeAll()
        for model in (parent as! wizardPageVCViewController).pageModels{
            finalData.append(contentsOf: model.getFinalData())
        }
        debugPrint(getParams())
        self.arrayData?.removeAll()
        for anitem in finalData{
            if (anitem.value != nil) {
              self.arrayData?.append(anitem)
            }
        }
        for anitem in self.arrayData!{
          anitem.changeViewType(changedView: 3)
        }
        if(self.arrayData!.count > 0 ){
        self.arrayData!.append(QuestionItem(title: "Submit", value: "Submit", viewType: 4)!)
        }
        dataSource = DataSource<ReviewVC>(dataItem: self.arrayData!, vc: self)
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func getParams() -> [String:String]{
        var params : [String:String] = [:]
        for anitem in finalData{
            if(anitem.value != nil){
                params[anitem.title!] = anitem.value!
            }
        }
        return params
    }
    
    @objc func api()
    {
    debugPrint(getParams())
    }

}
