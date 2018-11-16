//
//  TestViewController.swift
//  EmptyDataSet-Swift
//
//  Created by YZF on 9/11/17.
//  Copyright © 2017年 Xiaoye. All rights reserved.
//

import UIKit
import SnapKit

class TestViewController: UIViewController, EmptyDataSetSource, EmptyDataSetDelegate {

    var tableView: UITableView!
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        
        let navBarButtom = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(reload))
        self.navigationItem.rightBarButtonItem = navBarButtom
        
        let topHeight = UIApplication.shared.statusBarFrame.height + 44
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: topHeight, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - topHeight))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 400))
        headerView.backgroundColor = .red
        tableView.tableHeaderView = headerView

        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
//        tableView.emptyDataSetView { [weak self] view in
//            guard let `self` = self else { return }
//            view.customView(CustomView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
//                .verticalOffset(50)
//                .buttonImage(nil, for: .disabled)
//        }
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor? {
        return UIColor.init(white: 0.95, alpha: 1)
    }
    
//    func customView(forEmptyDataSet scrollView: UIScrollView) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        view.backgroundColor = .red
//
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
//        button.setTitle("button", for: .normal)
//        button.backgroundColor = UIColor.black
//        view.addSubview(button)
//        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
//
//        return view
//    }
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> NSAttributedString? {
        return NSAttributedString(string: "lalala")
    }

    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return NSAttributedString(string: "hahaha")
    }
 
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
        return 100
    }
    
    func emptyDataSet(_ scrollView: UIScrollView, didTapView view: UIView) {
        print("hello")
    }
    
    func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    @objc func buttonClicked() {
        
    }
    
    @objc func reload() {
        tableView.reloadData()
    }
}

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hello World"
        
        return cell
    }
}
