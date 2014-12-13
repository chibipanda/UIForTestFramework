//
//  classVC.swift
//  testfw
//
//  Created by Angelina Wu on 12/12/14.
//  Copyright (c) 2014 Angelina Wu. All rights reserved.
//

import UIKit

class classVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var whichIndex : Int = -1

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        println("loading classVC")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var key = ClassesList.getArrayOfTests()[whichIndex]
        var funList = ClassesList.sharedInstance.testCasesList[key]! as [fntr]
        return funList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellId : String = "funcList"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as UITableViewCell!
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        
        var key = ClassesList.getArrayOfTests()[whichIndex]
        var funList = ClassesList.sharedInstance.testCasesList[key]! as [fntr]
        
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 17)
        
        cell.textLabel?.text = funList[indexPath.row].displayName
        var bleh = funList[indexPath.row].success ? "Passed " : "Failed "
        cell.detailTextLabel?.text = bleh + "in \(funList[indexPath.row].runTime) seconds."
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var key = ClassesList.getArrayOfTests()[whichIndex]
        var funList = ClassesList.sharedInstance.testCasesList[key]! as [fntr]
        
        var b : (Bool, Double) = parentClass.callFunction(funList[indexPath.row].funt)
        funList[indexPath.row].runTime = b.1
        funList[indexPath.row].success = b.0
        
        self.tableView.reloadData()
    }

}
