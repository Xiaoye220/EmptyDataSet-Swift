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
    var flag = true
    
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
//        tableView.emptyDataSetView { [weak self] view in
//            guard let `self` = self else { return }
//            view.titleLabelString(self.title(forEmptyDataSet: self.tableView))
//        }
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } 
        tableView.tableFooterView = UIView()
        
        let barButton = UIBarButtonItem.init(title: "刷新", style: .plain, target: self, action: #selector(refresh(_:)))
        navigationItem.rightBarButtonItem = barButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("deinit")
    }
    
    @objc func refresh(_ sender: Any) {
        flag = false
        tableView.reloadData()
    }
    
    /*
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
    */
    
    
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        if (flag) {
            let myString = "Share photos and videos with just the people you choose, and let them add photos, videos, and comments."
            let myAttribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0), NSAttributedStringKey.foregroundColor: UIColor.lightGray]
            let myAttrString = NSMutableAttributedString(string: myString, attributes: myAttribute)
            return myAttrString
        } else {
            let myString = "Safari cannot open the page because your iPhone is not connected to the Internet."
            let myAttribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0), NSAttributedStringKey.foregroundColor: UIColor.lightGray]
            let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)
            return myAttrString
        }
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        if (flag) {
            let myString = "Share photos and videos with just the people you choose, and let them add photos, videos, and comments."
            let myAttribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0), NSAttributedStringKey.foregroundColor: UIColor.lightGray]
            let myAttrString = NSMutableAttributedString(string: myString, attributes: myAttribute)
            return myAttrString
        } else {
            let myString = "Safari cannot open the page because your iPhone is not connected to the Internet."
            let myAttribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0), NSAttributedStringKey.foregroundColor: UIColor.lightGray]
            let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)
            return myAttrString
        }
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
