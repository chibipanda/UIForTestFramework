//
//  ClassesList.swift
//  testfw
//
//  Created by Angelina Wu on 12/12/14.
//  Copyright (c) 2014 Angelina Wu. All rights reserved.
//

import UIKit

class ClassesList: NSObject {
    
    var testCasesList = Dictionary<String, [fntr]> ()

    class var sharedInstance : ClassesList {
        
        struct Static {
            static var instance : ClassesList?
            static var token : dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = ClassesList()
        }
        return Static.instance!
    }
    
    override init () {
        
        println ("this should run only once")

        class1.populate()
        class2.populate()
        
        testCasesList = [
            "class 1" : class1.sharedInstance.ctlList,
            "class 2" : class2.sharedInstance.ctlList,
        ]
    }
    
    class func getArrayOfTests () -> [String] {
        var toRet = [String] ()
        for key in self.sharedInstance.testCasesList.keys {
            toRet.append(key)
        }
        return toRet
    }
    
}
