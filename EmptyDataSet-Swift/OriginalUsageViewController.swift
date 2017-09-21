//
//  DetailViewController.swift
//  EmptyDataSet-Swift
//
//  Created by YZF on 29/6/17.
//  Copyright © 2017年 Xiaoye. All rights reserved.
//

import UIKit

enum ApplicationType: String {
     case Airbnb, AppStore, Camera, Dropbox, Facebook, Fancy, Foursquare, iCloud, Instagram, iTunesConnect, Kickstarter, Path, Pinterest, Photos, Podcasts, Remote, Safari, Skype, Slack, Tumblr, Twitter, Videos, Vesper, Vine, Whatsapp, WWDC
}

class OriginalUsageViewController: UITableViewController, EmptyDataSetSource, EmptyDataSetDelegate {

    let application: [String: String]
    var isLoading = false {
        didSet {
            tableView.reloadEmptyDataSet()
        }
    }
    
    init(_ application: [String: String]) {
        self.application = application
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = application["display_name"]
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
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
        var text: String?
        var font: UIFont?
        var textColor: UIColor?
        
        switch ApplicationType(rawValue: application["display_name"]!)! {
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
        var attributes: [NSAttributedStringKey: Any] = [:]
        if font != nil {
            attributes[NSAttributedStringKey.font] = font!
        }
        if textColor != nil {
            attributes[NSAttributedStringKey.foregroundColor] = textColor
        }
        return NSAttributedString.init(string: text!, attributes: attributes)
    }
    
    
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        var text: String?
        var font: UIFont?
        var textColor: UIColor?
        
        switch ApplicationType(rawValue: application["display_name"]!)! {
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
        var attributes: [NSAttributedStringKey: Any] = [:]
        if font != nil {
            attributes[NSAttributedStringKey.font] = font!
        }
        if textColor != nil {
            attributes[NSAttributedStringKey.foregroundColor] = textColor
        }
        return NSAttributedString.init(string: text!, attributes: attributes)
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        if isLoading {
            return UIImage.init(named: "loading_imgBlue_78x78")
        } else {
            let imageNamed = ("placeholder_" + application["display_name"]!).lowercased().replacingOccurrences(of: " ", with: "_")
            return UIImage.init(named: imageNamed)
        }
    }
    
    func imageAnimation(forEmptyDataSet scrollView: UIScrollView) -> CAAnimation? {
        let animation = CABasicAnimation.init(keyPath: "transform")
        animation.fromValue = NSValue.init(caTransform3D: CATransform3DIdentity)
        animation.toValue = NSValue.init(caTransform3D: CATransform3DMakeRotation(.pi/2, 0.0, 0.0, 1.0))
        animation.duration = 0.25
        animation.isCumulative = true
        animation.repeatCount = MAXFLOAT
        
        return animation;
    }
    
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControlState) -> NSAttributedString? {
        var text: String?
        var font: UIFont?
        var textColor: UIColor?
        
        switch ApplicationType(rawValue: application["display_name"]!)! {
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
        var attributes: [NSAttributedStringKey: Any] = [:]
        if font != nil {
            attributes[NSAttributedStringKey.font] = font!
        }
        if textColor != nil {
            attributes[NSAttributedStringKey.foregroundColor] = textColor
        }
        return NSAttributedString.init(string: text!, attributes: attributes)
    }
    
    func buttonBackgroundImage(forEmptyDataSet scrollView: UIScrollView, for state: UIControlState) -> UIImage? {
        var imageName = "button_background_\(application["display_name"]!)".lowercased()
        
        if state == .normal {
            imageName = imageName + "_normal"
        }
        if state == .highlighted {
            imageName = imageName + "_highlight"
        }
        
        var capInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        var rectInsets = UIEdgeInsets.zero
        
        switch ApplicationType(rawValue: application["display_name"]!)! {
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
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor? {
        switch ApplicationType(rawValue: application["display_name"]!)! {
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
    
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
        switch ApplicationType(rawValue: application["display_name"]!)!  {
        case .Kickstarter:
            var offset = UIApplication.shared.statusBarFrame.height
            offset += (navigationController?.navigationBar.frame.height)!
            return -offset
        case .Twitter:
            return -(CGFloat)(roundf(Float(tableView.frame.height/2.5)))
        default:
            return 0
        }
    }
    
    func spaceHeight(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
        switch ApplicationType(rawValue: application["display_name"]!)! {
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
