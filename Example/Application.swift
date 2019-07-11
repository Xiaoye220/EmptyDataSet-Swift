//
//  Application.swift
//  EmptyDataSet-Swift
//
//  Created by YZF on 2018/2/5.
//  Copyright © 2018年 Xiaoye. All rights reserved.
//

import Foundation
import UIKit

enum Application: String {
    case Airbnb, AppStore, Camera, Dropbox, Facebook, Fancy, Foursquare, iCloud, Instagram, iTunesConnect, Kickstarter, Path, Pinterest, Photos, Podcasts, Remote, Safari, Skype, Slack, Tumblr, Twitter, Videos, Vesper, Vine, Whatsapp, WWDC
    
    static let appsData: [[String: String]] = {
        // get all applications from applications.json
        let path = Bundle.main.path(forResource: "applications", ofType: "json")
        do {
            let data = try Data.init(contentsOf: URL.init(fileURLWithPath: path!))
            do {
                if let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: String]] {
                    return result
                }
            } catch { }
        } catch { }
        return []
    }()
    
}


extension Application {
    
    var appData: [String: String]? {
        if let dict = Application.appsData.first(where: { $0["display_name"] == self.rawValue }) {
            return dict
        }
        return nil
    }
    
    var display_name: String? {
        if let dict = appData {
            return dict["display_name"]!
        }
        return nil
    }
    
    var developer_name: String? {
        if let dict = appData {
            return dict["developer_name"]!
        }
        return nil
    }
    
    var identifier: String? {
        if let dict = appData {
            return dict["identifier"]!
        }
        return nil
    }
}


