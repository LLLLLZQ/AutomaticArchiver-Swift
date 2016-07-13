//
//  Student.swift
//  ArchiverRuntime-Swift
//
//  Created by LZQ on 16/7/13.
//  Copyright © 2016年 LZQ. All rights reserved.
//

import Foundation

class Student: Person {
    
    var studentID: Int
    var job: String
    
    override init() {
        studentID = 0
        job = ""
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        studentID = 0
        job = ""
        super.init(coder: aDecoder)
    }
}