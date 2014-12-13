//
//  class2.swift
//  testfw
//
//  Created by Angelina Wu on 12/12/14.
//  Copyright (c) 2014 Angelina Wu. All rights reserved.
//

import UIKit

class class2: parentClass {
    
    
    class var sharedInstance : class2 {
        
        struct Static {
            static let instance : class2 = class2()
        }
        return Static.instance
    }
    
    override init() {
        
    }
    
    class func populate () {
        class2.sharedInstance.ctlList.append(fntr(niceName: "c2 nice 1", toRun: class2.class2func1(class2.sharedInstance)))
        class2.sharedInstance.ctlList.append(fntr(niceName: "c2 nice 2", toRun: class2.class2func2(class2.sharedInstance)))
    }
    
    func class2func1 () -> (success:Bool, runTime : Double) {
        println("this is class2 func1")
        return (true, 1.0)
    }
    
    func class2func2 () -> (success:Bool, runTime : Double) {
        println("this is class2 func2")
        return (true, 1.0)
    }
    

}
