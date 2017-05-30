//
//  ScrollView.swift
//  Tinder
//
//  Created by Hyperactive6 on 15/05/2017.
//  Copyright © 2017 Amatsia Rosenberg. All rights reserved.
//

import UIKit

class ScrollView: UIViewController {
    
    var sView: UIScrollView!
    var iView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let red = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        red.backgroundColor = .red
        let blue = UIView(frame: CGRect(x: 400, y: 100, width: 100, height: 100))
        blue.backgroundColor = .blue
        let rect = CGRect(x: 0, y: 0, width: 700, height: 1500)
        iView = UIView(frame: rect)
        iView.backgroundColor = .green
        sView = UIScrollView(frame: view.bounds)
        sView.backgroundColor = UIColor.black
        sView.contentSize = iView.bounds.size
        sView.autoresizingMask = UIViewAutoresizing.flexibleWidth
        iView.addSubview(red)
        iView.addSubview(blue)
        sView.addSubview(iView)
        view.addSubview(sView)

    }
    
}

/*

 import UIKit
 
 class MainScrollView: UIViewController , UIScrollViewDelegate {
 
 let scrollView = UIScrollView()
 let contentView = UIView()
 var whiteBackground = UIView()
 let imageView = UIImageView(image: #imageLiteral(resourceName: "jon"))
 let leftRound = UIImageView(image: #imageLiteral(resourceName: "jon"))
 let rightRound = UIImageView(image: #imageLiteral(resourceName: "jon"))
 let centerRound = UIImageView(image: #imageLiteral(resourceName: "jon"))
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
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 self.view.backgroundColor = UIColor.black
 
 // ScrollView
 
 self.scrollView.translatesAutoresizingMaskIntoConstraints = false
 self.scrollView.delegate = self
 self.scrollView.isScrollEnabled = true
 self.scrollView.isPagingEnabled = true
 self.scrollView.backgroundColor = UIColor.orange
 self.scrollView.contentSize = contentView.bounds.size
 self.view.addSubview(scrollView)
 self.view.addConstraint(NSLayoutConstraint.init(item: self.scrollView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1, constant: 0))
 self.view.addConstraint(NSLayoutConstraint.init(item: self.scrollView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 3, constant: 0))
 
 // ContentView
 
 self.contentView.translatesAutoresizingMaskIntoConstraints = false
 self.contentView.backgroundColor = UIColor.lightGray
 self.scrollView.addSubview(contentView)
 self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.contentView, attribute: .height, relatedBy: .equal, toItem: self.scrollView, attribute: .height, multiplier: 1, constant: 0))
 self.scrollView.addConstraint(NSLayoutConstraint.init(item: self.contentView, attribute: .width, relatedBy: .equal, toItem: self.scrollView, attribute: .width, multiplier: 0.33, constant: 0))
 
 // Round white background
 
 self.whiteBackground.translatesAutoresizingMaskIntoConstraints = false
 whiteBackground.backgroundColor = UIColor.white
 self.whiteBackground.layer.cornerRadius = screenSize.width
 self.whiteBackground.layer.borderColor = UIColor.darkGray.cgColor
 self.whiteBackground.layer.borderWidth = 2
 self.contentView.addSubview(whiteBackground)
 self.contentView.addConstraint(NSLayoutConstraint.init(item: self.whiteBackground, attribute: .height, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 2, constant: 0))
 self.contentView.addConstraint(NSLayoutConstraint.init(item: self.whiteBackground, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 2, constant: 0))
 self.contentView.addConstraint(NSLayoutConstraint.init(item: self.whiteBackground, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 0))
 self.contentView.addConstraint(NSLayoutConstraint.init(item: self.whiteBackground, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0))
 
 // Menu Bar
 let menuBar = UIView()
 menuBar.translatesAutoresizingMaskIntoConstraints = false
 menuBar.backgroundColor = UIColor.white
 menuBar.layer.borderColor = UIColor.lightGray.cgColor
 menuBar.layer.borderWidth = 1
 self.contentView.addSubview(menuBar)
 self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":menuBar]))
 self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(60)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":menuBar]))
 
 // Menu Bar left button
 
 let mbLeftButton = UIButton()
 mbLeftButton.translatesAutoresizingMaskIntoConstraints = false
 mbLeftButton.backgroundColor = UIColor.orange
 mbLeftButton.setTitle("L", for: .normal) // Change to icon
 mbLeftButton.setTitleColor(UIColor.black, for: .normal)
 mbLeftButton.contentHorizontalAlignment = .center
 mbLeftButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
 mbLeftButton.addTarget(self, action: #selector(menuBarLeftButtonPressed), for: .touchUpInside)
 menuBar.addSubview(mbLeftButton)
 
 // Menu Bar center-left button
 
 let mbCenterLeftButton = UIButton()
 mbCenterLeftButton.translatesAutoresizingMaskIntoConstraints = false
 mbCenterLeftButton.backgroundColor = UIColor.orange
 mbCenterLeftButton.setTitle("CL", for: .normal) // Change to icon
 mbCenterLeftButton.setTitleColor(UIColor.black, for: .normal)
 mbCenterLeftButton.contentHorizontalAlignment = .center
 mbCenterLeftButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
 mbCenterLeftButton.addTarget(self, action: #selector(menuBarCenterLeftButtonPressed), for: .touchUpInside)
 menuBar.addSubview(mbCenterLeftButton)
 
 // Menu Bar center-Right button
 
 let mbCenterRightButton = UIButton()
 mbCenterRightButton.translatesAutoresizingMaskIntoConstraints = false
 mbCenterRightButton.backgroundColor = UIColor.orange
 mbCenterRightButton.setTitle("CR", for: .normal) // Change to icon
 mbCenterRightButton.setTitleColor(UIColor.black, for: .normal)
 mbCenterRightButton.contentHorizontalAlignment = .center
 mbCenterRightButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
 mbCenterRightButton.addTarget(self, action: #selector(menuBarCenterRightButtonPressed), for: .touchUpInside)
 menuBar.addSubview(mbCenterRightButton)
 
 // Menu Bar Right button
 
 let mbRightButton = UIButton()
 mbRightButton.translatesAutoresizingMaskIntoConstraints = false
 mbRightButton.backgroundColor = UIColor.orange
 mbRightButton.setTitle("R", for: .normal) // Change to icon
 mbRightButton.setTitleColor(UIColor.black, for: .normal)
 mbRightButton.contentHorizontalAlignment = .center
 mbRightButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
 mbRightButton.addTarget(self, action: #selector(menuBarRightButtonPressed), for: .touchUpInside)
 menuBar.addSubview(mbRightButton)
 
 // Constraints for menu bar buttons
 let viewDict = ["EL":mbLeftButton,"CL":mbCenterLeftButton,"CR":mbCenterRightButton,"ER":mbRightButton]
 menuBar.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[EL(50)]-[CL(50)][CR(50)]-[ER(50)]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewDict))
 // top
 menuBar.addConstraint(NSLayoutConstraint(item: mbLeftButton, attribute: .top, relatedBy: .equal, toItem: menuBar, attribute: .top, multiplier: 1, constant: 0))
 menuBar.addConstraint(NSLayoutConstraint(item: mbCenterLeftButton, attribute: .top, relatedBy: .equal, toItem: menuBar, attribute: .top, multiplier: 1, constant: 0))
 menuBar.addConstraint(NSLayoutConstraint(item: mbCenterRightButton, attribute: .top, relatedBy: .equal, toItem: menuBar, attribute: .top, multiplier: 1, constant: 0))
 menuBar.addConstraint(NSLayoutConstraint(item: mbRightButton, attribute: .top, relatedBy: .equal, toItem: menuBar, attribute: .top, multiplier: 1, constant: 0))
 // height
 menuBar.addConstraint(NSLayoutConstraint(item: mbLeftButton, attribute: .height, relatedBy: .equal, toItem: menuBar, attribute: .height, multiplier: 1, constant: 0))
 menuBar.addConstraint(NSLayoutConstraint(item: mbCenterLeftButton, attribute: .height, relatedBy: .equal, toItem: menuBar, attribute: .height, multiplier: 1, constant: 0))
 menuBar.addConstraint(NSLayoutConstraint(item: mbCenterRightButton, attribute: .height, relatedBy: .equal, toItem: menuBar, attribute: .height, multiplier: 1, constant: 0))
 menuBar.addConstraint(NSLayoutConstraint(item: mbRightButton, attribute: .height, relatedBy: .equal, toItem: menuBar, attribute: .height, multiplier: 1, constant: 0))
 // Center
 menuBar.addConstraint(NSLayoutConstraint(item: mbCenterRightButton, attribute: .left, relatedBy: .equal, toItem: menuBar, attribute: .centerX, multiplier: 1, constant: 0))
 
 // image
 
 imageView.translatesAutoresizingMaskIntoConstraints = false
 imageView.layer.cornerRadius = 40
 imageView.layer.masksToBounds = true
 contentView.addSubview(imageView)
 self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\((self.screenSize.width-80)/2)-[image(80)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["image":imageView]))
 self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[image(80)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["image":imageView]))
 
 // left round
 
 leftRound.layer.cornerRadius = 30
 leftRound.layer.masksToBounds = true
 contentView.addSubview(leftRound)
 let leftAngle:CGFloat = self.angle*1.2
 self.radius = self.view.frame.width
 self.circleX = self.radius * cos(leftAngle) + self.view.center.x - 30
 self.circleY = self.radius * sin(leftAngle) + 0.0 - 30
 leftRound.frame = CGRect(x: self.circleX, y: self.circleY, width: 60, height: 60)
 
 // center round
 
 centerRound.layer.cornerRadius = 30
 centerRound.layer.masksToBounds = true
 contentView.addSubview(centerRound)
 self.radius = self.view.frame.width
 self.circleX = self.radius * cos(self.angle) + self.view.center.x - 30
 self.circleY = self.radius * sin(self.angle) + 0.0 - 30
 centerRound.frame = CGRect(x: self.circleX, y: self.circleY, width: 60, height: 60)
 
 // right round
 
 rightRound.layer.cornerRadius = 30
 rightRound.layer.masksToBounds = true
 contentView.addSubview(rightRound)
 let rightAngle:CGFloat = self.angle*0.8
 self.radius = self.view.frame.width
 self.circleX = self.radius * cos(rightAngle) + self.view.center.x - 30
 self.circleY = self.radius * sin(rightAngle) + 0.0 - 30
 rightRound.frame = CGRect(x: self.circleX, y: self.circleY, width: 60, height: 60)
 
 // Name label
 
 nameLabel.translatesAutoresizingMaskIntoConstraints = false
 nameLabel.backgroundColor = UIColor.white
 nameLabel.textColor = UIColor.black
 nameLabel.textAlignment = .center
 nameLabel.text = "Jon ,36"  // Change
 nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
 self.contentView.addSubview(nameLabel)
 self.contentView.addConstraint(NSLayoutConstraint.init(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0))
 self.contentView.addConstraint(NSLayoutConstraint.init(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: self.imageView, attribute: .bottom, multiplier: 1, constant: 10))
 
 // Settings button
 
 settingsButton.translatesAutoresizingMaskIntoConstraints = false
 settingsButton.backgroundColor = UIColor.white
 settingsButton.setTitle("הגדרות", for: .normal) // Change - add chain weel icon
 settingsButton.setTitleColor(UIColor.red, for: .normal)
 settingsButton.contentHorizontalAlignment = .center
 settingsButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
 settingsButton.addTarget(self, action: #selector(settingButtonPressed), for: .touchUpInside)
 self.contentView.addSubview(settingsButton)
 self.contentView.addConstraint(NSLayoutConstraint.init(item: settingsButton, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0))
 self.contentView.addConstraint(NSLayoutConstraint.init(item: settingsButton, attribute: .top, relatedBy: .equal, toItem: self.nameLabel, attribute: .bottom, multiplier: 1, constant: 40))
 self.contentView.addConstraint(NSLayoutConstraint.init(item: settingsButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.width/2))
 
 // Tinder plus button
 
 tinderPlusButton.translatesAutoresizingMaskIntoConstraints = false
 tinderPlusButton.backgroundColor = UIColor.white
 tinderPlusButton.setTitle("קבל/י טינדר פלוס", for: .normal) // Change - add chain weel icon
 tinderPlusButton.setTitleColor(UIColor.red, for: .normal)
 tinderPlusButton.contentHorizontalAlignment = .center
 tinderPlusButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
 tinderPlusButton.addTarget(self, action: #selector(tinderPlusButtonPressed), for: .touchUpInside)
 self.contentView.addSubview(tinderPlusButton)
 self.contentView.addConstraint(NSLayoutConstraint.init(item: tinderPlusButton, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0))
 self.contentView.addConstraint(NSLayoutConstraint.init(item: tinderPlusButton, attribute: .top, relatedBy: .equal, toItem: self.nameLabel, attribute: .bottom, multiplier: 1, constant: 40))
 self.contentView.addConstraint(NSLayoutConstraint.init(item: tinderPlusButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: screenSize.width/2))
 
 // Buttom label 1
 let label1 = UILabel()
 label1.translatesAutoresizingMaskIntoConstraints = false
 label1.backgroundColor = UIColor.lightGray
 label1.textColor = UIColor.black
 label1.textAlignment = .center
 label1.text = "להחליק עם חברים"  // Change
 label1.font = UIFont.systemFont(ofSize: 20)
 self.contentView.addSubview(label1)
 self.contentView.addConstraint(NSLayoutConstraint.init(item: label1, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0))
 self.contentView.addConstraint(NSLayoutConstraint.init(item: label1, attribute: .top, relatedBy: .equal, toItem: self.imageView, attribute: .bottom, multiplier: 1, constant: 220))
 
 // Buttom label 2
 let label2 = UILabel()
 label2.translatesAutoresizingMaskIntoConstraints = false
 label2.backgroundColor = UIColor.lightGray
 label2.textColor = UIColor.black
 label2.textAlignment = .center
 label2.text = "התאמה עם קבוצות של חברים בסביבה"  // Change
 label2.font = UIFont.systemFont(ofSize: 15)
 self.contentView.addSubview(label2)
 self.contentView.addConstraint(NSLayoutConstraint.init(item: label2, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0))
 self.contentView.addConstraint(NSLayoutConstraint.init(item: label2, attribute: .top, relatedBy: .equal, toItem: label1, attribute: .bottom, multiplier: 1, constant: 10))
 
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
 self.contentView.addSubview(createGroupeButton)
 self.contentView.addConstraint(NSLayoutConstraint.init(item: createGroupeButton, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0))
 self.contentView.addConstraint(NSLayoutConstraint.init(item: createGroupeButton, attribute: .top, relatedBy: .equal, toItem: label2, attribute: .bottom, multiplier: 1, constant: 20))
 self.contentView.addConstraint(NSLayoutConstraint.init(item: createGroupeButton, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.5, constant: 0))
 self.contentView.addConstraint(NSLayoutConstraint.init(item: createGroupeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30))
 
 }
 
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
 
 func menuBarLeftButtonPressed() -> Void {
 print("Menu bar left button pressed")
 }
 
 func menuBarCenterLeftButtonPressed() -> Void {
 print("Menu bar center-left button pressed")
 }
 
 func menuBarCenterRightButtonPressed() -> Void {
 print("Menu bar center-right button pressed")
 }
 
 func menuBarRightButtonPressed() -> Void {
 print("Menu bar right button pressed")
 }
 
 }

 */


