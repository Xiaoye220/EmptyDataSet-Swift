//
//  Configuration.swift
//  EmptyDataSet-Swift
//
//  Created by YZF on 2018/2/24.
//  Copyright © 2018年 Xiaoye. All rights reserved.
//

import Foundation
import UIKit

struct Configuration {
    
    var app: Application
    var isLoading = false
    
    weak var controller: UITableViewController!
    
    init(_ app: Application, controller: UITableViewController) {
        self.app = app
        self.controller = controller
    }
    
    var titleString: NSAttributedString? {
        var text: String?
        var font: UIFont?
        var textColor: UIColor?
        
        switch app {
        case .Airbnb:
            text = "No Messages"
            font = UIFont.init(name: "HelveticaNeue-Light", size: 22)!
            textColor = UIColor(hexColor: "c9c9c9")
            
        case .Camera:
            text = "Please Allow Photo Access"
            font = UIFont.boldSystemFont(ofSize: 18)
            textColor = UIColor(hexColor: "5f6978")
            
        case .Dropbox:
            text = "Star Your Favorite Files"
            font = UIFont.boldSystemFont(ofSize: 17.0)
            textColor = UIColor(hexColor: "25282b")
            
        case .Facebook:
            text = "No friends to show."
            font = UIFont.boldSystemFont(ofSize: 22.0)
            textColor = UIColor(hexColor: "acafbd")
            
        case .Fancy:
            text = "No Owns yet"
            font = UIFont.boldSystemFont(ofSize: 14.0)
            textColor = UIColor(hexColor: "494c53")
            
        case .iCloud:
            text = "iCloud Photo Sharing"
            
        case .Instagram:
            text = "Instagram Direct"
            font = UIFont.init(name: "HelveticaNeue-Light", size: 26)!
            textColor = UIColor(hexColor: "444444")
            
        case .iTunesConnect:
            text = "No Favorites"
            font = UIFont.systemFont(ofSize: 16)
            
        case .Kickstarter:
            text = "Activity empty"
            font = UIFont.boldSystemFont(ofSize: 16.0)
            textColor = UIColor(hexColor: "828587")
            
        case .Path:
            text = "Message Your Friends"
            font = UIFont.boldSystemFont(ofSize: 14.0)
            textColor = UIColor.white
            
        case .Pinterest:
            text = "No boards to display"
            font = UIFont.boldSystemFont(ofSize: 18.0)
            textColor = UIColor(hexColor: "666666")
            
        case .Photos:
            text = "No Photos or Videos"
            
        case .Podcasts:
            text = "No Podcasts"
            
        case .Remote:
            text = "Cannot Connect to a Local Network"
            font = UIFont.init(name: "HelveticaNeue-Medium", size: 18)
            textColor = UIColor(hexColor: "555555")
            
        case .Tumblr:
            text = "This is your Dashboard."
            font = UIFont.boldSystemFont(ofSize: 18.0)
            textColor = UIColor(hexColor: "aab6c4")
            
        case .Twitter:
            text = "No lists"
            font = UIFont.boldSystemFont(ofSize: 14.0)
            textColor = UIColor(hexColor: "292f33")
            
        case .Vesper:
            text = "No Notes"
            font = UIFont.init(name: "IdealSans-Book-Pro", size: 16)
            textColor = UIColor(hexColor: "d9dce1")
            
        case .Videos:
            text = "AirPlay"
            font = UIFont.systemFont(ofSize: 17)
            textColor = UIColor(hexColor: "414141")
            
        case .Vine:
            text = "Welcome to VMs"
            font = UIFont.boldSystemFont(ofSize: 22.0)
            textColor = UIColor(hexColor: "595959")
            
        case .Whatsapp:
            text = "No Media"
            font = UIFont.systemFont(ofSize: 20)
            textColor = UIColor(hexColor: "808080")
            
        case .WWDC:
            text = "No Favorites"
            font = UIFont.init(name: "HelveticaNeue-Medium", size: 16)
            textColor = UIColor(hexColor: "b9b9b9")
        default:
            break
        }
        
        if text == nil {
            return nil
        }
        var attributes: [NSAttributedString.Key: Any] = [:]
        if font != nil {
            attributes[NSAttributedString.Key.font] = font!
        }
        if textColor != nil {
            attributes[NSAttributedString.Key.foregroundColor] = textColor
        }
        return NSAttributedString.init(string: text!, attributes: attributes)
    }
    
    
    var detailString: NSAttributedString? {
        var text: String?
        var font: UIFont?
        var textColor: UIColor?
        
        switch app {
        case .Airbnb:
            text = "When you have messages, you’ll see them here."
            font = UIFont.systemFont(ofSize: 13.0)
            textColor = UIColor(hexColor: "cfcfcf")
            
        case .AppStore:
            text = "There are no results for “wwdc2014”."
            font = UIFont.systemFont(ofSize: 14.0)
            textColor = UIColor(hexColor: "333333")
            
        case .Camera:
            text = "This allows you to share photos from your library and save photos to your camera roll."
            font = UIFont.systemFont(ofSize: 14.0)
            textColor = UIColor(hexColor: "5f6978")
            
        case .Dropbox:
            text = "Favorites are saved for offline access."
            font = UIFont.systemFont(ofSize: 14.5)
            textColor = UIColor(hexColor: "7b8994")
            
        case .Fancy:
            text = "Tap Add to List and add things to Owns"
            font = UIFont.systemFont(ofSize: 13.0)
            textColor = UIColor(hexColor: "7a7d83")
            
        case .Foursquare:
            text = "Nobody has liked or commented on your check-ins yet."
            font = UIFont.boldSystemFont(ofSize: 14.0)
            textColor = UIColor(hexColor: "cecbc6")
            
        case .iCloud:
            text = "Share photos and videos with just the people you choose, and let them add photos, videos, and comments."
            
        case .Instagram:
            text = "Send photos and videos directly to your friends. Only the people you send to can see these posts."
            font = UIFont.systemFont(ofSize: 16.0)
            textColor = UIColor(hexColor: "444444")
            
        case .iTunesConnect:
            text = "To add a favorite, tap the star icon next to an App's name."
            font = UIFont.systemFont(ofSize: 14.0)
            
        case .Kickstarter:
            text = "When you back a project or follow a friend, their activity will show up here."
            font = UIFont.systemFont(ofSize: 14.0)
            textColor = UIColor(hexColor: "828587")
            
        case .Path:
            text = "Send a message or create a group."
            font = UIFont.systemFont(ofSize: 14.0)
            textColor = UIColor(hexColor: "a6978d")
            
        case .Photos:
            text = "You can sync photos and videos onto your iPhone using iTunes."
            
        case .Podcasts:
            text = "You can subscribe to podcasts in Top Charts or Featured."
            
        case .Remote:
            text = "You must connect to a Wi-Fi network to control iTunes or Apple TV"
            font = UIFont.init(name: "HelveticaNeue-Medium", size: 11.75)
            textColor = UIColor(hexColor: "555555")
            
        case .Safari:
            text = "Safari cannot open the page because your iPhone is not connected to the Internet."
            textColor = UIColor(hexColor: "7d7f7f")
            
        case .Skype:
            text = "Keep all your favorite people together, add favorites."
            font = UIFont.init(name: "HelveticaNeue-Light", size: 17.75)
            textColor = UIColor(hexColor: "a6c3d1")
            
        case .Slack:
            text = "You don't have any recent mentions"
            font = UIFont.init(name: "Lato-Regular", size: 19)
            textColor = UIColor(hexColor: "d7d7d7")
            
        case .Tumblr:
            text = "When you follow some blogs, their latest posts will show up here!"
            font = UIFont.systemFont(ofSize: 17.0)
            textColor = UIColor(hexColor: "828e9c")
            
        case .Twitter:
            text = "You aren’t subscribed to any lists yet."
            font = UIFont.systemFont(ofSize: 12.0)
            textColor = UIColor(hexColor: "8899a6")
            
        case .Videos:
            text = "This video is playing on “Apple TV”."
            font = UIFont.systemFont(ofSize: 12.0)
            textColor = UIColor(hexColor: "737373")
            
        case .Vine:
            text = "This is where your private conversations will live"
            font = UIFont.systemFont(ofSize: 17.0)
            textColor = UIColor(hexColor: "a6a6a6")
            
        case .Whatsapp:
            text = "You can exchange media with Ignacio by tapping on the Arrow Up icon in the conversation screen."
            font = UIFont.systemFont(ofSize: 15.0)
            textColor = UIColor(hexColor: "989898")
            
        case .WWDC:
            text = "Favorites are only available to Registered Apple Developers."
            font = UIFont.systemFont(ofSize: 16.0)
            textColor = UIColor(hexColor: "b9b9b9")
            
        default:
            break
        }
        if text == nil {
            return nil
        }
        var attributes: [NSAttributedString.Key: Any] = [:]
        if font != nil {
            attributes[NSAttributedString.Key.font] = font!
        }
        if textColor != nil {
            attributes[NSAttributedString.Key.foregroundColor] = textColor
        }
        return NSAttributedString.init(string: text!, attributes: attributes)
    }
    
