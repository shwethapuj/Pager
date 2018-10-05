//
//  AbstractPage.swift
//  pagerTrial
//
//  Created by ios1 on 19/04/18.
//  Copyright © 2018 ios1. All rights reserved.
//

import Foundation

class AbstractPage{
    var key : String
    var title : String
    var finalItems : [QuestionItem]?
    
    func getFinalData() -> [QuestionItem]{
        return finalItems!
    }
    init(key: String, title: String) {
        self.key = key
        self.title = title
    }
}
