//
//  Screen2.swift
//  pagerTrial
//
//  Created by ios1 on 19/04/18.
//  Copyright © 2018 ios1. All rights reserved.
//

import Foundation
class Screen2DataModel : AbstractPage{
    var dropDownList : [QuestionItem] = []
    
    override init(key: String, title: String) {
        super.init(key: key, title: title)
        loadData()
    }
    
    func loadData(){
        dropDownList.append(QuestionItem(title: "Age",viewType: viewType.DropDownView)!)
        dropDownList.append(QuestionItem(title: "experience",viewType: viewType.DropDownView)!)
        dropDownList.append(QuestionItem(title: "CTC",viewType: viewType.DropDownView)!)
     }
    func getDataItem() -> [QuestionItem]{
        if(self.dropDownList.isEmpty){
            loadData()
        }
        return dropDownList
    }
    override func getFinalData() -> [QuestionItem] {
        return dropDownList
    }
}
