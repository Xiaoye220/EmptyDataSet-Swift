//
//  TestViewController.swift
//  EmptyDataSet-Swift
//
//  Created by YZF on 9/11/17.
//  Copyright © 2017年 Xiaoye. All rights reserved.
//

import UIKit

class TestViewController: UITableViewController, EmptyDataSetSource, EmptyDataSetDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } 
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customView(forEmptyDataSet scrollView: UIScrollView) -> UIView? {
        let view = UIView()
        view.frame = CGRect.init(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 100)
        view.backgroundColor = UIColor.lightGray

        let label = UILabel()
        label.frame = CGRect.init(x: 0, y: 10, width: UIScreen.main.bounds.width, height: 40)
        label.text = "Test CustomView"

        view.addSubview(label)

        return view
    }
    

}
