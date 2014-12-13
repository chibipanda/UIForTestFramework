//
//  class1.swift
//  testfw
//
//  Created by Angelina Wu on 12/12/14.
//  Copyright (c) 2014 Angelina Wu. All rights reserved.
//

import UIKit

class class1: parentClass {
    
    class var sharedInstance : class1 {
        
        struct Static {
            static let instance : class1 = class1()
        }
        return Static.instance
    }
    
    override init() {
        
    }
    
    class func populate () {
        var fntr1 = fntr(niceName: "c1 nice 1", toRun: class1.class1func1(class1.sharedInstance))
        var fntr2 = fntr(niceName: "c1 nice 2", toRun: class1.class1func2(class1.sharedInstance))
        class1.sharedInstance.ctlList.append(fntr1)
        class1.sharedInstance.ctlList.append(fntr2)
    }
    
    func class1func1 () -> (success:Bool, runTime : Double) {
        println("this is class1 func1")
        return (true, 1.0)
    }
    
    func class1func2 () -> (success:Bool, runTime : Double) {
        println("this is class1 func2")
        return (true, 1.0)
    }
   
}
