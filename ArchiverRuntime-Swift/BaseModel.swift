//
//  BaseModel.swift
//  ArchiverRuntime-Swift
//
//  Created by LZQ on 16/7/13.
//  Copyright © 2016年 LZQ. All rights reserved.
//

import Foundation

class BaseModel: NSObject,NSCoding {
    
    override init() {
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        var cls: AnyClass = self.classForCoder
        
        while cls != NSObject.self {
            var ivarCount: CUnsignedInt = 0
            var propertyCount: CUnsignedInt = 0
            var commonCount: CUnsignedInt = 0
            let isSelfClass: Bool = (cls == self.classForCoder)
            let ivarList = class_copyIvarList(cls, &ivarCount)
            let propertyList = class_copyPropertyList(cls, &propertyCount)
            commonCount = isSelfClass ? ivarCount : propertyCount
            
            for i in 0..<commonCount {
                let index = Int(i)
                let ivarName = isSelfClass ? ivar_getName(ivarList[index]) : property_getName(propertyList[index])
                let key = String.init(UTF8String: ivarName)
                let value = self.valueForKey(key!)
                if let _ = value {
                    aCoder.encodeObject(value, forKey: key!)
                }
            }
            free(ivarList)
            free(propertyList)
            cls = class_getSuperclass(cls)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        var cls: AnyClass = self.classForCoder
        while cls != NSObject.self {
            var ivarCount: CUnsignedInt = 0
            var propertyCount: CUnsignedInt = 0
            var commonCount: CUnsignedInt = 0
            let isSelfClass: Bool = (cls == self.classForCoder)
            let ivarList = class_copyIvarList(cls, &ivarCount)
            let propertyList = class_copyPropertyList(cls, &propertyCount)
            commonCount = isSelfClass ? ivarCount : propertyCount
            
            for i in 0..<commonCount {
                let index = Int(i)
                let ivarName = isSelfClass ? ivar_getName(ivarList[index]) : property_getName(propertyList[index])
                let key = String.init(UTF8String: ivarName)
                let value = aDecoder.decodeObjectForKey(key!)
                if let _ = value {
                    self.setValue(value, forKey: key!)
                }
            }
            free(ivarList)
            free(propertyList)
            cls = class_getSuperclass(cls)
        }
    }

    
}