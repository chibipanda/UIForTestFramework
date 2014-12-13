//
//  parentClass.swift
//  testfw
//
//  Created by Angelina Wu on 12/12/14.
//  Copyright (c) 2014 Angelina Wu. All rights reserved.
//

import UIKit

class parentClass: NSObject {
    
    var ctlList = [fntr]()
    
    override init() {
        // do nothing
    }
    
    // MARK: - Meta function to run other functions
    // Only work with no argument, returning void
    
    class func callFunction (f: () -> (Bool, Double)) -> (success: Bool, runTime: Double) {
        let b = f()
        return b
    }
}