    var image: UIImage? {
        if isLoading {
            return UIImage.init(named: "loading_imgBlue_78x78")
        } else {
            let imageNamed = ("placeholder_" + app.display_name!).lowercased().replacingOccurrences(of: " ", with: "_")
            return UIImage.init(named: imageNamed)
        }
    }
    
    var imageAnimation: CAAnimation? {
        let animation = CABasicAnimation.init(keyPath: "transform")
        animation.fromValue = NSValue.init(caTransform3D: CATransform3DIdentity)
        animation.toValue = NSValue.init(caTransform3D: CATransform3DMakeRotation(.pi/2, 0.0, 0.0, 1.0))
        animation.duration = 0.25
        animation.isCumulative = true
        animation.repeatCount = MAXFLOAT
        
        return animation;
    }
    
    
    func buttonTitle(_ state: UIControl.State) -> NSAttributedString? {
        var text: String?
        var font: UIFont?
        var textColor: UIColor?
        
        switch app {
        case .Airbnb:
            text = "Start Browsing";
            font = UIFont.boldSystemFont(ofSize: 16)
            textColor = UIColor(hexColor: state == .normal ? "05adff" : "6bceff" )
            
        case .Camera:
            text = "Continue";
            font = UIFont.boldSystemFont(ofSize: 17)
            textColor = UIColor(hexColor: state == .normal ? "007ee5" : "48a1ea")
            
        case .Dropbox:
            text = "Learn more";
            font = UIFont.systemFont(ofSize: 15)
            textColor = UIColor(hexColor: state == .normal ? "007ee5" : "48a1ea")
            
        case .Foursquare:
            text = "Add friends to get started!";
            font = UIFont.boldSystemFont(ofSize: 14)
            textColor = UIColor(hexColor: state == .normal ? "00aeef" : "ffffff")
            
        case .iCloud:
            text = "Create New Stream";
            font = UIFont.systemFont(ofSize: 14)
            textColor = UIColor(hexColor: state == .normal ? "999999" : "ebebeb")
            
        case .Kickstarter:
            text = "Discover projects";
            font = UIFont.boldSystemFont(ofSize: 14)
            textColor = UIColor.white
            
        case .WWDC:
            text = "Sign In";
            font = UIFont.systemFont(ofSize: 16)
            textColor = UIColor(hexColor: state == .normal ? "fc6246" : "fdbbb2")
            
        default:
            break
        }
        if text == nil {
            return nil
        }
        var attributes: [NSAttributedString.Key: Any] = [:]
        if font != nil {
            attributes[NSAttributedString.Key.font] = font!
        }
        if textColor != nil {
            attributes[NSAttributedString.Key.foregroundColor] = textColor
        }
        return NSAttributedString.init(string: text!, attributes: attributes)
    }
    
