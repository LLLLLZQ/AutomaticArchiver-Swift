//
//  Person.swift
//  ArchiverRuntime-Swift
//
//  Created by LZQ on 16/7/13.
//  Copyright © 2016年 LZQ. All rights reserved.
//

import Foundation

class Person: BaseModel {
    
    var name: String
    var age: Int
    
    override init() {
        name = ""
        age = 0
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = ""
        age = 0
        super.init(coder: aDecoder)
    }
    
}