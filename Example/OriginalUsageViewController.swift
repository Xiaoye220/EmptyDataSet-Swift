//
//  DetailViewController.swift
//  EmptyDataSet-Swift
//
//  Created by YZF on 29/6/17.
//  Copyright © 2017年 Xiaoye. All rights reserved.
//

import UIKit

class OriginalUsageViewController: UITableViewController, EmptyDataSetSource, EmptyDataSetDelegate {

    var config: Configuration!

    var isLoading = false {
        didSet {
            tableView.reloadEmptyDataSet()
            config.isLoading = isLoading
        }
    }
    
    init(_ application: Application) {
        super.init(nibName: nil, bundle: nil)
        
        self.config = Configuration(application, controller: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        
        configureNavigationBar()
        configureStatusBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        return cell!
    }
    
    //MARK: - DZNEmptyDataSetSource
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return config.titleString
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return config.detailString
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return config.image
    }
    
    func imageAnimation(forEmptyDataSet scrollView: UIScrollView) -> CAAnimation? {
        return config.imageAnimation
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> NSAttributedString? {
        return config.buttonTitle(state)
    }
 
    func buttonBackgroundImage(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> UIImage? {
        return config.buttonBackgroundImage(state)
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor? {
       return config.backgroundColor
    }
    
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
        return config.verticalOffset
    }
    
    func spaceHeight(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
       return config.spaceHeight
    }
    
    //MARK: - DZNEmptyDataSetDelegate Methods
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAnimateImageView(_ scrollView: UIScrollView) -> Bool {
        return isLoading
    }
    
    func emptyDataSet(_ scrollView: UIScrollView, didTapView view: UIView) {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.isLoading = false
        }
    }
    
    func emptyDataSet(_ scrollView: UIScrollView, didTapButton button: UIButton) {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.isLoading = false
        }
    }
}

extension OriginalUsageViewController {
    
    // Configuration NavigationBar
    func configureNavigationBar() {
        config.configureNavigationBar()
    }
    
    func configureStatusBar() {
        config.configureStatusBar()
    }
    
}