    func buttonBackgroundImage(_ state: UIControl.State) -> UIImage? {
        var imageName = "button_background_\(app.display_name!)".lowercased()
        
        if state == .normal {
            imageName = imageName + "_normal"
        }
        if state == .highlighted {
            imageName = imageName + "_highlight"
        }
        
        var capInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        var rectInsets = UIEdgeInsets.zero
        
        switch app {
        case .Foursquare:
            capInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
            rectInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        case .iCloud:
            rectInsets = UIEdgeInsets(top: -19, left: -61, bottom: -19, right: -61)
        case .Kickstarter:
            capInsets = UIEdgeInsets(top: 22, left: 22, bottom: 22, right: 22)
            rectInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: -20)
        default:
            break;
        }
        
        let image = UIImage.init(named: imageName)
        
        return image?.resizableImage(withCapInsets: capInsets, resizingMode: .stretch).withAlignmentRectInsets(rectInsets)
    }
    
    var backgroundColor: UIColor? {
        switch app {
        case .Airbnb:     return UIColor.white
        case .Dropbox:    return UIColor(hexColor: "f0f3f5")
        case .Facebook:   return UIColor(hexColor: "eceef7")
        case .Fancy:      return UIColor(hexColor: "f0f0f0")
        case .Foursquare: return UIColor(hexColor: "fcfcfa")
        case .Instagram:  return UIColor.white
        case .Kickstarter:return UIColor(hexColor: "f7fafa")
        case .Path:       return UIColor(hexColor: "726d67")
        case .Pinterest:  return UIColor(hexColor: "e1e1e1")
        case .Slack:      return UIColor.white
        case .Tumblr:     return UIColor(hexColor: "34465c")
        case .Twitter:    return UIColor(hexColor: "f5f8fa")
        case .Vesper:     return UIColor(hexColor: "f8f8f8")
        case .Videos:     return UIColor.white
        case .Whatsapp:   return UIColor(hexColor: "f2f2f2")
        default:          return nil
        }
    }
    
    var verticalOffset: CGFloat {
        switch app  {
        case .Kickstarter:
            var offset = UIApplication.shared.statusBarFrame.height
            offset += (controller.navigationController?.navigationBar.frame.height)!
            return -offset
        case .Twitter:
            return -(CGFloat)(roundf(Float(controller.tableView.frame.height/2.5)))
        default:
            return 0
        }
    }
    
    var spaceHeight: CGFloat {
        switch app {
        case .Airbnb:         return 24.0
        case .AppStore:       return 34.0
        case .Facebook:       return 30.0
        case .Fancy:          return 1.0
        case .Foursquare:     return 9.0
        case .Instagram:      return 24.0
        case .iTunesConnect:  return 9.0
        case .Kickstarter:    return 15.0
        case .Path:           return 1.0
        case .Podcasts:       return 35.0
        case .Tumblr:         return 10.0
        case .Twitter:        return 0.1
        case .Vesper:         return 22.0
        case .Videos:         return 0.1
        case .Vine:           return 0.1
        case .WWDC:           return 18.0
        default:              return 0.0
        }
    }
    
}

