//
//  ColorgyAddCourseViewController.swift
//  ColorgyTimeTable
//
//  Created by David on 2015/5/1.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class ColorgyAddCourseViewController: UITableViewController, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {

    var tableData = [String]()
    var filteredtabledata = [String]()
    var resultSearchController = UISearchController()
    var addedCourses = ["hi", "hello", "yo", "fuck the shit", "penis"]
    
    var courseJSONData: NSData!
    
    var parsedCourseData: NSArray!
    
    var colorgyGreen: UIColor = UIColor(red: 42/255.0, green: 171/255.0, blue: 147/255.0, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("hi")
        
        self.tableView?.backgroundColor = self.colorgyGreen
        
        self.edgesForExtendedLayout = UIRectEdge.Top
        self.navigationController?.view.backgroundColor = UIColor.redColor()
        self.definesPresentationContext = true
        
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        
        self.resultSearchController.searchBar.sizeToFit()
        self.resultSearchController.searchBar.placeholder = "Search for course"
        self.resultSearchController.dimsBackgroundDuringPresentation = false

        self.tableView?.tableHeaderView = self.resultSearchController.searchBar
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let path = NSBundle.mainBundle().pathForResource("NCKU_samll_course", ofType: "json")
        self.courseJSONData = NSData(contentsOfFile: path!)
        var error: NSError?
        self.parsedCourseData = NSJSONSerialization.JSONObjectWithData(courseJSONData!, options: nil, error: &error) as!  NSArray
        if error != nil {
            println(error)
        }
        
        for data in parsedCourseData {
            if data["course_name"] != nil {
                let s = data["course_name"] as! String
                self.tableData.append(s)
            }
            
        }
    }
    
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchText = self.resultSearchController.searchBar.text
        self.filterContentForSearchText(searchText)
        self.tableView?.reloadData()
        println("change")
//        if self.resultSearchController.active {
//            searchController.searchBar.searchBarStyle = UISearchBarStyle.Default
//        } else {
//            searchController.searchBar.searchBarStyle = UISearchBarStyle.Minimal
//        }
    }
    
    func filterContentForSearchText(searchText: String) {
        self.filteredtabledata = self.tableData.filter({ ( data: String ) -> Bool in
            
            let nameMatch = data.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            
            return nameMatch != nil
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.resultSearchController.active {
            println("active")
            return self.filteredtabledata.count
        } else {
            println("not active")
            return self.addedCourses.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if self.resultSearchController.active {
            var cell = tableView.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = self.filteredtabledata[indexPath.row]
            cell.detailTextLabel?.text = "yaya"
            cell.backgroundColor = self.colorgyGreen
            return cell
        } else {
            var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = self.addedCourses[indexPath.row]
            cell.backgroundColor = self.colorgyGreen
            return cell
        }
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    

}
