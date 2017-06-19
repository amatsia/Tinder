//
//  Settings.swift
//  FakeTinder
//
//  Created by Hyperactive6 on 09/05/2017.
//  Copyright © 2017 Amatsia Rosenberg. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class Settings: UIViewController, UIScrollViewDelegate {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let screenSize: CGRect = UIScreen.main.bounds
    var selectedSearchRange = UILabel()
    var kmButton = UIButton()
    var mileButton = UIButton()
    var kmOrMile = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up and add scrollView and contentView to view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.init(colorLiteralRed: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        // ScrollView and contentView constaraints
        let viewsDict = ["scrollView":self.scrollView,
                         "contentView":self.contentView]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[scrollView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[scrollView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[contentView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[contentView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        scrollView.addConstraint(NSLayoutConstraint.init(item: contentView, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1, constant: 0))
        
        // Buttons and labels
        let tPlusButton = addButton(titleColor: UIColor.red, title: "קבל/י טינדר פלוס", fontSize: 20)
        let moreBoostsButton = addButton(titleColor: UIColor.blue, title: "לקבלת בוסטים נוספים", fontSize: 18)
        let moreSuperLikesButton = addButton(titleColor: UIColor.cyan, title: "צריך/ה עוד Super Likes?", fontSize: 18)
        let discoverSetHeader = addLabel(text:"הגדרות גילוי",textColor:.black,fontSize:20,alignment:.left,bgColor:.clear)
        let setLocationButton = addButton(titleColor: UIColor.black, title: "מחליק ב- המיקום הנוכחי שלי", fontSize: 18)
        let locExp = addLabel(text:"שנה/י את מיקום הדפדוף שלך כדי לראות את חברי טינדר בערים אחרות",textColor:.darkGray,fontSize:14,alignment:.right,bgColor:.clear)
        let genderSelection = genderSelectionViewSetup()
        let serchRange = searchRangeViewSetup()
        let showMe = showMeViewSetup()
        let showMeExp = addLabel(text:"ההפעלה תציג את הפרופיל שלך ךמשתמשים ומשתמשות רווקים באזורך",textColor:.darkGray,fontSize:14,alignment:.right,bgColor:.clear)
        let slideWithFriendsView = slideWithFriendsViewSetup()
        let slideWithFriendsExp = addLabel(text:"הפעלת תכונה זו תאפשר לחבריך לאתר אותך ולהזמין אותך להחליק יחד",textColor:.darkGray,fontSize:14,alignment:.right,bgColor:.clear)
        let internetProfile = internetProfileViewSetup()
        let appSetHeader = addLabel(text:"הגדרות היישום",textColor:.black,fontSize:20,alignment:.left,bgColor:.clear)
        let messages = messagesViewSetup()
        let distance = distanceViewSetup()
        let contact = addLabel(text:"יצירת קשר",textColor:.black,fontSize:20,alignment:.left,bgColor:.clear)
        let support = supportViewSetup()
        let shareTinder = shareTinderViewSetup()
        let statutory = statutoryViewSetup()
        let disconnect = logoutButtonSetup()
        let logoImageView = logoImageViewSetup()
        let version = addLabel(text:"Version 7.5.1",textColor:.darkGray,fontSize:16,alignment:.center,bgColor:.clear)
        let deleteAccount = deleteAccountViewSetup()
        
        contentView.addSubview(tPlusButton)
        contentView.addSubview(moreBoostsButton)
        contentView.addSubview(moreSuperLikesButton)
        contentView.addSubview(discoverSetHeader)
        contentView.addSubview(setLocationButton)
        contentView.addSubview(locExp)
        contentView.addSubview(genderSelection)
        contentView.addSubview(serchRange)
        contentView.addSubview(showMe)
        contentView.addSubview(showMeExp)
        contentView.addSubview(slideWithFriendsView)
        contentView.addSubview(slideWithFriendsExp)
        contentView.addSubview(internetProfile)
        contentView.addSubview(appSetHeader)
        contentView.addSubview(messages)
        contentView.addSubview(distance)
        contentView.addSubview(contact)
        contentView.addSubview(support)
        contentView.addSubview(shareTinder)
        contentView.addSubview(statutory)
        contentView.addSubview(disconnect)
        contentView.addSubview(logoImageView)
        contentView.addSubview(version)
        contentView.addSubview(deleteAccount)
        
        // Constraints
        let buttonsDict = ["tPlusButton" : tPlusButton, "moreBoostsButton":moreBoostsButton,"moreSuperLikesButton":moreSuperLikesButton,"setLocationButton":setLocationButton,"discoverSetHeader":discoverSetHeader,"locExp":locExp,"genderSelection":genderSelection,"serchRange":serchRange,"showMe":showMe,"showMeExp":showMeExp,"slideWithFriendsView":slideWithFriendsView,"slideWithFriendsExp":slideWithFriendsExp,"internetProfile":internetProfile,"appSetHeader":appSetHeader,"messages":messages,"distance":distance,"contact":contact,"support":support,"shareTinder":shareTinder,"statutory":statutory,"disconnect":disconnect,"logoImageView":logoImageView,"version":version,"deleteAccount":deleteAccount]
        setButtonHorizontalConstraints(button: tPlusButton)
        setButtonHorizontalConstraints(button: moreBoostsButton)
        setButtonHorizontalConstraints(button: moreSuperLikesButton)
        setButtonHorizontalConstraints(button: setLocationButton)
        setLabelHorizontalConstraints(label: discoverSetHeader)
        setLabelHorizontalConstraints(label: locExp)
        setViewHorizontalConstraints(view: genderSelection)
        setViewHorizontalConstraints(view: serchRange)
        setViewHorizontalConstraints(view: showMe)
        setLabelHorizontalConstraints(label: showMeExp)
        setViewHorizontalConstraints(view: slideWithFriendsView)
        setLabelHorizontalConstraints(label: slideWithFriendsExp)
        setViewHorizontalConstraints(view: internetProfile)
        setLabelHorizontalConstraints(label: appSetHeader)
        setViewHorizontalConstraints(view: messages)
        setViewHorizontalConstraints(view: distance)
        setLabelHorizontalConstraints(label: contact)
        setViewHorizontalConstraints(view: support)
        setViewHorizontalConstraints(view: shareTinder)
        setViewHorizontalConstraints(view: statutory)
        setViewHorizontalConstraints(view: disconnect)
        setLogoImageViewHorizontalConstraints(view: logoImageView)
        setLabelHorizontalConstraints(label: version)
        setViewHorizontalConstraints(view: deleteAccount)
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[tPlusButton(40)]-20-[moreBoostsButton(40)]-20-[moreSuperLikesButton(40)]-10-[discoverSetHeader(20)]-10-[setLocationButton(40)]-8-[locExp]-20-[genderSelection(100)]-20-[serchRange(80)]-20-[showMe(40)]-8-[showMeExp]-20-[slideWithFriendsView(40)]-8-[slideWithFriendsExp]-20-[internetProfile(100)]-10-[appSetHeader(20)]-10-[messages(150)]-20-[distance(120)]-10-[contact(20)]-10-[support(40)]-20-[shareTinder(70)]-20-[statutory(130)]-20-[disconnect(40)]-25-[logoImageView(70)]-0-[version]-25-[deleteAccount(40)]-40-|", options: NSLayoutFormatOptions(), metrics: nil, views: buttonsDict))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 65))
        contentView.addSubview(navBar)
        navBar.barTintColor = .white
        let navItem = UINavigationItem(title: "הגדרות")
        navBar.setItems([navItem], animated: false)
        let barButton = UIBarButtonItem(title: "סיום", style: .plain, target: self, action: #selector(backButtonPressed))
        barButton.tintColor = .red
        navItem.leftBarButtonItem = barButton

    }
    
    func setButtonHorizontalConstraints(button:UIButton) -> Void {
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[button]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["button":button]))
    }
    func setLabelHorizontalConstraints(label:UILabel) -> Void {
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[label]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["label":label]))
    }
    func setViewHorizontalConstraints(view:UIView) -> Void {
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[view]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["view":view]))
    }
    
    func setImageViewHorizontalConstraints(view:UIView) -> Void {
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-162-[view]-162-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["view":view]))
    }
    
    func setLogoImageViewHorizontalConstraints(view:UIView) -> Void {
        let logoWidth:CGFloat = 55
        let dist = (screenSize.width - logoWidth) / 2
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(dist)-[view(\(logoWidth))]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["view":view]))
    }
    
    func addButton(titleColor: UIColor , title: String, fontSize: CGFloat) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 3
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        button.titleLabel?.textAlignment = .center
        return button
    }
    
    func addLabel(text:String,textColor:UIColor,fontSize:CGFloat,alignment:NSTextAlignment,bgColor:UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = alignment
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.layer.cornerRadius = 3
        label.layer.backgroundColor = bgColor.cgColor
        return label
    }
    
    func genderSelectionViewSetup() -> UIView {
        let view = viewSetup()
        let genderSelection = addLabel(text:"הראה לי",textColor:.red,fontSize:14,alignment:.left,bgColor:.clear)
        genderSelection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genderSelection)
        view.addConstraint(NSLayoutConstraint(item: genderSelection, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: genderSelection, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        let mans = addLabel(text:"גברים",textColor:.black,fontSize:14,alignment:.left,bgColor:.clear)
        mans.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mans)
        view.addConstraint(NSLayoutConstraint(item: mans, attribute: .top, relatedBy: .equal , toItem: genderSelection, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: mans, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        let womans = addLabel(text:"נשים",textColor:.black,fontSize:14,alignment:.left,bgColor:.clear)
        womans.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(womans)
        view.addConstraint(NSLayoutConstraint(item: womans, attribute: .top, relatedBy: .equal , toItem: mans, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: womans, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        let manSwitch = switchSetup()
        manSwitch.addTarget(self, action: #selector(manSwitchSelector), for: .valueChanged)
        manSwitch.setOn(Gender.isLookingForMale, animated: false)
        view.addSubview(manSwitch)
        view.addConstraint(NSLayoutConstraint(item: manSwitch, attribute: .bottom, relatedBy: .equal , toItem: mans, attribute: .bottom, multiplier: 1, constant: 3))
        view.addConstraint(NSLayoutConstraint(item: manSwitch, attribute: .trailing, relatedBy: .equal , toItem: view, attribute: .trailing, multiplier: 1, constant: -10))
        let womanSwitch = switchSetup()
        womanSwitch.addTarget(self, action: #selector(womanSwitchSelector), for: .valueChanged)
        womanSwitch.setOn(Gender.isLookingForFemale, animated: false)
        view.addSubview(womanSwitch)
        view.addConstraint(NSLayoutConstraint(item: womanSwitch, attribute: .bottom, relatedBy: .equal , toItem: womans, attribute: .bottom, multiplier: 1, constant: 3))
        view.addConstraint(NSLayoutConstraint(item: womanSwitch, attribute: .trailing, relatedBy: .equal , toItem: view, attribute: .trailing, multiplier: 1, constant: -10))
        return view
    }
    
    func searchRangeViewSetup() -> UIView {
        let view = viewSetup()
        let searchRangeTitle = addLabel(text: "מרחק חיפוש", textColor: .red, fontSize: 14, alignment: .left, bgColor: .white)
        searchRangeTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchRangeTitle)
        view.addConstraint(NSLayoutConstraint(item: searchRangeTitle, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: searchRangeTitle, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        let slider = sliderSetup()
        view.addSubview(slider)
        view.addConstraint(NSLayoutConstraint(item: slider, attribute: .bottom, relatedBy: .equal , toItem: view, attribute: .bottom, multiplier: 1, constant: -10))
        view.addConstraint(NSLayoutConstraint(item: slider, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: slider, attribute: .trailing, relatedBy: .equal , toItem: view, attribute: .trailing, multiplier: 1, constant: -20))
        selectedSearchRange = addLabel(text: "\(Int(slider.value)) ק“מ", textColor: .black, fontSize: 14, alignment: .right, bgColor: .clear)
        selectedSearchRange.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectedSearchRange)
        view.addConstraint(NSLayoutConstraint(item: selectedSearchRange, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: selectedSearchRange, attribute: .trailing, relatedBy: .equal , toItem: view, attribute: .trailing, multiplier: 1, constant: -10))
        return view
    }

    func showMeViewSetup() -> UIView {
        let view = viewSetup()
        let showMeSwitch = switchSetup()
        showMeSwitch.addTarget(self, action: #selector(showMeSwitchSelector), for: .valueChanged)
        view.addSubview(showMeSwitch)
        view.addConstraint(NSLayoutConstraint(item: showMeSwitch, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 8))
        view.addConstraint(NSLayoutConstraint(item: showMeSwitch, attribute: .trailing, relatedBy: .equal , toItem: view, attribute: .trailing, multiplier: 1, constant: -10))
        let showMe = addLabel(text:"הצג אותי בטינדר",textColor:.black,fontSize:14,alignment:.right,bgColor:.clear)
        showMe.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(showMe)
        view.addConstraint(NSLayoutConstraint(item: showMe, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: showMe, attribute: .trailing, relatedBy: .equal , toItem: showMeSwitch, attribute: .leading, multiplier: 1, constant: -5))
        return view
    }
    
    func slideWithFriendsViewSetup() -> UIView {
        let view = viewSetup()
        let slideWithFriendsSwitch = switchSetup()
        slideWithFriendsSwitch.addTarget(self, action: #selector(slideWithFriendsSwitchSelector), for: .valueChanged)
        view.addSubview(slideWithFriendsSwitch)
        view.addConstraint(NSLayoutConstraint(item: slideWithFriendsSwitch, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 8))
        view.addConstraint(NSLayoutConstraint(item: slideWithFriendsSwitch, attribute: .trailing, relatedBy: .equal , toItem: view, attribute: .trailing, multiplier: 1, constant: -10))
        let slideWithFriendsTitle = addLabel(text: "להחליק עם חברים", textColor: .black, fontSize: 14, alignment: .left, bgColor: .white)
        slideWithFriendsTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slideWithFriendsTitle)
        view.addConstraint(NSLayoutConstraint(item: slideWithFriendsTitle, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: slideWithFriendsTitle, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        return view
    }
    
    func internetProfileViewSetup() -> UIView {
        let view = viewSetup()
        let internetProfile = addLabel(text: "פרופיל אינטרנט", textColor: .red, fontSize: 14, alignment: .left, bgColor: .white)
        internetProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(internetProfile)
        view.addConstraint(NSLayoutConstraint(item: internetProfile, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: internetProfile, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        let userName = addLabel(text: "שם משתמש", textColor: .black, fontSize: 14, alignment: .left, bgColor: .white)
        userName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userName)
        view.addConstraint(NSLayoutConstraint(item: userName, attribute: .top, relatedBy: .equal , toItem: internetProfile, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: userName, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        let askYours = addLabel(text: "< בקשו את שלכם", textColor: .darkGray, fontSize: 14, alignment: .right, bgColor: .white)
        askYours.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(askYours)
        view.addConstraint(NSLayoutConstraint(item: askYours, attribute: .top, relatedBy: .equal , toItem: internetProfile, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: askYours, attribute: .trailing, relatedBy: .equal , toItem: view, attribute: .trailing, multiplier: 1, constant: -10))
        let askYoursExp = addLabel(text: "צור/צרי שם משתמש. שתף/י את שם המשתמש שלך. כך, אנשים מכל רחבי העולם יוכלו לדפדף עליך ימינה בטינדר", textColor: .darkGray, fontSize: 10, alignment: .right, bgColor: .white)
        askYoursExp.translatesAutoresizingMaskIntoConstraints = false
        askYoursExp.lineBreakMode = .byWordWrapping
        askYoursExp.numberOfLines = 0
        view.addSubview(askYoursExp)
        view.addConstraint(NSLayoutConstraint(item: askYoursExp, attribute: .top, relatedBy: .equal , toItem: askYours, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: askYoursExp, attribute: .trailing, relatedBy: .equal , toItem: view, attribute: .trailing, multiplier: 1, constant: -10))
        view.addConstraint(NSLayoutConstraint(item: askYoursExp, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        return view
    }
    
    func messagesViewSetup() -> UIView {
        let view = viewSetup()
        let messagesTitle = addLabel(text:"הודעות",textColor:.red,fontSize:14,alignment:.left,bgColor:.clear)
        messagesTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(messagesTitle)
        view.addConstraint(NSLayoutConstraint(item: messagesTitle, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: messagesTitle, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        let newmatches = addLabel(text:"התאמות חדשות",textColor:.black,fontSize:14,alignment:.left,bgColor:.clear)
        newmatches.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newmatches)
        view.addConstraint(NSLayoutConstraint(item: newmatches, attribute: .top, relatedBy: .equal , toItem: messagesTitle, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: newmatches, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        let messages = addLabel(text:"הודעות",textColor:.black,fontSize:14,alignment:.left,bgColor:.clear)
        messages.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(messages)
        view.addConstraint(NSLayoutConstraint(item: messages, attribute: .top, relatedBy: .equal , toItem: newmatches, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: messages, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        let likeToMessages = addLabel(text:"לייקים להודעות",textColor:.black,fontSize:14,alignment:.left,bgColor:.clear)
        likeToMessages.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(likeToMessages)
        view.addConstraint(NSLayoutConstraint(item: likeToMessages, attribute: .top, relatedBy: .equal , toItem: messages, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: likeToMessages, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        let superLikes = addLabel(text:"Super Likes",textColor:.black,fontSize:14,alignment:.left,bgColor:.clear)
        superLikes.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(superLikes)
        view.addConstraint(NSLayoutConstraint(item: superLikes, attribute: .top, relatedBy: .equal , toItem: likeToMessages, attribute: .bottom, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: superLikes, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        let newmatchesSwitch = switchSetup()
        newmatchesSwitch.addTarget(self, action: #selector(newMatchesSwitchSelector), for: .valueChanged)
        view.addSubview(newmatchesSwitch)
        view.addConstraint(NSLayoutConstraint(item: newmatchesSwitch, attribute: .bottom, relatedBy: .equal , toItem: newmatches, attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: newmatchesSwitch, attribute: .trailing, relatedBy: .equal , toItem: view, attribute: .trailing, multiplier: 1, constant: -10))
        let messagesSwitch = switchSetup()
        messagesSwitch.addTarget(self, action: #selector(messagesSwitchSelector), for: .valueChanged)
        view.addSubview(messagesSwitch)
        view.addConstraint(NSLayoutConstraint(item: messagesSwitch, attribute: .bottom, relatedBy: .equal , toItem: messages, attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: messagesSwitch, attribute: .trailing, relatedBy: .equal , toItem: view, attribute: .trailing, multiplier: 1, constant: -10))
        let likeToMessageSwitch = switchSetup()
        likeToMessageSwitch.addTarget(self, action: #selector(likeToMessageSwitchSelector), for: .valueChanged)
        view.addSubview(likeToMessageSwitch)
        view.addConstraint(NSLayoutConstraint(item: likeToMessageSwitch, attribute: .bottom, relatedBy: .equal , toItem: likeToMessages, attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: likeToMessageSwitch, attribute: .trailing, relatedBy: .equal , toItem: view, attribute: .trailing, multiplier: 1, constant: -10))
        let superLikesSwitch = switchSetup()
        superLikesSwitch.addTarget(self, action: #selector(superLikesSwitchSelector), for: .valueChanged)
        view.addSubview(superLikesSwitch)
        view.addConstraint(NSLayoutConstraint(item: superLikesSwitch, attribute: .bottom, relatedBy: .equal , toItem: superLikes, attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: superLikesSwitch, attribute: .trailing, relatedBy: .equal , toItem: view, attribute: .trailing, multiplier: 1, constant: -10))
        return view
    }
    
    func distanceViewSetup() -> UIView {
        let view = viewSetup()
        let distanceTitle = addLabel(text: "הצג מרחקים ב-", textColor: .red, fontSize: 14, alignment: .left, bgColor: .white)
        distanceTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(distanceTitle)
        view.addConstraint(NSLayoutConstraint(item: distanceTitle, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: distanceTitle, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        kmOrMile = addLabel(text: "ק״מ", textColor: .black, fontSize: 14, alignment: .right, bgColor: .clear)
        kmOrMile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(kmOrMile)
        view.addConstraint(NSLayoutConstraint(item: kmOrMile, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: kmOrMile, attribute: .trailing, relatedBy: .equal , toItem: view, attribute: .trailing, multiplier: 1, constant: -10))
        kmButton = setButton(title: "ק״מ")
        kmButton.backgroundColor = .red
        kmButton.setTitleColor(.white, for: .normal)
        kmButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        kmButton.addTarget(self, action: #selector(kmButtonPressed), for: .touchUpInside)
        view.addSubview(kmButton)
        view.addConstraint(NSLayoutConstraint(item: kmButton, attribute: .top, relatedBy: .equal, toItem: distanceTitle, attribute: .bottom, multiplier: 1, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: kmButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 25))
        view.addConstraint(NSLayoutConstraint(item: kmButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
        view.addConstraint(NSLayoutConstraint(item: kmButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        mileButton = setButton(title: "מייל")
        mileButton.backgroundColor = .clear
        mileButton.setTitleColor(.darkGray, for: .normal)
        mileButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        mileButton.addTarget(self, action: #selector(mileButtonPressed), for: .touchUpInside)
        view.addSubview(mileButton)
        view.addConstraint(NSLayoutConstraint(item: mileButton, attribute: .top, relatedBy: .equal, toItem: distanceTitle, attribute: .bottom, multiplier: 1, constant: 20))
        view.addConstraint(NSLayoutConstraint(item: mileButton, attribute: .leading, relatedBy: .equal, toItem: kmButton, attribute: .trailing, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: mileButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
        view.addConstraint(NSLayoutConstraint(item: mileButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -25))
        return view
    }
    
    func kmButtonPressed() -> Void {
        print("KM button pressed")
        kmButton.backgroundColor = .red
        kmButton.setTitleColor(.white, for: .normal)
        mileButton.backgroundColor = .clear
        mileButton.setTitleColor(.darkGray, for: .normal)
        kmOrMile.text = "ק״מ"
    }
    
    func mileButtonPressed() -> Void {
        print("Mile button pressed")
        mileButton.backgroundColor = .red
        mileButton.setTitleColor(.white, for: .normal)
        kmButton.backgroundColor = .clear
        kmButton.setTitleColor(.darkGray, for: .normal)
        kmOrMile.text = "מייל"
    }
    
    func setButton(title:String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }
    
    func supportViewSetup() -> UIView {
        let view = viewSetup()
        let helpAndSupport = addLabel(text: "עזרה ותמיכה", textColor: .black, fontSize: 18, alignment: .center, bgColor: .clear)
        helpAndSupport.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(helpAndSupport)
        view.addConstraint(NSLayoutConstraint(item: helpAndSupport, attribute: .centerX, relatedBy: .equal , toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: helpAndSupport, attribute: .centerY, relatedBy: .equal , toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        return view
    }
    
    func shareTinderViewSetup() -> UIView {
        let view = viewSetup()
        let shareTinder = addLabel(text: "שתף/י את טינדר", textColor: .black, fontSize: 14, alignment: .left, bgColor: .clear)
        shareTinder.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shareTinder)
        view.addConstraint(NSLayoutConstraint(item: shareTinder, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: shareTinder, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 10))
        let reBuy = addLabel(text: "שחזר רכישה", textColor: .black, fontSize: 14, alignment: .left, bgColor: .clear)
        reBuy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reBuy)
        view.addConstraint(NSLayoutConstraint(item: reBuy, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: reBuy, attribute: .top, relatedBy: .equal , toItem: shareTinder, attribute: .bottom, multiplier: 1, constant: 10))
        return view
    }
    
    func statutoryViewSetup() -> UIView {
        let view = viewSetup()
        let statutory = addLabel(text: "משפטי", textColor: .red, fontSize: 14, alignment: .left, bgColor: .clear)
        statutory.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statutory)
        view.addConstraint(NSLayoutConstraint(item: statutory, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: statutory, attribute: .top, relatedBy: .equal , toItem: view, attribute: .top, multiplier: 1, constant: 10))
        let license = addLabel(text: "רישיונות", textColor: .black, fontSize: 14, alignment: .left, bgColor: .clear)
        license.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(license)
        view.addConstraint(NSLayoutConstraint(item: license, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: license, attribute: .top, relatedBy: .equal , toItem: statutory, attribute: .bottom, multiplier: 1, constant: 10))
        let privacy = addLabel(text: "מדיניות שמירה על פרטיות", textColor: .black, fontSize: 14, alignment: .left, bgColor: .clear)
        privacy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(privacy)
        view.addConstraint(NSLayoutConstraint(item: privacy, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: privacy, attribute: .top, relatedBy: .equal , toItem: license, attribute: .bottom, multiplier: 1, constant: 10))
        let terms = addLabel(text: "תנאי שירות", textColor: .black, fontSize: 14, alignment: .left, bgColor: .clear)
        terms.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(terms)
        view.addConstraint(NSLayoutConstraint(item: terms, attribute: .leading, relatedBy: .equal , toItem: view, attribute: .leading, multiplier: 1, constant: 10))
        view.addConstraint(NSLayoutConstraint(item: terms, attribute: .top, relatedBy: .equal , toItem: privacy, attribute: .bottom, multiplier: 1, constant: 10))
        return view
    }
    
    func logoutButtonSetup() -> UIButton {
        let logOut = UIButton()
        logOut.setTitle("התנתקות מהמערכת", for: .normal)
        logOut.layer.cornerRadius = 3
        logOut.translatesAutoresizingMaskIntoConstraints = false
        logOut.setTitleColor(.black, for: .normal)
        logOut.titleLabel?.textAlignment = .center
        logOut.backgroundColor = .white
        logOut.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        logOut.addTarget(self, action: #selector(logOutButtonPressed), for: .touchUpInside)
        return logOut
    }
    
    func logOutButtonPressed() -> Void {
        print("LogOut Button Pressed")
        FBSDKLoginManager().logOut()
        let mainScrollViewController = ScrollViewController()
        present(mainScrollViewController, animated: false)
    }
    
    func logoImageViewSetup() -> UIImageView {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "tinderLogo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        return imageView
    }
    
    func deleteAccountViewSetup() -> UIView {
        let view = viewSetup()
        let deleteAccount = addLabel(text: "מחיקת חשבון", textColor: .red, fontSize: 16, alignment: .center, bgColor: .clear)
        deleteAccount.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deleteAccount)
        view.addConstraint(NSLayoutConstraint(item: deleteAccount, attribute: .centerX, relatedBy: .equal , toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: deleteAccount, attribute: .centerY, relatedBy: .equal , toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        return view
    }
    
    func viewSetup() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 3
        return view
    }
    
    func switchSetup() -> UISwitch {
        let mySwitch = UISwitch()
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        mySwitch.tintColor = .lightGray
        mySwitch.onTintColor = .red
        mySwitch.transform = CGAffineTransform(scaleX: 0.5, y: 0.4)
        return mySwitch
    }
    
    func sliderSetup() -> UISlider {
        let mySlider = UISlider()
        mySlider.translatesAutoresizingMaskIntoConstraints  = false
        mySlider.minimumValue = 2
        mySlider.maximumValue = 161
        mySlider.isContinuous = true
        mySlider.tintColor = .red
        mySlider.value = 80
        mySlider.transform = CGAffineTransform(scaleX: 1, y: 0.8)
        mySlider.addTarget(self, action: #selector(searchSliderValueDidChange), for: .valueChanged)
        return mySlider
    }
    
    func manSwitchSelector(sender:UISwitch!) -> Void {
        if (sender.isOn == true){
            print("Man switch turn ON")
            Gender.isLookingForMale = true
        }
        else{
            print("Man switch turn OFF")
            Gender.isLookingForMale = false
        }
    }
    
    func womanSwitchSelector(sender:UISwitch!) -> Void {
        if (sender.isOn == true){
            print("Woman switch turn ON")
            Gender.isLookingForFemale = true
        }
        else{
            print("Woman switch turn OFF")
            Gender.isLookingForFemale = false
        }
    }
    
    func searchSliderValueDidChange(sender:UISlider!)
    {
        selectedSearchRange.text = "\(Int(sender.value)) ק“מ"
        print("Slider value changed. new value is: \(Int(sender.value))")
    }

    func showMeSwitchSelector(sender:UISwitch!) -> Void {
        if (sender.isOn == true){
            print("Show me switch turn ON")
        }
        else{
            print("Show me switch turn OFF")
        }
    }
    
    func slideWithFriendsSwitchSelector(sender:UISwitch!) -> Void {
        if (sender.isOn == true){
            print("Slide with friends switch turn ON")
        }
        else{
            print("Slide with friends switch turn OFF")
        }
    }
    
    func newMatchesSwitchSelector(sender:UISwitch!) -> Void {
        if (sender.isOn == true){
            print("New matches switch turn ON")
        }
        else{
            print("New matches switch turn OFF")
        }
    }
    func messagesSwitchSelector(sender:UISwitch!) -> Void {
        if (sender.isOn == true){
            print("messages switch turn ON")
        }
        else{
            print("messages switch turn OFF")
        }
    }
    func likeToMessageSwitchSelector(sender:UISwitch!) -> Void {
        if (sender.isOn == true){
            print("Like to messages switch turn ON")
        }
        else{
            print("Like to messages switch turn OFF")
        }
    }
    func superLikesSwitchSelector(sender:UISwitch!) -> Void {
        if (sender.isOn == true){
            print("Super likes switch turn ON")
        }
        else{
            print("Super likes switch turn OFF")
        }
    }

    func backButtonPressed() -> Void {
        print("Setting - Back button pressed")
        let mainScrollVC = MainScrollView()
        present(mainScrollVC, animated: false, completion: nil)
    }
}


