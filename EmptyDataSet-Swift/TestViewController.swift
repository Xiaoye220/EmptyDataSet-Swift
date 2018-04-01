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
        view.backgroundColor = UIColor.white
        
        let topHeight = UIApplication.shared.statusBarFrame.height + 44
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: topHeight, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - topHeight))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)

        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
//        tableView.emptyDataSetView { [weak self] view in
//            guard let `self` = self else { return }
//            view.customView(CustomViewWithXib.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100)))
//        }
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
        let view = CustomViewWithXib.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
//        let view = UILabel()//init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
//        view.text = "lalala"
//        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
//        let view = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
//        view.image = UIImage.init(named: "AppIcon")
//        view.backgroundColor = UIColor.red
        return view
    }
 
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
        return 50
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
