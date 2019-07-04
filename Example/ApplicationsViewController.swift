//
//  ViewController.swift
//  EmptyDataSet-Swift
//
//  Created by YZF on 27/6/17.
//  Copyright © 2017年 Xiaoye. All rights reserved.
//

import UIKit

class ApplicationsViewController: UITableViewController {
    
    enum Implementation {
        case original
        case new
    }
    
    var applications: [Application] = [.Airbnb, .AppStore, .Camera, .Dropbox, .Facebook,
                                       .Fancy, .Foursquare, .iCloud, .Instagram, .iTunesConnect,
                                       .Kickstarter, .Path, .Pinterest, .Photos, .Podcasts,
                                       .Remote, .Safari, .Skype, .Slack, .Tumblr, .Twitter,
                                       .Videos, .Vesper, .Vine, .Whatsapp, .WWDC]
    
    var impl: Implementation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        title = "Applications"
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        
        tableView.tableFooterView = UIView()
        
        navigationController?.navigationBar.titleTextAttributes = nil
        navigationController?.navigationBar.barTintColor = UIColor(hexColor: "f8f8f8")
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .default
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(hexColor: "f8f8f8")
        navigationController?.navigationBar.tintColor = UIColor.black
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applications.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        }
        let app = applications[indexPath.row]
        cell.textLabel?.text = app.display_name
        cell.detailTextLabel?.text = app.developer_name
        
        let image = UIImage.init(named: ("icon_" + app.display_name!).lowercased().replacingOccurrences(of: " ", with: "_"))
        cell.imageView?.image = image
        
        cell.imageView?.layer.cornerRadius = (image?.size.width)! * 0.2
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.layer.borderColor = UIColor(white: 0, alpha: 0.2).cgColor
        cell.imageView?.layer.borderWidth = 0.5
        
        cell.imageView?.layer.shouldRasterize = true
        cell.imageView?.layer.rasterizationScale = UIScreen.main.scale
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let app = applications[indexPath.row]
        var controller: UIViewController
        
        switch impl! {
        case .original:
            controller = OriginalUsageViewController(app)
        case .new:
            controller = NewUsageViewController(app)
        }
        
        navigationController?.pushViewController(controller, animated: true)
    }

}

