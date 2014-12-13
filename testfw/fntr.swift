//
//  fntr.swift
//  testfw
//
//  Created by Angelina Wu on 13/12/14.
//  Copyright (c) 2014 Angelina Wu. All rights reserved.
//

import UIKit

class fntr: NSObject {
    var displayName : String = ""
    var funt : () -> (Bool, Double)
    var success : Bool = false
    var runTime : Double = -1
    init (niceName : String, toRun : () -> (Bool, Double)){
        displayName = niceName
        funt = toRun
    }
    init (niceName : String, toRun : () -> (Bool, Double), success : Bool, runTime : Double) {
        self.displayName = niceName
        self.funt = toRun
        self.success = success
        self.runTime = runTime
    }
    func setSuccess(s:Bool) {
        self.success = s
    }
    func setRunTime (r:Double) {
        self.runTime = r
    }

}
