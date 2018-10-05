//
//  Screen1.swift
//  pagerTrial
//
//  Created by ios1 on 19/04/18.
//  Copyright © 2018 ios1. All rights reserved.
//

import Foundation

class Screen1DataModel: AbstractPage{
    var textFieldList :[QuestionItem] = []
    
    override init(key: String, title: String) {
        super.init(key: key, title: title)
        loadData()
    }
    
    func loadData(){
        textFieldList.append(QuestionItem(title: "Firstname",viewType: viewType.TextFieldView)!)
        textFieldList.append(QuestionItem(title: "lastName",viewType: viewType.TextFieldView)!)
        textFieldList.append(QuestionItem(title: "pinCode",viewType: viewType.TextFieldView)!)
    }
    func getDataItem() -> [QuestionItem]{
        if(self.textFieldList.isEmpty){
            loadData()
        }
        return textFieldList
    }
    override func getFinalData() -> [QuestionItem] {
        return textFieldList
    }
}
