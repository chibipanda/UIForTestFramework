//
//  ViewController.swift
//  testfw
//
//  Created by Angelina Wu on 12/12/14.
//  Copyright (c) 2014 Angelina Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ClassesList.sharedInstance.testCasesList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellId : String = "classList"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as UITableViewCell!
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        
        cell.textLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 17)
        
        cell.textLabel.text = ClassesList.getArrayOfTests()[indexPath.row]

        return cell

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println ("going into segue")
        var indPath : NSIndexPath = self.tableView.indexPathForCell(sender as UITableViewCell)!
        
        if (segue.identifier == "showClass") {
            var detailViewController : classVC = segue.destinationViewController as classVC
            detailViewController.title = ClassesList.getArrayOfTests()[indPath.row]
            detailViewController.whichIndex = indPath.row
            println ("passed on")
        }
        

    }

}