extension Configuration {
    // Configuration NavigationBar
    func configureNavigationBar() {
        var barColor: UIColor? = nil
        var tintColor: UIColor? = nil
        
        self.controller.navigationController?.navigationBar.titleTextAttributes = nil
        
        switch app {
        case .Airbnb:
            barColor = UIColor(hexColor: "f8f8f8")
            tintColor = UIColor(hexColor: "08aeff")
        case .Camera:
            barColor = UIColor(hexColor: "595959")
            tintColor = UIColor.white
            self.controller.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor!]
        case .Dropbox:
            barColor = UIColor.white
            tintColor = UIColor(hexColor: "007ee5")
        case .Facebook:
            barColor = UIColor(hexColor: "506da8")
            tintColor = UIColor.white
        case .Fancy:
            barColor = UIColor(hexColor: "353b49")
            tintColor = UIColor(hexColor: "c4c7cb")
        case .Foursquare:
            barColor = UIColor(hexColor: "00aeef")
            tintColor = UIColor.white
        case .Instagram:
            barColor = UIColor(hexColor: "2e5e86")
            tintColor = UIColor.white
        case .Kickstarter:
            barColor = UIColor(hexColor: "f7f8f8")
            tintColor = UIColor(hexColor: "2bde73")
        case .Path:
            barColor = UIColor(hexColor: "544f49")
            tintColor = UIColor(hexColor: "fffff2")
        case .Pinterest:
            barColor = UIColor(hexColor: "f4f4f4")
            tintColor = UIColor(hexColor: "cb2027")
        case .Slack:
            barColor = UIColor(hexColor: "f4f5f6")
            tintColor = UIColor(hexColor: "3eba92")
        case .Skype:
            barColor = UIColor(hexColor: "00aff0")
            tintColor = UIColor.white
        case .Tumblr:
            barColor = UIColor(hexColor: "2e3e53")
            tintColor = UIColor.white
        case .Twitter:
            barColor = UIColor(hexColor: "58aef0")
            tintColor = UIColor.white
        case .Vesper:
            barColor = UIColor(hexColor: "5e7d9a")
            tintColor = UIColor(hexColor: "f8f8f8")
        case .Videos:
            barColor = UIColor(hexColor: "4a4b4d")
            tintColor = UIColor.black
        case .Vine:
            barColor = UIColor(hexColor: "00bf8f")
            tintColor = UIColor.white
        case .WWDC:
            tintColor = UIColor(hexColor: "fc6246")
        default:
            barColor = UIColor(hexColor: "f8f8f8")
            tintColor = UIApplication.shared.keyWindow?.tintColor
        }
        
        if let logo = UIImage.init(named: "logo_" + app.display_name!.lowercased()) {
            self.controller.navigationItem.titleView = UIImageView.init(image: logo)
        } else {
            self.controller.navigationItem.titleView = nil
            self.controller.navigationItem.title = self.app.display_name
        }
        
        self.controller.navigationController?.navigationBar.barTintColor = barColor
        self.controller.navigationController?.navigationBar.tintColor = tintColor
    }
    
    func configureStatusBar() {
        switch app {
        case .Camera, .Facebook, .Fancy, .Foursquare, .Instagram, .Path, .Skype, .Tumblr, .Twitter, .Vesper, .Vine:
            UIApplication.shared.statusBarStyle = .lightContent
        default:
            UIApplication.shared.statusBarStyle = .default
        }
    }
}
