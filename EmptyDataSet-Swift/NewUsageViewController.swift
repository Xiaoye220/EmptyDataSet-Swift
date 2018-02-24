//
//  NewUsageViewController.swift
//  EmptyDataSet-Swift
//
//  Created by YZF on 3/7/17.
//  Copyright © 2017年 Xiaoye. All rights reserved.
//

import UIKit

class NewUsageViewController: UITableViewController {
    
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
        
        tableView.tableFooterView = UIView()
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } 
        
        tableView.emptyDataSetView { [weak self] view in
            if let `self` = self {
                view.titleLabelString(self.config.titleString)
                    .detailLabelString(self.config.detailString)
                    .image(self.config.image)
                    .imageAnimation(self.config.imageAnimation)
                    .buttonTitle(self.config.buttonTitle(.normal), for: .normal)
                    .buttonTitle(self.config.buttonTitle(.highlighted), for: .highlighted)
                    .buttonBackgroundImage(self.config.buttonBackgroundImage(.normal), for: .normal)
                    .buttonBackgroundImage(self.config.buttonBackgroundImage(.highlighted), for: .highlighted)
                    .dataSetBackgroundColor(self.config.backgroundColor)
                    .verticalOffset(self.config.verticalOffset)
                    .verticalSpace(self.config.spaceHeight)
                    .shouldDisplay(true)
                    .shouldFadeIn(true)
                    .isTouchAllowed(true)
                    .isScrollAllowed(true)
                    .isImageViewAnimateAllowed(self.isLoading)
                    .didTapDataButton {
                        self.emptyDataSetDidTapButton()
                    }
                    .didTapContentView {
                        self.emptyDataSetDidTapView()
                    }
                    
            }
        }
        
        config.configureNavigationBar()
        config.configureStatusBar()
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
    
    //MARK: - DataSetDelegate Methods
//    func emptyDataSetShouldDisplay() -> Bool {
//        return true
//    }
//    
//    func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView) -> Bool {
//        return true
//    }
//    
//    func emptyDataSetShouldAllowScroll() -> Bool {
//        return true
//    }
//    
//    func emptyDataSetShouldAnimateImageView() -> Bool {
//        return isLoading
//    }
    
    func emptyDataSetDidTapView() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.isLoading = false
        }
    }
    
    func emptyDataSetDidTapButton() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.isLoading = false
        }
    }

}

