//
//  TestViewController.swift
//  EmptyDataSet-Swift
//
//  Created by YZF on 9/11/17.
//  Copyright © 2017年 Xiaoye. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, EmptyDataSetSource, EmptyDataSetDelegate {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let topHeight = UIApplication.shared.statusBarFrame.height + 44
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: topHeight + 200, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - topHeight - 200))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)

        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } 
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

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
