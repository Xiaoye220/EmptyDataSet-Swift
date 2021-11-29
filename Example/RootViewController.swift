//
//  RootViewController.swift
//  EmptyDataSet-Swift
//
//  Created by YZF on 3/7/17.
//  Copyright © 2017年 Xiaoye. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    enum Content: String {
        case originalUsage = "OriginalUsage"
        case newUsage = "NewUsage"
        case test = "Test"
    }
    
    var contents: [Content] = [.originalUsage, .newUsage, .test]
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
        
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        
        cell.textLabel?.text = contents[indexPath.row].rawValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller: UIViewController
        switch contents[indexPath.row] {
        case .originalUsage:
            controller = ApplicationsViewController()
            (controller as! ApplicationsViewController).impl = .original
        case .newUsage:
            controller = ApplicationsViewController()
            (controller as! ApplicationsViewController).impl = .new
        case .test:
            controller = TestViewController()
        }
        navigationController?.pushViewController(controller, animated: true)
    }
}
