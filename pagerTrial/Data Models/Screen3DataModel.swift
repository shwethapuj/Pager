//
//  Screen3.swift
//  pagerTrial
//
//  Created by ios1 on 19/04/18.
//  Copyright © 2018 ios1. All rights reserved.
//

import Foundation
class Screen3DataModel: AbstractPage{
    var TogggleList : [QuestionItem] = []
    override init(key: String, title: String) {
        super.init(key: key, title: title)
        loadData()
    }
    func loadData(){
        TogggleList.append(QuestionItem(title: "Are you minor?",viewType: viewType.ToggleView)!)
        TogggleList.append(QuestionItem(title: "Are you married?",viewType: viewType.ToggleView)!)
        TogggleList.append(QuestionItem(title: "Any Complaints?",viewType: viewType.ToggleView)!)
    }
    func getDataItem() -> [QuestionItem]{
        if(self.TogggleList.isEmpty){
            loadData()
        }
        return TogggleList
    }
    override func getFinalData() -> [QuestionItem] {
        return TogggleList
    }
}
