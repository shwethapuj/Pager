//
//  QuestionItem.swift
//  pagerTrial
//
//  Created by ios1 on 19/04/18.
//  Copyright © 2018 ios1. All rights reserved.
//

import Foundation
class QuestionItem{
    var title: String?
    var value : String?
    var viewType : Int?
    
    init?(title: String? = nil,value: String? = nil, viewType : Int?) {
        self.title = title
        self.value = value
        self.viewType = viewType
    }
    func changeValue(changedvalue: String?){
        self.value = changedvalue
    }
    func changeViewType(changedView : Int?)
    {
        self.viewType = changedView
    }
}
