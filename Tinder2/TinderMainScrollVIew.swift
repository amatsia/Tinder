//
//  Userprofile.swift
//  FakeTinder
//
//  Created by Hyperactive6 on 09/05/2017.
//  Copyright © 2017 Amatsia Rosenberg. All rights reserved.
//

import UIKit

class MainScrollView: UIViewController,  UIGestureRecognizerDelegate, UIScrollViewDelegate {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    var whiteBackground = UIView()
    let leftCircle = UIImageView(image: #imageLiteral(resourceName: "CircleInner"))
    let rightCircle = UIImageView(image: #imageLiteral(resourceName: "CircleInner"))
    let centerCircle = UIImageView(image: #imageLiteral(resourceName: "CircleInner"))
    var menu = UIView()
    var menuBar = UIView()
    var previousPage:Int = 1
    let angle:CGFloat = CGFloat(M_PI/2)
    var radius:CGFloat = 0.0
    var circleX:CGFloat = 0.0
    var circleY:CGFloat = 0.0
    let nameLabel = UILabel()
    let settingsButton = UIButton()
    let tinderPlusButton = UIButton()
    let screenSize: CGRect = UIScreen.main.bounds
    var subViewsDict: [String:Any] = [:]
    var viewsDict: [String:Any] = [:]
    var isPeopleAraundYouWasLast = false
    let slideWithFriendsView = UIView()
    let peopleAroundLoadingView = UIView()
    var slideView = UIView()
    var likeLabel = UILabel()
    var nopeLabel = UILabel()
    var superLikeLabel = UILabel()
    let superLikeStampView = UIImageView()
    var xFromCenter = CGFloat()
    var yFromCenter = CGFloat()
    var card = UIView()
    var sCard1 = UIView()
    var sCard2 = UIView()
    var slidingCard2 = UIView()
    var isslidingCard1First = true
    var localWomansArray:[UIImage] = []
    var localMansArray:[UIImage] = []
    var localWomansAndMansArray:[UIImage] = []
    var matesArray:[UIImage] = []
    var currentSuggestion = 0
    var cardCenter = CGPoint(x: UIScreen.main.bounds.width/2, y: (UIScreen.main.bounds.height/2)-8)
    let detailsScrollView = UIScrollView()
    let detailsImageScrollView = UIScrollView()
    var currentArray:NSArray = []
    let imageContentView = UIView()
    let detailsContentView = UIView()
    var location = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        // ScrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = .darkGray
        view.addSubview(scrollView)
        let scrollViewHeightConstraint = NSLayoutConstraint.init(item: scrollView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.height)
        scrollViewHeightConstraint.identifier = "scrollViewHeight"
        let scrollViewWidthConstraint = NSLayoutConstraint.init(item: scrollView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.width)
        scrollViewWidthConstraint.identifier = "scrollViewWidth"
        view.addConstraints([scrollViewHeightConstraint,scrollViewWidthConstraint])
        
        // Content view
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .green
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.bounds.size
        
        let contentViewHeightConstraint = NSLayoutConstraint.init(item: contentView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.height)
        contentViewHeightConstraint.identifier = "contentViewHeight"
        let contentViewWidthConstraint = NSLayoutConstraint.init(item: contentView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 3*screenSize.width)
        contentViewWidthConstraint.identifier = "contentViewWidth"
        let contentViewLeadingConstraint = NSLayoutConstraint.init(item: contentView, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1, constant: 0)
        contentViewLeadingConstraint.identifier = "contentViewLeading"
        scrollView.addConstraints([contentViewHeightConstraint,contentViewWidthConstraint,contentViewLeadingConstraint])
        
        // MARK: - Menu bar
        menuBar = menuBarPrepare()
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuBar)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":menuBar]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0(40)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":menuBar]))

        // MARK: - User profile
        let userProfile = userProfilePagePrepare()
        userProfile.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(userProfile)
        
        let userProfileHeightConstraint = NSLayoutConstraint.init(item: userProfile, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1, constant: 0)
        userProfileHeightConstraint.identifier = "userProfileHeight"
        let userProfileWidthConstraint = NSLayoutConstraint.init(item: userProfile, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1/3, constant: 0)
        userProfileWidthConstraint.identifier = "userProfileWidth"
        let userProfileLeadingConstraint = NSLayoutConstraint.init(item: userProfile, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 0)
        userProfileLeadingConstraint.identifier = "userProfileLeading"
        contentView.addConstraints([userProfileHeightConstraint,userProfileWidthConstraint,userProfileLeadingConstraint])

        // MARK: - Slide view
        slideViewPagePrepare()
        
        // MARK: - Matches View
        let matchesView = matchesViewPagePrepare()
        matchesView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(matchesView)
        contentView.addConstraint(NSLayoutConstraint.init(item: matchesView, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint.init(item: matchesView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1/3, constant: 0))
        contentView.addConstraint(NSLayoutConstraint.init(item: matchesView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: screenSize.width*2))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.size.width, y: 0), animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.bounds.width*3, height: view.bounds.height)
    }
    
    //MARK: - Menu Bar - Page prepare
    func menuBarPrepare() -> UIView {
        let menu = UIView()
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.contentMode = .scaleAspectFill
        menu.layer.contents = #imageLiteral(resourceName: "MenuBar2").cgImage
        menu.layer.masksToBounds = true
        menu.layer.borderColor = UIColor.lightGray.cgColor
        menu.layer.borderWidth = 1
        
        // Menu Bar left button
        let mbLeftButton = UIButton()
        mbLeftButton.translatesAutoresizingMaskIntoConstraints = false
        mbLeftButton.backgroundColor = UIColor.clear
        mbLeftButton.addTarget(self, action: #selector(menuBarLeftButtonPressed), for: .touchUpInside)
        menu.addSubview(mbLeftButton)
        
        // Menu Bar center-left button
        let mbCenterLeftButton = UIButton()
        mbCenterLeftButton.translatesAutoresizingMaskIntoConstraints = false
        mbCenterLeftButton.backgroundColor = UIColor.clear
        mbCenterLeftButton.addTarget(self, action: #selector(menuBarCenterLeftButtonPressed), for: .touchUpInside)
        menu.addSubview(mbCenterLeftButton)
        
        // Menu Bar center-Right button
        let mbCenterRightButton = UIButton()
        mbCenterRightButton.translatesAutoresizingMaskIntoConstraints = false
        mbCenterRightButton.backgroundColor = UIColor.clear
        mbCenterRightButton.addTarget(self, action: #selector(menuBarCenterRightButtonPressed), for: .touchUpInside)
        menu.addSubview(mbCenterRightButton)
        
        // Menu Bar Right button
        let mbRightButton = UIButton()
        mbRightButton.translatesAutoresizingMaskIntoConstraints = false
        mbRightButton.backgroundColor = UIColor.clear
        mbRightButton.addTarget(self, action: #selector(menuBarRightButtonPressed), for: .touchUpInside)
        menu.addSubview(mbRightButton)
        
        // Constraints for menu bar buttons
        // Horizontal - Left button
        let elButtonLeadingConstraint = NSLayoutConstraint(item: mbLeftButton, attribute: .leading, relatedBy: .equal, toItem: menu, attribute: .leading, multiplier: 1, constant: 20)
        elButtonLeadingConstraint.identifier = "elButtonLeading"
        let elButtonWidthConstraint = NSLayoutConstraint(item: mbLeftButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        elButtonWidthConstraint.identifier = "elButtonWidth"
        // Horizontal - Center-left button
        let clButtonTrailingConstraint = NSLayoutConstraint(item: mbCenterLeftButton, attribute: .trailing, relatedBy: .equal, toItem: menu, attribute: .centerX, multiplier: 1, constant: 0)
        clButtonTrailingConstraint.identifier = "clButtonTrailing"
        let clButtonWidthConstraint = NSLayoutConstraint(item: mbCenterLeftButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 65)
        clButtonWidthConstraint.identifier = "clButtonWidth"
        // Horizontal - Center-right button
        let crButtonLeadingConstraint = NSLayoutConstraint(item: mbCenterRightButton, attribute: .leading, relatedBy: .equal, toItem: menu, attribute: .centerX, multiplier: 1, constant: 0)
        crButtonLeadingConstraint.identifier = "crButtonLeading"
        let crButtonWidthConstraint = NSLayoutConstraint(item: mbCenterRightButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 65)
        crButtonWidthConstraint.identifier = "crButtonWidth"
        // Horizontal - Right button
        let erButtonTrailingConstraint = NSLayoutConstraint(item: mbRightButton, attribute: .trailing, relatedBy: .equal, toItem: menu, attribute: .trailing, multiplier: 1, constant: -20)
        erButtonTrailingConstraint.identifier = "erButtonTrailing"
        let erButtonWidthConstraint = NSLayoutConstraint(item: mbRightButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        erButtonWidthConstraint.identifier = "erButtonWidth"
        
        menu.addConstraints([elButtonLeadingConstraint,elButtonWidthConstraint,clButtonTrailingConstraint,clButtonWidthConstraint,crButtonLeadingConstraint,crButtonWidthConstraint,erButtonTrailingConstraint,erButtonWidthConstraint])
        
        
        // top
        menu.addConstraint(NSLayoutConstraint(item: mbLeftButton, attribute: .top, relatedBy: .equal, toItem: menu, attribute: .top, multiplier: 1, constant: 0))
        menu.addConstraint(NSLayoutConstraint(item: mbCenterLeftButton, attribute: .top, relatedBy: .equal, toItem: menu, attribute: .top, multiplier: 1, constant: 0))
        menu.addConstraint(NSLayoutConstraint(item: mbCenterRightButton, attribute: .top, relatedBy: .equal, toItem: menu, attribute: .top, multiplier: 1, constant: 0))
        menu.addConstraint(NSLayoutConstraint(item: mbRightButton, attribute: .top, relatedBy: .equal, toItem: menu, attribute: .top, multiplier: 1, constant: 0))
        // height
        menu.addConstraint(NSLayoutConstraint(item: mbLeftButton, attribute: .height, relatedBy: .equal, toItem: menu, attribute: .height, multiplier: 1, constant: 0))
        menu.addConstraint(NSLayoutConstraint(item: mbCenterLeftButton, attribute: .height, relatedBy: .equal, toItem: menu, attribute: .height, multiplier: 1, constant: 0))
        menu.addConstraint(NSLayoutConstraint(item: mbCenterRightButton, attribute: .height, relatedBy: .equal, toItem: menu, attribute: .height, multiplier: 1, constant: 0))
        menu.addConstraint(NSLayoutConstraint(item: mbRightButton, attribute: .height, relatedBy: .equal, toItem: menu, attribute: .height, multiplier: 1, constant: 0))
        // Center
        menu.addConstraint(NSLayoutConstraint(item: mbCenterRightButton, attribute: .left, relatedBy: .equal, toItem: menu, attribute: .centerX, multiplier: 1, constant: 0))
        return menu
    }
    
    // MARK: -  Manu bar buttons press functions
    
    func menuBarLeftButtonPressed() -> Void {
        print("Menu bar left button pressed")
        nameLabel.text = userName
        UIView.animate(withDuration: 0.02, delay: 0, options: [], animations: {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        }, completion: nil)
        for view in slideView.subviews {
            view.removeFromSuperview()
        }
        if isPeopleAraundYouWasLast {
            menuBar.layer.contents =  #imageLiteral(resourceName: "MenuBar1").cgImage
        }
        else {
            menuBar.layer.contents = #imageLiteral(resourceName: "MenuBar1Left").cgImage
        }
    }
    
    func menuBarCenterLeftButtonPressed() -> Void {
        print("Menu bar center-left button pressed")
        isPeopleAraundYouWasLast = false
        menuBar.layer.contents = #imageLiteral(resourceName: "MenuBar2").cgImage
        reduce1FromCurrent()
        slideViewPagePrepare()
        UIView.animate(withDuration: 0.02, delay: 0, options: [], animations: {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.size.width, y: 0), animated: false)
        }, completion: nil)
    }
    
    func menuBarCenterRightButtonPressed() -> Void {
        print("Menu bar center-right button pressed")
        isPeopleAraundYouWasLast = true
        menuBar.layer.contents = #imageLiteral(resourceName: "MenuBar3").cgImage
        slideWithFriendsView.removeFromSuperview()
        slideWithFriendsPagePrepare()
        UIView.animate(withDuration: 0.02, delay: 0, options: [], animations: {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.size.width, y: 0), animated: false)
        }, completion: nil)
        for view in slideView.subviews {
            view.removeFromSuperview()
        }
    }
    
    func menuBarRightButtonPressed() -> Void {
        print("Menu bar right button pressed")
        UIView.animate(withDuration: 0.02, delay: 0, options: [], animations: {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.size.width*2, y: 0), animated: false)
        }, completion: nil)
        for view in slideView.subviews {
            view.removeFromSuperview()
        }
        if isPeopleAraundYouWasLast {
            menuBar.layer.contents = #imageLiteral(resourceName: "MenuBar4 ").cgImage
        }
        else {
            menuBar.layer.contents = #imageLiteral(resourceName: "MenuBar4Left").cgImage
        }
    }
    
    //MARK: - User profile view - Page prepare
    func userProfilePagePrepare() -> UIView {
        let profile = UIView()
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.backgroundColor = UIColor.lightGray
        
        //Round white background
        whiteBackground.translatesAutoresizingMaskIntoConstraints = false
        whiteBackground.backgroundColor = UIColor.white
        whiteBackground.layer.cornerRadius = screenSize.width
        whiteBackground.layer.borderColor = UIColor.darkGray.cgColor
        whiteBackground.layer.borderWidth = 2
        profile.addSubview(whiteBackground)
        profile.addConstraint(NSLayoutConstraint.init(item: whiteBackground, attribute: .height, relatedBy: .equal, toItem: profile, attribute: .width, multiplier: 2, constant: 0))
        profile.addConstraint(NSLayoutConstraint.init(item: whiteBackground, attribute: .width, relatedBy: .equal, toItem: profile, attribute: .width, multiplier: 2, constant: 0))
        profile.addConstraint(NSLayoutConstraint.init(item: whiteBackground, attribute: .centerY, relatedBy: .equal, toItem: profile, attribute: .top, multiplier: 1, constant: 0))
        profile.addConstraint(NSLayoutConstraint.init(item: whiteBackground, attribute: .centerX, relatedBy: .equal, toItem: profile, attribute: .centerX, multiplier: 1, constant: 0))
        
        // User profile image
        userProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        userProfileImageView.layer.cornerRadius = 40
        userProfileImageView.layer.masksToBounds = true
        profile.addSubview(userProfileImageView)
        let halfRadius = screenSize.width/2
        let userProfileImageLeadingConstraint = NSLayoutConstraint(item: userProfileImageView, attribute: .leading, relatedBy: .equal, toItem: profile, attribute: .leading, multiplier: 1, constant: (screenSize.width-80)/2)
        userProfileImageLeadingConstraint.identifier = "userProfileImageLeading"
        let userProfileImageWidthConstraint = NSLayoutConstraint(item: userProfileImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80)
        userProfileImageWidthConstraint.identifier = "userProfileImageWidth"
        let userProfileImageTopConstraint = NSLayoutConstraint(item: userProfileImageView, attribute: .top, relatedBy: .equal, toItem: profile, attribute: .top, multiplier: 1, constant: (halfRadius-40)*0.85)
        userProfileImageTopConstraint.identifier = "userProfileImageTop"
        let userProfileImageHeightConstraint = NSLayoutConstraint(item: userProfileImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80)
        userProfileImageHeightConstraint.identifier = "userProfileImageHeight"
        profile.addConstraints([userProfileImageLeadingConstraint,userProfileImageWidthConstraint,userProfileImageTopConstraint,userProfileImageHeightConstraint])
        
        // User profile name label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.backgroundColor = UIColor.white
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .center
        nameLabel.text = userName
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        profile.addSubview(nameLabel)
        profile.addConstraint(NSLayoutConstraint.init(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: profile, attribute: .centerX, multiplier: 1, constant: 0))
        profile.addConstraint(NSLayoutConstraint.init(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: userProfileImageView, attribute: .bottom, multiplier: 1, constant: halfRadius/20))
        
        // 3 User icon circles
        // left circle
        leftCircle.layer.cornerRadius = 30
        leftCircle.layer.masksToBounds = true
        leftCircle.layer.borderColor = UIColor.darkGray.cgColor
        leftCircle.layer.borderWidth = 2
        profile.addSubview(leftCircle)
        let leftAngle:CGFloat = angle*1.2
        radius = view.frame.width
        circleX = radius * cos(leftAngle) + view.center.x - 30
        circleY = radius * sin(leftAngle) + 0.0 - 30
        leftCircle.frame = CGRect(x: circleX, y: circleY, width: 60, height: 60)
        
        // center circle
        centerCircle.layer.cornerRadius = 30
        centerCircle.layer.masksToBounds = true
        centerCircle.layer.borderColor = UIColor.darkGray.cgColor
        centerCircle.layer.borderWidth = 2
        profile.addSubview(centerCircle)
        radius = view.frame.width
        circleX = radius * cos(angle) + view.center.x - 30
        circleY = radius * sin(angle) + 0.0 - 30
        centerCircle.frame = CGRect(x: circleX, y: circleY, width: 60, height: 60)
        
        // right circle
        rightCircle.layer.cornerRadius = 30
        rightCircle.layer.masksToBounds = true
        rightCircle.layer.borderColor = UIColor.darkGray.cgColor
        rightCircle.layer.borderWidth = 2
        profile.addSubview(rightCircle)
        let rightAngle:CGFloat = angle*0.8
        radius = view.frame.width
        circleX = radius * cos(rightAngle) + view.center.x - 30
        circleY = radius * sin(rightAngle) + 0.0 - 30
        rightCircle.frame = CGRect(x: circleX, y: circleY, width: 60, height: 60)
        
        // Settings Button
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.backgroundColor = UIColor.white
        settingsButton.setTitle("הגדרות", for: .normal) // Change - add chain weel icon
        settingsButton.setTitleColor(UIColor.red, for: .normal)
        settingsButton.contentHorizontalAlignment = .center
        settingsButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        settingsButton.addTarget(self, action: #selector(settingButtonPressed), for: .touchUpInside)
        profile.addSubview(settingsButton)
        profile.addConstraint(NSLayoutConstraint.init(item: settingsButton, attribute: .left, relatedBy: .equal, toItem: profile, attribute: .centerX, multiplier: 1, constant: 0))
        profile.addConstraint(NSLayoutConstraint.init(item: settingsButton, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: halfRadius/20))
        profile.addConstraint(NSLayoutConstraint.init(item: settingsButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.width/2))
        
        // Tinder Plus button
        tinderPlusButton.translatesAutoresizingMaskIntoConstraints = false
        tinderPlusButton.backgroundColor = UIColor.white
        tinderPlusButton.setTitle("קבל/י טינדר פלוס", for: .normal) // Change - add icon
        tinderPlusButton.setTitleColor(UIColor.red, for: .normal)
        tinderPlusButton.contentHorizontalAlignment = .center
        tinderPlusButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        tinderPlusButton.addTarget(self, action: #selector(tinderPlusButtonPressed), for: .touchUpInside)
        profile.addSubview(tinderPlusButton)
        profile.addConstraint(NSLayoutConstraint.init(item: tinderPlusButton, attribute: .right, relatedBy: .equal, toItem: profile, attribute: .centerX, multiplier: 1, constant: 0))
        profile.addConstraint(NSLayoutConstraint.init(item: tinderPlusButton, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: halfRadius/20))
        profile.addConstraint(NSLayoutConstraint.init(item: tinderPlusButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.width/2))
        
        // Buttom label 1
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = UIColor.lightGray
        label1.textColor = UIColor.black
        label1.textAlignment = .center
        label1.text = "להחליק עם חברים"  // Change
        label1.font = UIFont.systemFont(ofSize: 20)
        profile.addSubview(label1)
        profile.addConstraint(NSLayoutConstraint.init(item: label1, attribute: .centerX, relatedBy: .equal, toItem: profile, attribute: .centerX, multiplier: 1, constant: 0))
        profile.addConstraint(NSLayoutConstraint.init(item: label1, attribute: .top, relatedBy: .equal, toItem: userProfileImageView, attribute: .bottom, multiplier: 1, constant: halfRadius*1.2))
        
        // Buttom label 2
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = UIColor.lightGray
        label2.textColor = UIColor.black
        label2.textAlignment = .center
        label2.text = "התאמה עם קבוצות של חברים בסביבה"  // Change
        label2.font = UIFont.systemFont(ofSize: 15)
        profile.addSubview(label2)
        profile.addConstraint(NSLayoutConstraint.init(item: label2, attribute: .centerX, relatedBy: .equal, toItem: profile, attribute: .centerX, multiplier: 1, constant: 0))
        profile.addConstraint(NSLayoutConstraint.init(item: label2, attribute: .top, relatedBy: .equal, toItem: label1, attribute: .bottom, multiplier: 1, constant: 10))
        
        // Create group button
        let createGroupeButton = UIButton()
        createGroupeButton.translatesAutoresizingMaskIntoConstraints = false
        createGroupeButton.backgroundColor = UIColor.red
        createGroupeButton.setTitle("יצירת קבוצה משלך", for: .normal)
        createGroupeButton.setTitleColor(UIColor.white, for: .normal)
        createGroupeButton.contentHorizontalAlignment = .center
        createGroupeButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        createGroupeButton.layer.cornerRadius = 15
        createGroupeButton.addTarget(self, action: #selector(createGroupeButtonPressed), for: .touchUpInside)
        profile.addSubview(createGroupeButton)
        profile.addConstraint(NSLayoutConstraint.init(item: createGroupeButton, attribute: .centerX, relatedBy: .equal, toItem: profile, attribute: .centerX, multiplier: 1, constant: 0))
        profile.addConstraint(NSLayoutConstraint.init(item: createGroupeButton, attribute: .top, relatedBy: .equal, toItem: label2, attribute: .bottom, multiplier: 1, constant: 20))
        profile.addConstraint(NSLayoutConstraint.init(item: createGroupeButton, attribute: .width, relatedBy: .equal, toItem: profile, attribute: .width, multiplier: 0.5, constant: 0))
        profile.addConstraint(NSLayoutConstraint.init(item: createGroupeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30))
        return profile
    }
    
    // MARK: - User profile buttons press functions
    
    func createGroupeButtonPressed() -> Void {
        print("Create Groupe button pressed")
    }
    func settingButtonPressed() -> Void {
        print("Setting button pressed")
        let settingVC = Settings()
        present(settingVC, animated: false, completion: nil)
    }
    func tinderPlusButtonPressed() -> Void {
        print("Tinder plus button pressed")
    }
    
    func backButtonPressed() -> Void {
        print("Main ScrollView - Back button pressed")
        let mainVC = ScrollViewController()
        present(mainVC, animated: false, completion: nil)
    }
    
    // MARK: - Slide view - page prepare
    
    func slideViewPagePrepare() -> Void {
        slideView.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
        updateGender()
        likeLabel = setLikeLabel()
        likeLabel.alpha = 0
        nopeLabel = setNopeLabel()
        nopeLabel.alpha = 0
        superLikeLabel = setSuperLikeLabel()
        superLikeLabel.alpha = 0
        
        if isslidingCard1First {
            sCard1 = slideCardPrepare()
            sCard1.addSubview(likeLabel)
            sCard1.addSubview(nopeLabel)
            sCard1.addSubview(superLikeLabel)
            add1ToCurrent()
            sCard2 = slideCardPrepare()
            slideView.sendSubview(toBack: sCard2)
            addGestureRecToCard(sCard: &sCard1)
        } else {
            sCard2 = slideCardPrepare()
            sCard2.addSubview(likeLabel)
            sCard2.addSubview(nopeLabel)
            sCard2.addSubview(superLikeLabel)
            add1ToCurrent()
            sCard1 = slideCardPrepare()
            slideView.sendSubview(toBack: sCard1)
            addGestureRecToCard(sCard: &sCard2)
        }
        
        // Slide view buttom buttons (like, nope, super like etc..)
        buttonsPrepare()
 
        // Slide View setup - Constraints and adding to super view
        slideView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(slideView)
        contentView.addConstraint(NSLayoutConstraint.init(item: slideView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.height))
        contentView.addConstraint(NSLayoutConstraint.init(item: slideView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.width))
        contentView.addConstraint(NSLayoutConstraint.init(item: slideView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: screenSize.width))
        contentView.addConstraint(NSLayoutConstraint.init(item: slideView, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    func addGestureRecToCard (sCard: inout UIView) -> Void {
        let PanGesture = UIPanGestureRecognizer(target: self, action: #selector(slidingCardPanGestureTapped(sender:)))
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(slidingCardTapGestureTapped(sender:)))
        sCard.addGestureRecognizer(PanGesture)
        sCard.addGestureRecognizer(TapGesture)
    }
    
    func slideCardPrepare() -> UIView {
        
        // ContainerView - card
        let sCard = UIView()
        sCard.layer.cornerRadius = 10
        sCard.layer.masksToBounds = true
        sCard.layer.borderColor = UIColor.lightGray.cgColor
        sCard.layer.borderWidth = 2
        sCard.backgroundColor = .white
        sCard.translatesAutoresizingMaskIntoConstraints = false
        slideView.addSubview(sCard)
        let sCardCenterConstraint = NSLayoutConstraint(item: sCard, attribute: .centerX, relatedBy: .equal, toItem: slideView, attribute: .centerX, multiplier: 1, constant: 0)
        sCardCenterConstraint.identifier = "sCardCenterX"
        let sCardWidthConstraint = NSLayoutConstraint(item: sCard, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.width-20)
        sCardWidthConstraint.identifier = "sCardWidth"
        let sCardCenterYConstraint = NSLayoutConstraint(item: sCard, attribute: .centerY, relatedBy: .equal, toItem: slideView, attribute: .centerY, multiplier: 1, constant: -8)
        sCardCenterYConstraint.identifier = "sCardCenterY"
        let sCardHeightConstraint = NSLayoutConstraint(item: sCard, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.height-175)
        sCardHeightConstraint.identifier = "sCardHeight"
        slideView.addConstraints([sCardCenterConstraint,sCardWidthConstraint,sCardCenterYConstraint,sCardHeightConstraint])
        
        // Suggested person image view
        updateGender()
        let suggestedMatesImageView = UIImageView(image: matesArray[currentSuggestion])
        suggestedMatesImageView.frame = CGRect(x: 0, y: 0, width: screenSize.width-20, height: screenSize.height-175)
        suggestedMatesImageView.contentMode = .scaleAspectFill
        sCard.addSubview(suggestedMatesImageView)

        // Suggested mate name and age text label
        let sugName = getDetails(current: currentSuggestion, mansArray: GlobalArrays.mansNames as! [String], womensArrey: GlobalArrays.womensNames as! [String])
        let sugAge = getDetails(current: currentSuggestion, mansArray: GlobalArrays.mansAges as! [String], womensArrey: GlobalArrays.womensAges as! [String])
        let sugWorkPlace = getDetails(current: currentSuggestion, mansArray: GlobalArrays.mansWorkPlace as! [String], womensArrey: GlobalArrays.womensWorkPlace as! [String])
        let sugTextLebel = UILabel(frame: CGRect(x: 15, y: 420, width: 200, height: 60))
        sugTextLebel.lineBreakMode = .byWordWrapping
        sugTextLebel.numberOfLines = 2
        let textLabelString = "\(sugName), \(sugAge)\n\(sugWorkPlace)"
        sugTextLebel.text = textLabelString
        let nameLength = sugName.characters.count
        let range = NSMakeRange(0, nameLength)
        sugTextLebel.attributedText = attributedString(from: textLabelString, BoldRange: range)
        suggestedMatesImageView.addSubview(sugTextLebel)
        sugTextLebel.backgroundColor = .clear
        sugTextLebel.textColor = .white
        return sCard
    }
    
    func attributedString(from string: String, BoldRange: NSRange?) -> NSAttributedString {
        let nonBoldAttribute = [
            NSFontAttributeName: UIFont.systemFont(ofSize: 24),
            NSForegroundColorAttributeName: UIColor.black
        ]
        let boldAttribute = [
            NSFontAttributeName: UIFont.boldSystemFont(ofSize: 26),
            ]
        let attrStr = NSMutableAttributedString(string: string, attributes: nonBoldAttribute)
        if let range = BoldRange {
            attrStr.setAttributes(boldAttribute, range: range)
        }
        return attrStr
    }
    
    func slidingCardPanGestureTapped(sender: UIPanGestureRecognizer) {
        
        // Stamp setting
        card = sender.view!
        xFromCenter = card.center.x - view.center.x
        yFromCenter = card.center.y - view.center.y
        let point = sender.translation(in: view)
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/(view.center.x/0.35))
        if xFromCenter > 0 {
            xFromCenterPositive()
        } else {
            xFromCenterNegative()
        }
        if yFromCenter < 0 {
            yFromCenterNegative()
        }
        if sender.state == UIGestureRecognizerState.ended {
            if card.center.x < 75 {
                UIView.animate(withDuration: 0.02, animations: {
                    self.card.center = CGPoint(x: self.card.center.x - 160, y: self.card.center.y)
                }, completion: { (true) in
                    self.card.removeFromSuperview()
                })
                add1ToCurrent()
                likeLabel.alpha = 0
                nopeLabel.alpha = 0
                superLikeLabel.alpha = 0
                if isslidingCard1First {
                    sCard1 = slideCardPrepare()
                    slideView.bringSubview(toFront: sCard2)
                    sCard2.addSubview(likeLabel)
                    sCard2.addSubview(nopeLabel)
                    sCard2.addSubview(superLikeLabel)
                    addGestureRecToCard(sCard: &sCard2)
                    isslidingCard1First = false
                } else {
                    sCard2 = slideCardPrepare()
                    slideView.bringSubview(toFront: sCard1)
                    sCard1.addSubview(likeLabel)
                    sCard1.addSubview(nopeLabel)
                    sCard1.addSubview(superLikeLabel)
                    addGestureRecToCard(sCard: &sCard1)
                    isslidingCard1First = true
                }
                return
            } else if card.center.x > (view.frame.width-75){
                UIView.animate(withDuration: 0.02, animations: {
                    self.card.center = CGPoint(x: self.card.center.x + 160, y: self.card.center.y)
                }, completion: { (true) in
                    self.card.removeFromSuperview()
                })
                add1ToCurrent()
                likeLabel.alpha = 0
                nopeLabel.alpha = 0
                superLikeLabel.alpha = 0
                if isslidingCard1First {
                    sCard1 = slideCardPrepare()
                    slideView.bringSubview(toFront: sCard2)
                    sCard2.addSubview(likeLabel)
                    sCard2.addSubview(nopeLabel)
                    sCard2.addSubview(superLikeLabel)
                    addGestureRecToCard(sCard: &sCard2)
                    isslidingCard1First = false
                } else {
                    sCard2 = slideCardPrepare()
                    slideView.bringSubview(toFront: sCard1)
                    sCard1.addSubview(likeLabel)
                    sCard1.addSubview(nopeLabel)
                    sCard1.addSubview(superLikeLabel)
                    addGestureRecToCard(sCard: &sCard1)
                    isslidingCard1First = true
                }
                return
            } else if card.center.y < 100 {
                UIView.animate(withDuration: 0.02, animations: {
                    self.card.center = CGPoint(x: self.card.center.x, y: self.card.center.y - 250)
                }, completion: { (true) in
                    self.card.removeFromSuperview()
                })
                add1ToCurrent()
                likeLabel.alpha = 0
                nopeLabel.alpha = 0
                superLikeLabel.alpha = 0
                if isslidingCard1First {
                    sCard1 = slideCardPrepare()
                    slideView.bringSubview(toFront: sCard2)
                    sCard2.addSubview(likeLabel)
                    sCard2.addSubview(nopeLabel)
                    sCard2.addSubview(superLikeLabel)
                    addGestureRecToCard(sCard: &sCard2)
                    isslidingCard1First = false
                } else {
                    sCard2 = slideCardPrepare()
                    slideView.bringSubview(toFront: sCard1)
                    sCard1.addSubview(likeLabel)
                    sCard1.addSubview(nopeLabel)
                    sCard1.addSubview(superLikeLabel)
                    addGestureRecToCard(sCard: &sCard1)
                    isslidingCard1First = true
                }
                return
            }
            UIView.animate(withDuration: 0.05, animations: {
                self.likeLabel.alpha = 0
                self.nopeLabel.alpha = 0
                self.superLikeLabel.alpha = 0
                self.card.center = self.cardCenter
                self.card.transform = CGAffineTransform(rotationAngle: 0)
            })
        }
    }
    
    func slidingCardTapGestureTapped(sender: UITapGestureRecognizer)  {
        print("Tappted")
        detailsScrollView.removeFromSuperview()
        self.detailsViewPrepare()
        detailsImageScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
    }
    
    // MARK: - Details view page prepare
    
    func detailsViewPrepare() -> Void {
        
        // Set details scroll view
        detailsScrollView.translatesAutoresizingMaskIntoConstraints = false
        detailsScrollView.backgroundColor = .white
        detailsScrollView.delegate = self
        detailsScrollView.isScrollEnabled = true
        view.addSubview(detailsScrollView)
        view.addConstraint(NSLayoutConstraint(item: detailsScrollView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailsScrollView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailsScrollView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.width))
        view.addConstraint(NSLayoutConstraint(item: detailsScrollView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0))
        
        // Set details contentView
        detailsContentView.removeFromSuperview()
        detailsContentView.translatesAutoresizingMaskIntoConstraints = false
        detailsContentView.backgroundColor = .white
        detailsScrollView.addSubview(detailsContentView)
        detailsScrollView.addConstraint(NSLayoutConstraint.init(item: detailsContentView, attribute: .top, relatedBy: .equal, toItem: detailsScrollView, attribute: .top, multiplier: 1, constant: 0))
        detailsScrollView.addConstraint(NSLayoutConstraint.init(item: detailsContentView, attribute: .leading, relatedBy: .equal, toItem: detailsScrollView, attribute: .leading, multiplier: 1, constant: 0))
        detailsScrollView.addConstraint(NSLayoutConstraint.init(item: detailsContentView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.width))

        // Set details image scroll view
        detailsImageScrollView.translatesAutoresizingMaskIntoConstraints = false
        detailsImageScrollView.backgroundColor = .darkGray
        detailsImageScrollView.delegate = self
        detailsImageScrollView.isScrollEnabled = true
        detailsImageScrollView.isPagingEnabled = true
        detailsContentView.addSubview(detailsImageScrollView)
        detailsContentView.addConstraint(NSLayoutConstraint(item: detailsImageScrollView, attribute: .top, relatedBy: .equal, toItem: detailsContentView, attribute: .top, multiplier: 1, constant: 0))
        detailsContentView.addConstraint(NSLayoutConstraint(item: detailsImageScrollView, attribute: .leading, relatedBy: .equal, toItem: detailsContentView, attribute: .leading, multiplier: 1, constant: 0))
        detailsContentView.addConstraint(NSLayoutConstraint(item: detailsImageScrollView, attribute: .width, relatedBy: .equal, toItem: detailsContentView, attribute: .width, multiplier: 1, constant: 0))
        detailsContentView.addConstraint(NSLayoutConstraint(item: detailsImageScrollView, attribute: .height, relatedBy: .equal, toItem: detailsImageScrollView, attribute: .height, multiplier: 1, constant: 0))
        
        // Set image contentView
        imageContentView.removeFromSuperview()
        imageContentView.translatesAutoresizingMaskIntoConstraints = false
        imageContentView.backgroundColor = .white
        var current = 0
        if currentSuggestion==0 {
            if Gender.isLookingForMale && Gender.isLookingForFemale {
                current = (GlobalArrays.womensArray.count + GlobalArrays.mansArray.count)-1
                } else if !Gender.isLookingForMale && Gender.isLookingForFemale {
            current = (GlobalArrays.womensArray.count)-1
            } else if Gender.isLookingForMale && !Gender.isLookingForFemale {
            current = (GlobalArrays.mansArray.count)-1
            }
        } else {
            current = currentSuggestion-1
        }
        if Gender.isLookingForMale && Gender.isLookingForFemale {
            if current > GlobalArrays.womensArray.count {
                currentArray = GlobalArrays.mansArray[current-GlobalArrays.womensNames.count] as! NSArray
            } else {
                currentArray = GlobalArrays.womensArray[current] as! NSArray
            }
        } else if !Gender.isLookingForMale && Gender.isLookingForFemale {
            currentArray = GlobalArrays.womensArray[current] as! NSArray
        } else if Gender.isLookingForMale && !Gender.isLookingForFemale {
            currentArray = GlobalArrays.mansArray[current] as! NSArray
        } else if !Gender.isLookingForMale && !Gender.isLookingForFemale {
            currentArray = []
        }
        detailsImageScrollView.addSubview(imageContentView)
        detailsImageScrollView.addConstraint(NSLayoutConstraint.init(item: imageContentView, attribute: .top, relatedBy: .equal, toItem: detailsImageScrollView, attribute: .top, multiplier: 1, constant: 0))
        detailsImageScrollView.addConstraint(NSLayoutConstraint.init(item: imageContentView, attribute: .leading, relatedBy: .equal, toItem: detailsImageScrollView, attribute: .leading, multiplier: 1, constant: 0))
        detailsImageScrollView.addConstraint(NSLayoutConstraint.init(item: imageContentView, attribute: .height, relatedBy: .equal, toItem: detailsImageScrollView, attribute: .height, multiplier: 1, constant: 0))
        detailsImageScrollView.addConstraint(NSLayoutConstraint.init(item: imageContentView, attribute: .width, relatedBy: .equal, toItem: detailsImageScrollView, attribute: .width, multiplier: CGFloat(currentArray.count), constant: 0))
        
        // Set image and imageView
        setImageViewPhotos()
        
        DispatchQueue.main.async {
            self.detailsImageScrollView.contentSize.width = self.screenSize.width*CGFloat(self.currentArray.count)
        }
        
        let textDetailsView = UIView()
        textDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set name and age label
        let details = UIView()
        details.translatesAutoresizingMaskIntoConstraints = false
        details.backgroundColor = .white
        let detailsLabel = UILabel()
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        let name = getDetails(current: current, mansArray: GlobalArrays.mansNames as! [String], womensArrey: GlobalArrays.womensNames as! [String])
        let age = getDetails(current: current, mansArray: GlobalArrays.mansAges as! [String], womensArrey: GlobalArrays.womensAges as! [String])
        detailsLabel.text = "\(name), \(age)"
        detailsLabel.textColor = .black
        detailsLabel.backgroundColor  = .white
        detailsLabel.font = UIFont.systemFont(ofSize: 22)
        detailsLabel.textAlignment = .left
        details.addSubview(detailsLabel)
        let shareImageVIew = UIImageView(image: #imageLiteral(resourceName: "share"))
        shareImageVIew.translatesAutoresizingMaskIntoConstraints = false
        details.addSubview(shareImageVIew)
        details.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[label]-5-[image(60)]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["label":detailsLabel,"image":shareImageVIew]))
        vConstraints(superView: details, subView: "label", dict: ["label":detailsLabel],shoulders:"0")
        vConstraints(superView: details, subView: "image", dict: ["image":shareImageVIew],shoulders:"2")
        
        // Set workPlace label
        let workPlace = UIView()
        workPlace.translatesAutoresizingMaskIntoConstraints = false
        var workPlaceHeight = "0"
        let workPlaceText = getDetails(current: current, mansArray: GlobalArrays.mansWorkPlace as! [String], womensArrey: GlobalArrays.womensWorkPlace as! [String])
        textDetailsView.addSubview(workPlace)
        if workPlaceText != "" {
            workPlace.backgroundColor = .white
            let workPlaceLabel = UILabel()
            workPlaceLabel.translatesAutoresizingMaskIntoConstraints = false
            workPlaceLabel.text = workPlaceText
            workPlaceLabel.textColor = .black
            workPlaceLabel.backgroundColor  = .white
            workPlaceLabel.font = UIFont.systemFont(ofSize: 15)
            workPlaceLabel.textAlignment = .right
            workPlace.addSubview(workPlaceLabel)
            let workImageVIew = UIImageView(image: #imageLiteral(resourceName: "work"))
            workImageVIew.translatesAutoresizingMaskIntoConstraints = false
            workPlace.addSubview(workImageVIew)
            workPlace.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[image(20)]-5-[label]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["label":workPlaceLabel,"image":workImageVIew]))
            vConstraints(superView: workPlace, subView: "image", dict: ["image":workImageVIew],shoulders:"0")
            vConstraints(superView: workPlace, subView: "label", dict: ["label":workPlaceLabel],shoulders:"0")
            workPlaceHeight = "20"
        }
        
        // Set education label
        let education = UIView()
        education.translatesAutoresizingMaskIntoConstraints = false
        var educationHeight = "0"
        let educationText = getDetails(current: current, mansArray: GlobalArrays.mansSchool as! [String], womensArrey: GlobalArrays.womensSchool as! [String])
        textDetailsView.addSubview(education)
        if educationText != "" {
            education.backgroundColor = .white
            let educationLabel = UILabel()
            educationLabel.translatesAutoresizingMaskIntoConstraints = false
            educationLabel.text = educationText
            educationLabel.textColor = .black
            educationLabel.backgroundColor  = .white
            educationLabel.font = UIFont.systemFont(ofSize: 15)
            educationLabel.textAlignment = .right
            education.addSubview(educationLabel)
            let SchoolImageVIew = UIImageView(image: #imageLiteral(resourceName: "school"))
            SchoolImageVIew.translatesAutoresizingMaskIntoConstraints = false
            education.addSubview(SchoolImageVIew)
            education.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[image(20)]-5-[label]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["label":educationLabel,"image":SchoolImageVIew]))
            vConstraints(superView: education, subView: "image", dict: ["image":SchoolImageVIew],shoulders:"0")
            vConstraints(superView: education, subView: "label", dict: ["label":educationLabel],shoulders:"0")
            educationHeight = "20"
        }
        
        // Set distance label
        let distance = UIView()
        distance.translatesAutoresizingMaskIntoConstraints = false
        distance.backgroundColor = .white
        let distanceLabel = UILabel()
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        let text = getDetails(current: current, mansArray: GlobalArrays.mansDist as! [String], womensArrey: GlobalArrays.womensDist as! [String])
        distanceLabel.text = "במרחק \(text) ק״מ"
        distanceLabel.textColor = .black
        distanceLabel.backgroundColor  = .white
        distanceLabel.font = UIFont.systemFont(ofSize: 15)
        distanceLabel.textAlignment = .right
        distance.addSubview(distanceLabel)
        
        let mapImageVIew = UIImageView(image: #imageLiteral(resourceName: "map"))
        mapImageVIew.translatesAutoresizingMaskIntoConstraints = false
        distance.addSubview(mapImageVIew)
        distance.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[image(20)]-5-[label]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["label":distanceLabel,"image":mapImageVIew]))
        
        vConstraints(superView: distance, subView: "image", dict: ["image":mapImageVIew],shoulders:"0")
        vConstraints(superView: distance, subView: "label", dict: ["label":distanceLabel],shoulders:"0")
        
        // Set some more text label
        let additionalText = UILabel()
        additionalText.translatesAutoresizingMaskIntoConstraints = false
        additionalText.text = getDetails(current: current, mansArray: GlobalArrays.mansText as! [String], womensArrey: GlobalArrays.womensText as! [String])
        additionalText.numberOfLines = 0
        additionalText.lineBreakMode = NSLineBreakMode.byWordWrapping
        additionalText.textColor = .black
        additionalText.backgroundColor  = .white
        additionalText.font = UIFont.systemFont(ofSize: 15)
        additionalText.textAlignment = .right
        
        // Set recommend to friends label
        let rec = UILabel()
        rec.translatesAutoresizingMaskIntoConstraints = false
        let name2 = getDetails(current: current, mansArray: GlobalArrays.mansNames as! [String], womensArrey: GlobalArrays.womensNames as! [String])
        rec.text = " להמליץ על\n\(name2) לחברים"
        rec.numberOfLines = 2
        rec.lineBreakMode = NSLineBreakMode.byWordWrapping
        rec.textColor = .red
        rec.backgroundColor  = .white
        rec.font = UIFont.systemFont(ofSize: 15)
        rec.textAlignment = .center
        
        // Border 1
        let border1 = UIView()
        border1.translatesAutoresizingMaskIntoConstraints = false
        border1.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.9)
        // Border 2
        let border2 = UIView()
        border2.translatesAutoresizingMaskIntoConstraints = false
        border2.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.9)
        // Border 3
        let border3 = UIView()
        border3.translatesAutoresizingMaskIntoConstraints = false
        border3.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.9)
        
        // Set details text view
        textDetailsView.addSubview(details)
        textDetailsView.addSubview(distance)
        textDetailsView.addSubview(additionalText)
        textDetailsView.addSubview(rec)
        textDetailsView.addSubview(border1)
        textDetailsView.addSubview(border2)
        textDetailsView.addSubview(border3)
        
        let dict = ["details":details,"work":workPlace,"education":education,"dist":distance,"text":additionalText,"rec":rec,"b1":border1,"b2":border2,"b3":border3]
        // ,"blanc":blanc
        hConstraints(superView: textDetailsView, subView: "details", dict: dict,shoulders:"10")
        hConstraints(superView: textDetailsView, subView: "work", dict: dict,shoulders:"10")
        hConstraints(superView: textDetailsView, subView: "education", dict: dict,shoulders:"10")
        hConstraints(superView: textDetailsView, subView: "dist", dict: dict,shoulders:"10")
        hConstraints(superView: textDetailsView, subView: "text", dict: dict,shoulders:"10")
        hConstraints(superView: textDetailsView, subView: "rec", dict: dict,shoulders:"10")
        hConstraints(superView: textDetailsView, subView: "b1", dict: dict,shoulders:"0")
        hConstraints(superView: textDetailsView, subView: "b2", dict: dict,shoulders:"0")
        hConstraints(superView: textDetailsView, subView: "b3", dict: dict,shoulders:"0")
        textDetailsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[details(30)]-0-[work(\(workPlaceHeight))]-0-[education(\(educationHeight))]-0-[dist(20)]-0-[b1(1)]-0-[text(50)]-0-[b2(1)]-0-[rec(60)]-0-[b3(1)]-80-|", options: NSLayoutFormatOptions(), metrics: nil, views: dict))
        
        detailsScrollView.addSubview(textDetailsView)
        detailsScrollView.addConstraint(NSLayoutConstraint(item: textDetailsView, attribute: .top, relatedBy: .equal, toItem: detailsImageScrollView, attribute: .bottom, multiplier: 1, constant: 0))
        detailsScrollView.addConstraint(NSLayoutConstraint(item: textDetailsView, attribute: .leading, relatedBy: .equal, toItem: detailsScrollView, attribute: .leading, multiplier: 1, constant: 0))
        detailsScrollView.addConstraint(NSLayoutConstraint(item: textDetailsView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.width))
        detailsScrollView.addConstraint(NSLayoutConstraint(item: textDetailsView, attribute: .bottom, relatedBy: .equal, toItem: detailsScrollView, attribute: .bottom, multiplier: 1, constant: 0))
        
        DispatchQueue.main.async {
            self.detailsScrollView.contentSize.height = self.detailsImageScrollView.frame.height + textDetailsView.frame.height
        }
        
        // Set buttons: X - Star - Heart
        let xImageView = UIImageView(image: #imageLiteral(resourceName: "X"))
        xImageView.frame = CGRect(x: -10, y: -10, width: 50, height: 50)
        let xButton = UIButton(frame: CGRect(x: -10, y: -10, width: 50, height: 50))
        xButton.backgroundColor = .clear
        xButton.addTarget(self, action: #selector(xButtonPressed), for: .touchUpInside)
        let xView = UIView()
        xView.translatesAutoresizingMaskIntoConstraints = false
        xView.backgroundColor = .white
        xView.addSubview(xImageView)
        xView.addSubview(xButton)
        textDetailsView.addSubview(xView)
        let starImageView = UIImageView(image: #imageLiteral(resourceName: "star"))
        starImageView.frame = CGRect(x: -10, y: -10, width: 50, height: 50)
        let starButton = UIButton(frame: CGRect(x: -10, y: -10, width: 50, height: 50))
        starButton.backgroundColor = .clear
        starButton.addTarget(self, action: #selector(starButtonPressed), for: .touchUpInside)
        let starView = UIView()
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.backgroundColor = .white
        starView.addSubview(starImageView)
        starView.addSubview(starButton)
        textDetailsView.addSubview(starView)
        let heartImageView = UIImageView(image: #imageLiteral(resourceName: "heart"))
        heartImageView.frame = CGRect(x: -10, y: -10, width: 50, height: 50)
        let heartButton = UIButton(frame: CGRect(x: -10, y: -10, width: 50, height: 50))
        heartButton.backgroundColor = .clear
        heartButton.addTarget(self, action: #selector(heartButtonPressed), for: .touchUpInside)
        let heartView = UIView()
        heartView.translatesAutoresizingMaskIntoConstraints = false
        heartView.backgroundColor = .white
        heartView.addSubview(heartImageView)
        heartView.addSubview(heartButton)
        textDetailsView.addSubview(heartView)
        let xHeightConstraint = NSLayoutConstraint(item: xView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        let xWidthConstraint = NSLayoutConstraint(item: xView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        let xTopConstraint = NSLayoutConstraint(item: xView, attribute: .top, relatedBy: .equal, toItem: border3, attribute: .bottom, multiplier: 1, constant: 30)
        let xLeadingConstraint = NSLayoutConstraint(item: xView, attribute: .leading, relatedBy: .equal, toItem: textDetailsView, attribute: .leading, multiplier: 1, constant: 50)
        let starHeightConstraint = NSLayoutConstraint(item: starView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        let starWidthConstraint = NSLayoutConstraint(item: starView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        let starTopConstraint = NSLayoutConstraint(item: starView, attribute: .top, relatedBy: .equal, toItem: border3, attribute: .bottom, multiplier: 1, constant: 30)
        let starCenterConstraint = NSLayoutConstraint(item: starView, attribute: .centerX, relatedBy: .equal, toItem: textDetailsView, attribute: .centerX, multiplier: 1, constant: 0)
        let heartHeightConstraint = NSLayoutConstraint(item: heartView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        let heartWidthConstraint = NSLayoutConstraint(item: heartView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        let heartTopConstraint = NSLayoutConstraint(item: heartView, attribute: .top, relatedBy: .equal, toItem: border3, attribute: .bottom, multiplier: 1, constant: 30)
        let heartTrailingConstraint = NSLayoutConstraint(item: heartView, attribute: .trailing, relatedBy: .equal, toItem: textDetailsView, attribute: .trailing, multiplier: 1, constant: -50)
        textDetailsView.addConstraints([xHeightConstraint,xWidthConstraint,xTopConstraint,xLeadingConstraint,starHeightConstraint,starWidthConstraint,starTopConstraint,starCenterConstraint,heartHeightConstraint,heartWidthConstraint,heartTopConstraint,heartTrailingConstraint])

        /// Set back button
        let goBack = UIButton(frame: CGRect(x: screenSize.width-54, y: 40, width: 34, height: 34))
        goBack.layer.cornerRadius = 17
        goBack.setImage(#imageLiteral(resourceName: "Back"), for: .normal)
        goBack.layer.masksToBounds = true
        goBack.backgroundColor = .white
        goBack.addTarget(self, action: #selector(backFromDetailsButtonPressed), for: .touchUpInside)
        detailsScrollView.addSubview(goBack)
    }
    
    func xButtonPressed() -> Void {
        backFromDetailsButtonPressed()
        nopeButtonPressed()
    }
    
    func starButtonPressed() -> Void {
        backFromDetailsButtonPressed()
        superLikeButtonPressed()
    }
    
    func heartButtonPressed() -> Void {
        backFromDetailsButtonPressed()
        likeButtonPressed()
    }
    
    func hConstraints(superView:UIView,subView:String,dict:[String : UIView],shoulders:String) -> Void {
        superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(shoulders)-[\(subView)]-\(shoulders)-|", options: NSLayoutFormatOptions(), metrics: nil, views: dict))
    }
    
    func vConstraints(superView:UIView,subView:String,dict:[String : UIView],shoulders:String) -> Void {
        superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(shoulders)-[\(subView)]-\(shoulders)-|", options: NSLayoutFormatOptions(), metrics: nil, views: dict))
    }
    
    func setImageViewPhotos() -> Void {
        let subViews = self.imageContentView.subviews
        for subview in subViews{
                subview.removeFromSuperview()
        }
        for index in 0...currentArray.count-1 {
            let image = currentArray[index] as! UIImage
            let imageView = UIImageView(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageContentView.addSubview(imageView)
            imageContentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[imageView(\(screenSize.width))]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["imageView" : imageView]))
            imageContentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(\(screenSize.width*CGFloat(index)))-[imageView(\(screenSize.width))]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["imageView" : imageView]))
        }
    }
    
    func getDetails(current: Int, mansArray:[String], womensArrey:[String]) -> String {
        var text = ""
        if Gender.isLookingForMale && Gender.isLookingForFemale {
            if current > womensArrey.count {
                text = mansArray[current-womensArrey.count] 
            } else {
                text = womensArrey[current]
            }
        } else if !Gender.isLookingForMale && Gender.isLookingForFemale {
            text = womensArrey[current]
        } else if Gender.isLookingForMale && !Gender.isLookingForFemale {
            text = mansArray[current]
        } else if !Gender.isLookingForMale && !Gender.isLookingForFemale {
            text = ""
        }
        return text
    }

    func backFromDetailsButtonPressed() -> Void {
        detailsContentView.removeFromSuperview()
        detailsScrollView.removeFromSuperview()
    }
    
    func add1ToCurrent() -> Void {
        updateGender()
        if currentSuggestion < (matesArray.count-1) {
            self.currentSuggestion += 1
        } else {
            self.currentSuggestion = 0
        }
    }
    
    func reduce1FromCurrent() -> Void {
        updateGender()
        if currentSuggestion > 0 {
            self.currentSuggestion -= 1
        } else {
            self.currentSuggestion = (matesArray.count-1)
        }
    }

    
    func currentPlus1() -> Int {
        updateGender()
        var next = 0
        if currentSuggestion < (matesArray.count-1) {
            next = currentSuggestion + 1
        } else {
            next = 0
        }
        return next
    }
    
    func currentPlus2() -> Int {
        updateGender()
        var next = 0
        if currentSuggestion < (matesArray.count-2) {
            next = currentSuggestion + 2
        } else {
            if currentSuggestion == (matesArray.count-2) {
                next = 0
            } else {
               next = 1
            }
        }
        return next
    }
    
    func xFromCenterPositive() -> Void {
        nopeLabel.alpha = 0
        likeLabel.alpha = xFromCenter/(card.frame.size.width/2)
    }
    func xFromCenterNegative() -> Void {
        likeLabel.alpha = 0
        nopeLabel.alpha = -xFromCenter/(card.frame.size.width/2)
    }
    func yFromCenterNegative() -> Void {
        superLikeLabel.alpha = -yFromCenter/(card.frame.size.height/2)
    }
    
    func updateGender() -> Void {
        if Gender.isLookingForMale && Gender.isLookingForFemale {
            localWomansAndMansArray = []
            for index in 0...GlobalArrays.womensArray.count-1 {
                let firstImage = (GlobalArrays.womensArray[index] as! NSArray)[0] as! UIImage
                localWomansAndMansArray.append(firstImage)
            }
            for index in 0...GlobalArrays.mansArray.count-1 {
                let firstImage = (GlobalArrays.mansArray[index] as! NSArray)[0] as! UIImage
                localWomansAndMansArray.append(firstImage)
            }
            matesArray = localWomansAndMansArray
        } else if !Gender.isLookingForMale && Gender.isLookingForFemale {
            localWomansArray = []
            for index in 0...GlobalArrays.womensArray.count-1 {
                let firstImage = (GlobalArrays.womensArray[index] as! NSArray)[0] as! UIImage
                localWomansArray.append(firstImage)
            }
            matesArray = localWomansArray
        } else if Gender.isLookingForMale && !Gender.isLookingForFemale {
            localMansArray = []
            for index in 0...GlobalArrays.mansArray.count-1 {
                let firstImage = (GlobalArrays.mansArray[index] as! NSArray)[0] as! UIImage
                localMansArray.append(firstImage)
            }
            matesArray = localMansArray
        } else if !Gender.isLookingForMale && !Gender.isLookingForFemale {
            matesArray = []
        }
    }
    
    func buttonsPrepare() -> Void {
        // Buttons view
        let buttonsView = UIView()
        buttonsView.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
        // buttons image
        buttonsView.contentMode = .scaleAspectFit
        buttonsView.layer.contents = #imageLiteral(resourceName: "buttons").cgImage
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        slideView.addSubview(buttonsView)
        let buttonsLeadingConstraint = NSLayoutConstraint(item: buttonsView, attribute: .leading, relatedBy: .equal, toItem: slideView, attribute: .leading, multiplier: 1, constant: 0)
        buttonsLeadingConstraint.identifier = "buttonsLeading"
        let buttonsWidthConstraint = NSLayoutConstraint(item: buttonsView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.width)
        buttonsWidthConstraint.identifier = "buttonsWidth"
        let buttonsBottomConstraint = NSLayoutConstraint(item: buttonsView, attribute: .bottom, relatedBy: .equal, toItem: slideView, attribute: .bottom, multiplier: 1, constant: 0)
        buttonsBottomConstraint.identifier = "buttonsBottom"
        let buttonsHeightConstraint = NSLayoutConstraint(item: buttonsView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 90)
        buttonsHeightConstraint.identifier = "buttonsHeight"
        slideView.addConstraints([buttonsLeadingConstraint,buttonsWidthConstraint,buttonsBottomConstraint,buttonsHeightConstraint])
        // Go Back button
        let goBack = UIButton()
        goBack.backgroundColor = .clear
        goBack.addTarget(self, action: #selector(goBackButtonPressed), for: .touchUpInside)
        buttonsView.addSubview(goBack)
        goBack.translatesAutoresizingMaskIntoConstraints = false
        let goBackTopConstraint = NSLayoutConstraint(item: goBack, attribute: .top, relatedBy: .equal, toItem: buttonsView, attribute: .top, multiplier: 1, constant: 5)
        goBackTopConstraint.identifier = "goBackTop"
        let goBackLeadingConstraint = NSLayoutConstraint(item: goBack, attribute: .leading, relatedBy: .equal, toItem: buttonsView, attribute: .leading, multiplier: 1, constant: 10)
        goBackLeadingConstraint.identifier = "goBackLeading"
        let goBackWidthConstraint = NSLayoutConstraint(item: goBack, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        goBackWidthConstraint.identifier = "goBackWidth"
        let goBackBottomConstraint = NSLayoutConstraint(item: goBack, attribute: .bottom, relatedBy: .equal, toItem: buttonsView, attribute: .bottom, multiplier: 1, constant: -5)
        goBackBottomConstraint.identifier = "goBackBottom"
        buttonsView.addConstraints([goBackTopConstraint,goBackLeadingConstraint,goBackWidthConstraint,goBackBottomConstraint])
        // Nope button
        let nope = UIButton()
        nope.backgroundColor = .clear
        nope.addTarget(self, action: #selector(nopeButtonPressed), for: .touchUpInside)
        buttonsView.addSubview(nope)
        nope.translatesAutoresizingMaskIntoConstraints = false
        let nopeTopConstraint = NSLayoutConstraint(item: nope, attribute: .top, relatedBy: .equal, toItem: buttonsView, attribute: .top, multiplier: 1, constant: 5)
        nopeTopConstraint.identifier = "nopeTop"
        let nopeLeadingConstraint = NSLayoutConstraint(item: nope, attribute: .leading, relatedBy: .equal, toItem: goBack, attribute: .trailing, multiplier: 1, constant: 0)
        nopeLeadingConstraint.identifier = "nopeLeading"
        let nopeWidthConstraint = NSLayoutConstraint(item: nope, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 82)
        nopeWidthConstraint.identifier = "nopeWidth"
        let nopeBottomConstraint = NSLayoutConstraint(item: nope, attribute: .bottom, relatedBy: .equal, toItem: buttonsView, attribute: .bottom, multiplier: 1, constant: -5)
        nopeBottomConstraint.identifier = "nopeBottom"
        buttonsView.addConstraints([nopeTopConstraint,nopeLeadingConstraint,nopeWidthConstraint,nopeBottomConstraint])
        // Boost button
        let boost = UIButton()
        boost.backgroundColor = .clear
        boost.addTarget(self, action: #selector(boostButtonPressed), for: .touchUpInside)
        buttonsView.addSubview(boost)
        boost.translatesAutoresizingMaskIntoConstraints = false
        let boostTopConstraint = NSLayoutConstraint(item: boost, attribute: .top, relatedBy: .equal, toItem: buttonsView, attribute: .top, multiplier: 1, constant: 5)
        boostTopConstraint.identifier = "boostTop"
        let boostLeadingConstraint = NSLayoutConstraint(item: boost, attribute: .leading, relatedBy: .equal, toItem: nope, attribute: .trailing, multiplier: 1, constant: 0)
        boostLeadingConstraint.identifier = "boostLeading"
        let boostWidthConstraint = NSLayoutConstraint(item: boost, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70)
        boostWidthConstraint.identifier = "boostWidth"
        let boostBottomConstraint = NSLayoutConstraint(item: boost, attribute: .bottom, relatedBy: .equal, toItem: buttonsView, attribute: .bottom, multiplier: 1, constant: -5)
        boostBottomConstraint.identifier = "boostBottom"
        buttonsView.addConstraints([boostTopConstraint,boostLeadingConstraint,boostWidthConstraint,boostBottomConstraint])
        // Like button
        let like = UIButton()
        like.backgroundColor = .clear
        like.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        buttonsView.addSubview(like)
        like.translatesAutoresizingMaskIntoConstraints = false
        let likeTopConstraint = NSLayoutConstraint(item: like, attribute: .top, relatedBy: .equal, toItem: buttonsView, attribute: .top, multiplier: 1, constant: 5)
        likeTopConstraint.identifier = "likeTop"
        let likeLeadingConstraint = NSLayoutConstraint(item: like, attribute: .leading, relatedBy: .equal, toItem: boost, attribute: .trailing, multiplier: 1, constant: 0)
        likeLeadingConstraint.identifier = "likeLeading"
        let likeWidthConstraint = NSLayoutConstraint(item: like, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 78)
        likeWidthConstraint.identifier = "likeWidth"
        let likeBottomConstraint = NSLayoutConstraint(item: like, attribute: .bottom, relatedBy: .equal, toItem: buttonsView, attribute: .bottom, multiplier: 1, constant: -5)
        likeBottomConstraint.identifier = "likeBottom"
        buttonsView.addConstraints([likeTopConstraint,likeLeadingConstraint,likeWidthConstraint,likeBottomConstraint])
        // SuperLike button
        let superLike = UIButton()
        superLike.backgroundColor = .clear
        superLike.addTarget(self, action: #selector(superLikeButtonPressed), for: .touchUpInside)
        buttonsView.addSubview(superLike)
        superLike.translatesAutoresizingMaskIntoConstraints = false
        let superLikeTopConstraint = NSLayoutConstraint(item: superLike, attribute: .top, relatedBy: .equal, toItem: buttonsView, attribute: .top, multiplier: 1, constant: 5)
        superLikeTopConstraint.identifier = "likeTop"
        let superLikeLeadingConstraint = NSLayoutConstraint(item: superLike, attribute: .leading, relatedBy: .equal, toItem: like, attribute: .trailing, multiplier: 1, constant: 0)
        superLikeLeadingConstraint.identifier = "likeLeading"
        let superLikeWidthConstraint = NSLayoutConstraint(item: superLike, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 66)
        superLikeWidthConstraint.identifier = "likeWidth"
        let superLikeBottomConstraint = NSLayoutConstraint(item: superLike, attribute: .bottom, relatedBy: .equal, toItem: buttonsView, attribute: .bottom, multiplier: 1, constant: -5)
        superLikeBottomConstraint.identifier = "likeBottom"
        buttonsView.addConstraints([superLikeTopConstraint,superLikeLeadingConstraint,superLikeWidthConstraint,superLikeBottomConstraint])
    }
    
    // MARK: - Suggestions Like and dislike buttons press functions
    
    func goBackButtonPressed() -> Void {
        print("Go back button pressed")
        let getTplus = GetTinderPlus()
        view.addSubview(getTplus.view)
    }
    func nopeButtonPressed() -> Void {
        print("Nope button pressed")
        let nopeLabel = setNopeLabel()
        nopeLabel.alpha = 0.0
        if isslidingCard1First {
            sCard1.addSubview(nopeLabel)
            UIView.animate(withDuration: 0.3, animations: {
                nopeLabel.alpha = 1.0
            })
            UIView.animate(withDuration: 0.6, delay: 0.3, animations: {
                self.sCard1.center = CGPoint(x: self.card.center.x - 800, y: self.card.center.y)
                self.sCard1.transform = CGAffineTransform(rotationAngle: -0.35)
            }, completion: { (true) in
                self.sCard1.removeFromSuperview()
                self.add1ToCurrent()
                self.sCard1 = self.slideCardPrepare()
                self.slideView.bringSubview(toFront: self.sCard2)
                self.addGestureRecToCard(sCard: &self.sCard2)
                self.isslidingCard1First = false
            })
        } else {
            sCard2.addSubview(nopeLabel)
            UIView.animate(withDuration: 0.3, animations: {
                nopeLabel.alpha = 1.0
            })
            UIView.animate(withDuration: 0.6, delay: 0.3, animations: {
                self.sCard2.center = CGPoint(x: self.card.center.x - 800, y: self.card.center.y)
                self.sCard2.transform = CGAffineTransform(rotationAngle: -0.35)
            }, completion: { (true) in
                self.sCard2.removeFromSuperview()
                self.add1ToCurrent()
                self.sCard2 = self.slideCardPrepare()
                self.slideView.bringSubview(toFront: self.sCard1)
                self.addGestureRecToCard(sCard: &self.sCard1)
                self.isslidingCard1First = true
            })
        }
    }
    
    func boostButtonPressed() -> Void {
        print("Boost button pressed")
        let getBoost = GetBoost()
        view.addSubview(getBoost.view)
        addChildViewController(getBoost)
    }
    func likeButtonPressed() -> Void {
        print("Like button pressed")
        let likeLabel = setLikeLabel()
        likeLabel.alpha = 0.0
        if isslidingCard1First {
            sCard1.addSubview(likeLabel)
            UIView.animate(withDuration: 0.3, animations: {
                likeLabel.alpha = 1.0
            })
            UIView.animate(withDuration: 0.6, delay: 0.3, animations: {
                self.sCard1.center = CGPoint(x: self.card.center.x + 800, y: self.card.center.y)
                self.sCard1.transform = CGAffineTransform(rotationAngle: 0.35)
            }, completion: { (true) in
                self.sCard1.removeFromSuperview()
                self.add1ToCurrent()
                self.sCard1 = self.slideCardPrepare()
                self.slideView.bringSubview(toFront: self.sCard2)
                self.addGestureRecToCard(sCard: &self.sCard2)
                self.isslidingCard1First = false
            })
        } else {
            sCard2.addSubview(likeLabel)
            UIView.animate(withDuration: 0.3, animations: {
                likeLabel.alpha = 1.0
            })
            UIView.animate(withDuration: 0.6, delay: 0.3, animations: {
                self.sCard2.center = CGPoint(x: self.card.center.x + 800, y: self.card.center.y)
                self.sCard2.transform = CGAffineTransform(rotationAngle: 0.35)
            }, completion: { (true) in
                self.sCard2.removeFromSuperview()
                self.add1ToCurrent()
                self.sCard2 = self.slideCardPrepare()
                self.slideView.bringSubview(toFront: self.sCard1)
                self.addGestureRecToCard(sCard: &self.sCard1)
                self.isslidingCard1First = true
            })
        }
    }
    
    func superLikeButtonPressed() -> Void {
        print("Super like button pressed")
        let superLikeLabel = setSuperLikeLabel()
        superLikeLabel.alpha = 0.0
        if isslidingCard1First {
            sCard1.addSubview(superLikeLabel)
            UIView.animate(withDuration: 0.3, animations: {
                superLikeLabel.alpha = 1.0
            })
            UIView.animate(withDuration: 0.6, delay: 0.3, animations: {
                self.sCard1.center = CGPoint(x: self.card.center.x, y: self.card.center.y - 800)
            }, completion: { (true) in
                self.sCard1.removeFromSuperview()
                self.add1ToCurrent()
                self.sCard1 = self.slideCardPrepare()
                self.slideView.bringSubview(toFront: self.sCard2)
                self.addGestureRecToCard(sCard: &self.sCard2)
                self.isslidingCard1First = false
            })
        } else {
            sCard2.addSubview(superLikeLabel)
            UIView.animate(withDuration: 0.3, animations: {
                superLikeLabel.alpha = 1.0
            })
            UIView.animate(withDuration: 0.6, delay: 0.3, animations: {
                self.sCard2.center = CGPoint(x: self.card.center.x, y: self.card.center.y - 800)
            }, completion: { (true) in
                self.sCard2.removeFromSuperview()
                self.add1ToCurrent()
                self.sCard2 = self.slideCardPrepare()
                self.slideView.bringSubview(toFront: self.sCard1)
                self.addGestureRecToCard(sCard: &self.sCard1)
                self.isslidingCard1First = true
            })
        }
    }
    
    // MARK: - Slide with friends - page prepare
    
    func slideWithFriendsPagePrepare() -> Void {
        slideWithFriendsView.translatesAutoresizingMaskIntoConstraints = false
        slideWithFriendsView.backgroundColor = .white
        contentView.addSubview(slideWithFriendsView)
        contentView.addConstraint(NSLayoutConstraint.init(item: slideWithFriendsView, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint.init(item: slideWithFriendsView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1/3, constant: 0))
        contentView.addConstraint(NSLayoutConstraint.init(item: slideWithFriendsView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: screenSize.width))
        // Slide with friends - image
        let slideWithFriendsImageView = UIImageView(image: #imageLiteral(resourceName: "slideWithFriends"))
        slideWithFriendsImageView.translatesAutoresizingMaskIntoConstraints = false
        slideWithFriendsView.addSubview(slideWithFriendsImageView)
        slideWithFriendsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[image]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["image":slideWithFriendsImageView]))
        slideWithFriendsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[image]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["image":slideWithFriendsImageView]))
        // Slide with friends - find friends button
        let findFriendsButton = UIButton(frame: CGRect(x: 50, y: 425, width: screenSize.width-100, height: 55))
        findFriendsButton.backgroundColor = .clear
        findFriendsButton.addTarget(self, action: #selector(findFriendsButtonPressed), for: .touchUpInside)
        slideWithFriendsView.addSubview(findFriendsButton)
    }
    
    func findFriendsButtonPressed() -> Void {
        print("Find friends button pressed")
    }
    
    func peopleAroundYouLoadScreen() -> Void {
        peopleAroundLoadingView.translatesAutoresizingMaskIntoConstraints = false
        peopleAroundLoadingView.backgroundColor = .brown
        contentView.addSubview(peopleAroundLoadingView)
        contentView.addConstraint(NSLayoutConstraint.init(item: peopleAroundLoadingView, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint.init(item: peopleAroundLoadingView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1/3, constant: 0))
        contentView.addConstraint(NSLayoutConstraint.init(item: peopleAroundLoadingView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: screenSize.width))
        // People around you - user profile image
        userProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        userProfileImageView.layer.cornerRadius = 40
        userProfileImageView.layer.masksToBounds = true
        peopleAroundLoadingView.addSubview(userProfileImageView)
        peopleAroundLoadingView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\((screenSize.width-80)/2)-[image(80)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["image":userProfileImageView]))
        peopleAroundLoadingView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[image(80)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["image":userProfileImageView]))
    }
    
    // MARK: - Matches view - page prepare
    
    func matchesViewPagePrepare() -> UIView {
        let mView = UIView()
        mView.backgroundColor = .white
        // Matches view - no matches yet image
        let noMatchesImageView = UIImageView(image: #imageLiteral(resourceName: "noMatchFullSize"))
        noMatchesImageView.translatesAutoresizingMaskIntoConstraints = false
        mView.addSubview(noMatchesImageView)
        mView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[image]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["image":noMatchesImageView]))
        mView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[image]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["image":noMatchesImageView]))
        return mView
    }
    
    // MARK: - Scrolling
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            let pageWidth:CGFloat = scrollView.frame.size.width
            let fractionalPage = scrollView.contentOffset.x / pageWidth
            let page:Int = lround(Double(fractionalPage))
            if previousPage != page {
                switch page {
                case 0:
                    nameLabel.text = userName
                    for view in slideView.subviews {
                        view.removeFromSuperview()
                    }
                    if isPeopleAraundYouWasLast {
                        menuBar.layer.contents = #imageLiteral(resourceName: "MenuBar1").cgImage
                    }
                    else {
                        menuBar.layer.contents = #imageLiteral(resourceName: "MenuBar1Left").cgImage
                    }
                case 1:
                    if isPeopleAraundYouWasLast {
                        menuBar.layer.contents = #imageLiteral(resourceName: "MenuBar3").cgImage
                        slideWithFriendsPagePrepare()
                    }
                    else {
                        menuBar.layer.contents = #imageLiteral(resourceName: "MenuBar2").cgImage
                        reduce1FromCurrent()
                        slideViewPagePrepare()
                    }
                case 2:
                    for view in slideView.subviews {
                        view.removeFromSuperview()
                    }
                    if isPeopleAraundYouWasLast {
                        menuBar.layer.contents = #imageLiteral(resourceName: "MenuBar4 ").cgImage
                    }
                    else {
                        menuBar.layer.contents = #imageLiteral(resourceName: "MenuBar4Left").cgImage
                    }
                default:
                    break
                }
                print("Just scrolled from page \(previousPage) to page \(page)")
                previousPage = page
            }
        }
    }

}

