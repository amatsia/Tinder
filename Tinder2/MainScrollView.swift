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
    let userProfileImageView = UIImageView(image: #imageLiteral(resourceName: "jon"))
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
    let likeStampView = UIImageView()
    let nopeStampView = UIImageView()
    let superLikeStampView = UIImageView()
    var xFromCenter = CGFloat()
    var card = UIView()
    var sCard1 = UIView()
    var sCard2 = UIView()
    var slidingCard2 = UIView()
    var isslidingCard1First = true
    let girlsArray = [#imageLiteral(resourceName: "girl0"),#imageLiteral(resourceName: "girl1"),#imageLiteral(resourceName: "girl2"),#imageLiteral(resourceName: "girl3"),#imageLiteral(resourceName: "girl4"),#imageLiteral(resourceName: "girl5"),#imageLiteral(resourceName: "girl6"),#imageLiteral(resourceName: "girl7"),#imageLiteral(resourceName: "girl8"),#imageLiteral(resourceName: "girl9")]
    var currentSuggestion = 0
    var cardCenter = CGPoint(x: 160, y: 274)
    
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
        view.addConstraint(NSLayoutConstraint.init(item: scrollView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint.init(item: scrollView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint.init(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0))
        
        // Content view
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .green
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.bounds.size
        scrollView.addConstraint(NSLayoutConstraint.init(item: contentView, attribute: .height, relatedBy: .equal, toItem: scrollView, attribute: .height, multiplier: 1, constant: 0))
        scrollView.addConstraint(NSLayoutConstraint.init(item: contentView, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 3, constant: 0))
        scrollView.addConstraint(NSLayoutConstraint.init(item: contentView, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1, constant: 0))
        
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
        contentView.addConstraint(NSLayoutConstraint.init(item: userProfile, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint.init(item: userProfile, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1/3, constant: 0))
        contentView.addConstraint(NSLayoutConstraint.init(item: userProfile, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 0))
        
        // MARK: - Slide view
        slideViewPagePrepare(current: currentSuggestion)
        
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
        let viewDict = ["EL":mbLeftButton,"CL":mbCenterLeftButton,"CR":mbCenterRightButton,"ER":mbRightButton]
        menu.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[EL(50)]-[CL(65)][CR(65)]-[ER(50)]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewDict))
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
        UIView.animate(withDuration: 0.02, delay: 0, options: [], animations: {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        }, completion: nil)
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
        sCard1.removeFromSuperview()
        slideView.removeFromSuperview()
        slideViewPagePrepare(current: currentSuggestion)
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
    }
    
    func menuBarRightButtonPressed() -> Void {
        print("Menu bar right button pressed")
        UIView.animate(withDuration: 0.02, delay: 0, options: [], animations: {
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.size.width*2, y: 0), animated: false)
        }, completion: nil)
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
        profile.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\((self.screenSize.width-80)/2)-[image(80)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["image":userProfileImageView]))
        profile.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[image(80)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["image":userProfileImageView]))
        
        // User profile name label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.backgroundColor = UIColor.white
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .center
        nameLabel.text = "Jon ,36"  // Change
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        profile.addSubview(nameLabel)
        profile.addConstraint(NSLayoutConstraint.init(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: profile, attribute: .centerX, multiplier: 1, constant: 0))
        profile.addConstraint(NSLayoutConstraint.init(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: userProfileImageView, attribute: .bottom, multiplier: 1, constant: 10))
        
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
        profile.addConstraint(NSLayoutConstraint.init(item: settingsButton, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 40))
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
        profile.addConstraint(NSLayoutConstraint.init(item: tinderPlusButton, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 40))
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
        profile.addConstraint(NSLayoutConstraint.init(item: label1, attribute: .top, relatedBy: .equal, toItem: userProfileImageView, attribute: .bottom, multiplier: 1, constant: 220))
        
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
    }
    func tinderPlusButtonPressed() -> Void {
        print("Tinder plus button pressed")
    }
    func backButtonPressed() -> Void {
        print("Back button pressed")
        let mainVC = ScrollViewController()
        present(mainVC, animated: false, completion: nil)
    }
    
    // MARK: - Slide view - page prepare
    
    func slideViewPagePrepare(current:Int) -> Void {
        slideView.backgroundColor = .white
        var next = 0
        if current < 9 {
            next = current + 1
        } else {
            next = 0
        }
        SlideCardSetup(sCard: &sCard2, current: next)
        SlideCardSetup(sCard: &sCard1, current: current)
        addGestureRecToCard(sCard: &sCard1)
        
        // Slide view buttom buttons (like, nope, super like etc..)
        let buttonsView = buttonsPrepare()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        slideView.addSubview(buttonsView)
        
        slideView.addConstraint(NSLayoutConstraint(item: buttonsView, attribute: .leading, relatedBy: .equal, toItem: slideView, attribute: .leading, multiplier: 1, constant: 0))
        slideView.addConstraint(NSLayoutConstraint(item: buttonsView, attribute: .trailing, relatedBy: .equal, toItem: slideView, attribute: .trailing, multiplier: 1, constant: 0))
        slideView.addConstraint(NSLayoutConstraint(item: buttonsView, attribute: .bottom, relatedBy: .equal, toItem: slideView, attribute: .bottom, multiplier: 1, constant: 0))
        slideView.addConstraint(NSLayoutConstraint(item: buttonsView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80))
        
        // Slide View setup - Constraints and adding to super view
        slideView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(slideView)
        contentView.addConstraint(NSLayoutConstraint.init(item: slideView, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint.init(item: slideView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1/3, constant: 0))
        contentView.addConstraint(NSLayoutConstraint.init(item: slideView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: screenSize.width))
        contentView.addConstraint(NSLayoutConstraint.init(item: slideView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 0))
    }
    
    func SlideCardSetup(sCard: inout UIView, current:Int) -> Void {
        // Sliding card
        sCard = slideCardPrepare(current: current)
        sCard.translatesAutoresizingMaskIntoConstraints = false
        slideView.addSubview(sCard)
        slideView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[card]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["card":sCard]))
        slideView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-70-[card]-90-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["card":sCard]))
    }
    
    func addGestureRecToCard (sCard: inout UIView) -> Void {
        let PanGesture = UIPanGestureRecognizer(target: self, action: #selector(slidingCardPanGestureTapped(sender:)))
        sCard.addGestureRecognizer(PanGesture)
    }
    
    func slideCardPrepare(current:Int) -> UIView {
        // ContainerView - card
        let sCard = UIView()
        sCard.frame = CGRect(x: 0, y: 0, width: screenSize.width-20, height: screenSize.height-160)
        sCard.translatesAutoresizingMaskIntoConstraints = false
        sCard.layer.cornerRadius = 10
        sCard.layer.masksToBounds = true
        sCard.layer.borderColor = UIColor.lightGray.cgColor
        sCard.layer.borderWidth = 2
        sCard.backgroundColor = .white
        // Suggested person image view
        let suggestedMatesImageView = UIImageView(image: girlsArray[current])
        suggestedMatesImageView.translatesAutoresizingMaskIntoConstraints = false
        suggestedMatesImageView.contentMode = .scaleAspectFill
        sCard.addSubview(suggestedMatesImageView)
        sCard.addConstraint(NSLayoutConstraint(item: suggestedMatesImageView, attribute: .width, relatedBy: .equal, toItem: sCard, attribute: .width, multiplier: 1, constant: 0))
        sCard.addConstraint(NSLayoutConstraint(item: suggestedMatesImageView, attribute: .height, relatedBy: .equal, toItem: sCard, attribute: .height, multiplier: 1, constant: 0))
        sCard.addConstraint(NSLayoutConstraint(item: suggestedMatesImageView, attribute: .leading, relatedBy: .equal, toItem: sCard, attribute: .leading, multiplier: 1, constant: 0))
        // Suggested mate name and age text label
        let sugName = "Name"
        let sugAge = 20
        let sugWorkPlace = "WorkPlace"
        let sugTextLebel = UILabel()
        sugTextLebel.lineBreakMode = .byWordWrapping
        sugTextLebel.numberOfLines = 2
        let textLabelString = "\(sugName), \(sugAge)\n\(sugWorkPlace)"
        sugTextLebel.text = textLabelString
        let nameLength = sugName.characters.count
        let range = NSMakeRange(0, nameLength)
        sugTextLebel.attributedText = attributedString(from: textLabelString, BoldRange: range)
        sCard.addSubview(sugTextLebel)
        sugTextLebel.translatesAutoresizingMaskIntoConstraints = false
        sCard.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[label]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["label":sugTextLebel]))
        sCard.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[image]-5-[label(60)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["label":sugTextLebel,"image":suggestedMatesImageView]))
        return sCard
    }
    
    func attributedString(from string: String, BoldRange: NSRange?) -> NSAttributedString {
        let nonBoldAttribute = [
            NSFontAttributeName: UIFont.systemFont(ofSize: 18),
            NSForegroundColorAttributeName: UIColor.black
        ]
        let boldAttribute = [
            NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18),
            ]
        let attrStr = NSMutableAttributedString(string: string, attributes: nonBoldAttribute)
        if let range = BoldRange {
            attrStr.setAttributes(boldAttribute, range: range)
        }
        return attrStr
    }
    
    func slidingCardPanGestureTapped(sender: UIPanGestureRecognizer) {
        print("Tapping working")
        // Stamp setting - temporary
        likeStampView.translatesAutoresizingMaskIntoConstraints = false
        nopeStampView.translatesAutoresizingMaskIntoConstraints = false
        card = sender.view!
        card.addSubview(likeStampView)
        card.addSubview(nopeStampView)
        let point = sender.translation(in: view)
        xFromCenter = card.center.x - view.center.x
        likeStampView.image = #imageLiteral(resourceName: "Like")
        likeStampView.transform = CGAffineTransform(rotationAngle: -0.5236)
        card.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[stamp(100)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["stamp" : likeStampView]))
        card.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[stamp(100)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["stamp" : likeStampView]))
        nopeStampView.image = #imageLiteral(resourceName: "Nope")
        nopeStampView.transform = CGAffineTransform(rotationAngle: 0.5236)
        card.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-180-[stamp(100)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["stamp" : nopeStampView]))
        card.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[stamp(100)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["stamp" : nopeStampView]))
        if xFromCenter > 0 {
            xFromCenterPositive()
        } else {
            xFromCenterNegative()
        }
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/(view.center.x/0.35))
        if sender.state == UIGestureRecognizerState.ended {
            if card.center.x < 75 {
                add1ToCurrent()
                UIView.animate(withDuration: 0.02, animations: {
                    self.card.center = CGPoint(x: self.card.center.x - 300, y: self.card.center.y)
                }, completion: { (true) in
                    self.card.removeFromSuperview()
                })
                if isslidingCard1First {
                    SlideCardSetup(sCard: &sCard1, current: currentPlus2())
                    slideView.sendSubview(toBack: sCard1)
                    addGestureRecToCard(sCard: &sCard2)
                    isslidingCard1First = false
                } else {
                    SlideCardSetup(sCard: &sCard2, current: currentPlus2())
                    slideView.sendSubview(toBack: sCard2)
                    addGestureRecToCard(sCard: &sCard1)
                    isslidingCard1First = true
                }
                return
            } else if card.center.x > (view.frame.width-75){
                add1ToCurrent()
                UIView.animate(withDuration: 0.02, animations: {
                    self.card.center = CGPoint(x: self.card.center.x + 300, y: self.card.center.y)
                }, completion: { (true) in
                    self.card.removeFromSuperview()
                })
                if isslidingCard1First {
                    SlideCardSetup(sCard: &sCard1, current: currentPlus2())
                    slideView.sendSubview(toBack: sCard1)
                    addGestureRecToCard(sCard: &sCard2)
                    isslidingCard1First = false
                } else {
                    SlideCardSetup(sCard: &sCard2, current: currentPlus2())
                    slideView.sendSubview(toBack: sCard2)
                    addGestureRecToCard(sCard: &sCard1)
                    isslidingCard1First = true
                }
                return
            }
            UIView.animate(withDuration: 0.05, animations: {
                self.likeStampView.alpha = 0
                self.nopeStampView.alpha = 0
                self.card.center = self.cardCenter
                self.card.transform = CGAffineTransform(rotationAngle: 0)
            })
        }
    }
    
    func add1ToCurrent() -> Void {
        if currentSuggestion < 9 {
            self.currentSuggestion += 1
        } else {
            self.currentSuggestion = 0
        }
    }
    
    func currentPlus1() -> Int {
        var next = 0
        if currentSuggestion < 9 {
            next = currentSuggestion + 1
        } else {
            next = 0
        }
        return next
    }
    
    func currentPlus2() -> Int {
        var next = 0
        if currentSuggestion < 8 {
            next = currentSuggestion + 2
        } else {
            if currentSuggestion == 8 {
                next = 0
            } else {
               next = 1
            }
        }
        return next
    }
    
    func xFromCenterPositive() -> Void {
        nopeStampView.alpha = 0
        likeStampView.alpha = xFromCenter/(card.frame.size.width/2)
    }
    func xFromCenterNegative() -> Void {
        likeStampView.alpha = 0
        nopeStampView.alpha = -xFromCenter/(card.frame.size.width/2)
    }
    
    func buttonsPrepare() -> UIView {
        // Buttons view
        let buttonsView = UIView()
        buttonsView.backgroundColor = .white
        // buttons image
        buttonsView.contentMode = .scaleAspectFit
        buttonsView.layer.contents = #imageLiteral(resourceName: "buttons").cgImage
        
        // Go Back button
        let goBack = UIButton(frame: CGRect(x: 7, y: 10, width: 50, height: 50))
        //goBack.translatesAutoresizingMaskIntoConstraints = false
        goBack.backgroundColor = .clear
        goBack.addTarget(self, action: #selector(goBackButtonPressed), for: .touchUpInside)
        buttonsView.addSubview(goBack)
        
        /*
        buttonsView.addConstraint(NSLayoutConstraint(item: goBack, attribute: .top, relatedBy: .equal, toItem: buttonsView, attribute: .top, multiplier: 1, constant: 10))
        buttonsView.addConstraint(NSLayoutConstraint(item: goBack, attribute: .leading, relatedBy: .equal, toItem: buttonsView, attribute: .leading, multiplier: 1, constant: 10))
        buttonsView.addConstraint(NSLayoutConstraint(item: goBack, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50))
        buttonsView.addConstraint(NSLayoutConstraint(item: goBack, attribute: .bottom, relatedBy: .equal, toItem: buttonsView, attribute: .bottom, multiplier: 1, constant: -10))
        */
        /*
        buttonsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[button(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["button":goBack]))
         */
 
        // Nope button
        let nope = UIButton(frame: CGRect(x: 65, y: 5, width: 60, height: 60))
        //nope.translatesAutoresizingMaskIntoConstraints = false
        nope.backgroundColor = .clear
        nope.addTarget(self, action: #selector(nopeButtonPressed), for: .touchUpInside)
        buttonsView.addSubview(nope)
        
        /*
        buttonsView.addConstraint(NSLayoutConstraint.init(item: nope, attribute: .top, relatedBy: .equal, toItem: buttonsView, attribute: .top, multiplier: 1, constant: 0))
        buttonsView.addConstraint(NSLayoutConstraint.init(item: nope, attribute: .bottom, relatedBy: .equal, toItem: buttonsView, attribute: .bottom, multiplier: 1, constant: 0))
        buttonsView.addConstraint(NSLayoutConstraint.init(item: nope, attribute: .leading, relatedBy: .equal, toItem: buttonsView, attribute: .leading, multiplier: 1, constant: 100))
        buttonsView.addConstraint(NSLayoutConstraint.init(item: nope, attribute: .trailing, relatedBy: .equal, toItem: buttonsView, attribute: .trailing, multiplier: 1, constant: -100))
        //
        buttonsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[button(60)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["button":nope]))
        */
        
        
        // Boost button
        let boost = UIButton(frame: CGRect(x: 133, y: 10, width: 51, height: 50))
        // boost.translatesAutoresizingMaskIntoConstraints = false
        boost.backgroundColor = .clear
        boost.addTarget(self, action: #selector(boostButtonPressed), for: .touchUpInside)
        buttonsView.addSubview(boost)
        /*
        buttonsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[button(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["button":boost]))
         */
        
        // Like button
        let like = UIButton(frame: CGRect(x: 192, y: 5, width: 60, height: 60))
        // like.translatesAutoresizingMaskIntoConstraints = false
        like.backgroundColor = .clear
        like.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        buttonsView.addSubview(like)
        /*
        buttonsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[button(60)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["button":like]))
         */
        
        // SuperLike button
        let superLike = UIButton(frame: CGRect(x: 260, y: 10, width: 50, height: 50))
        // superLike.translatesAutoresizingMaskIntoConstraints = false
        superLike.backgroundColor = .clear
        superLike.addTarget(self, action: #selector(superLikeButtonPressed), for: .touchUpInside)
        buttonsView.addSubview(superLike)
        /*
        buttonsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[button(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["button":superLike]))
         */
        /*
        // Buttons horisontal constraints
        let buttonsDict = ["v0":goBack,"v1":nope,"v2":boost,"v3":like,"v4":superLike]
        buttonsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-9-[v0(50)]-8-[v1(60)]-8-[v2(50)]-8-[v3(60)]-8-[v4(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: buttonsDict))
        */
        return buttonsView
    }
    
    // MARK: - Suggestions Like and dislike buttons press functions
    
    func goBackButtonPressed() -> Void {
        print("Go back button pressed")
        let getTplus = GetTinderPlus()
        view.addSubview(getTplus.view)
    }
    func nopeButtonPressed() -> Void {
        print("Nope button pressed")
    }
    func boostButtonPressed() -> Void {
        print("Boost button pressed")
    }
    func likeButtonPressed() -> Void {
        print("Like button pressed")
    }
    func superLikeButtonPressed() -> Void {
        print("Super like button pressed")
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
        peopleAroundLoadingView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\((UIScreen.main.bounds.width-80)/2)-[image(80)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["image":userProfileImageView]))
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
        let pageWidth:CGFloat = scrollView.frame.size.width
        let fractionalPage = scrollView.contentOffset.x / pageWidth
        let page:Int = lround(Double(fractionalPage))
        if previousPage != page {
            switch page {
            case 0:
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
                    sCard1.removeFromSuperview()
                    slideView.removeFromSuperview()
                    slideViewPagePrepare(current: currentSuggestion)
                }
            case 2:
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

