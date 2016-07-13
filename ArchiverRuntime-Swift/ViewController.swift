//
//  ViewController.swift
//  ArchiverRuntime-Swift
//
//  Created by LZQ on 16/7/13.
//  Copyright © 2016年 LZQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var student: Student!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        student = Student()
        student.age = 24
        student.name = "lzq"
        student.job = "IT"
        student.studentID = 2012812025
        
        messageArchive()
        messageUnarchive()
        

    }
}

extension ViewController {
    
    func messageArchive() {
        let documents = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as [String]
        let document = documents.last! as NSString
        let path = document.stringByAppendingPathComponent("StudentSetting.archiver")
        NSKeyedArchiver.archiveRootObject(student, toFile: path)
    }
    
    func messageUnarchive() {
        let documents1 = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as [String]
        let document2 = documents1.last! as NSString
        let path1 = document2.stringByAppendingPathComponent("StudentSetting.archiver")
        if let archiverStudentSetting = NSKeyedUnarchiver.unarchiveObjectWithFile(path1) as? Student {
            print(archiverStudentSetting.age)
            print(archiverStudentSetting.name)
            print(archiverStudentSetting.job)
            print(archiverStudentSetting.studentID)
        }
    }
    
}

