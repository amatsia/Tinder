//
//  ViewController.swift
//  FakeTinder
//
//  Created by Hyperactive6 on 06/04/2017.
//  Copyright © 2017 Amatsia Rosenberg. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ScrollViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate, UIPageViewControllerDelegate, UIPopoverPresentationControllerDelegate {
    
    var termsLabel = UILabel()
    let hidenTextLabel = UILabel()
    let arrowUpButton = UIButton(frame:CGRect(x: UIScreen.main.bounds.width/2-10, y: (UIScreen.main.bounds.height * 0.6)-10, width: 25, height: 20))
    let screenSize: CGRect = UIScreen.main.bounds
    let photoSlideScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6))
    let mainScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 5, height: UIScreen.main.bounds.height))
    var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    var pageControl : UIPageControl = UIPageControl(frame:CGRect(x: 50, y: (UIScreen.main.bounds.height * 0.6), width: UIScreen.main.bounds.width-100, height: 20))
    let loginImages = [#imageLiteral(resourceName: "login1"),#imageLiteral(resourceName: "login2"),#imageLiteral(resourceName: "login3"),#imageLiteral(resourceName: "login4")]
    var dict : [String : AnyObject]!
    var fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Main scroll view
        mainScrollView.delegate = self
        mainScrollView.isScrollEnabled = false
        mainScrollView.isPagingEnabled = false
        mainScrollView.backgroundColor = UIColor.white
        view.addSubview(mainScrollView)
        
        // Photo slide scrollView
        configurePageControl()
        photoSlideScrollView.delegate = self
        mainScrollView.addSubview(photoSlideScrollView)
        for index in 0..<4 {
            frame.origin.x = photoSlideScrollView.frame.size.width * CGFloat(index)
            frame.size = photoSlideScrollView.frame.size
            let imageView = UIImageView(frame: frame)
            imageView.image = loginImages[index]
            photoSlideScrollView.addSubview(imageView)
        }
        photoSlideScrollView.isPagingEnabled = true
        photoSlideScrollView.contentSize = CGSize(width: photoSlideScrollView.frame.size.width * 4, height: photoSlideScrollView.frame.size.height)
        pageControl.addTarget(self, action: Selector(("changePage:")), for: UIControlEvents.valueChanged)
        
        // Arrow up button
        arrowUpButton.setImage(#imageLiteral(resourceName: "arrow-up"), for: .normal)
        arrowUpButton.alpha = 0.0
        arrowUpButton.addTarget(self, action: #selector(scrollDown), for: .touchUpInside)
        mainScrollView.addSubview(arrowUpButton)

        // FaceBook Button
        let facebookLoginButton = UIButton(frame: CGRect(x: 50, y: (screenSize.height*0.6)+20, width: screenSize.width-100, height: 50))
        facebookLoginButton.backgroundColor = UIColor.blue
        facebookLoginButton.setTitle("התחברות עם פייסבוק",for: .normal)
        facebookLoginButton.setTitleColor(UIColor.white, for: .normal)
        facebookLoginButton.layer.cornerRadius = 25
        facebookLoginButton.addTarget(self, action: #selector(facebookLoginButtonPressed), for: .touchUpInside)
        mainScrollView.addSubview(facebookLoginButton)
        
        // Phone Button
        let PhoneLoginButton = UIButton(frame: CGRect(x: 70, y: (screenSize.height*0.6)+85, width: screenSize.width-140, height: 40))
        PhoneLoginButton.backgroundColor = UIColor.white
        PhoneLoginButton.setTitle("התחברות עם מספר טלפון",for: .normal)
        PhoneLoginButton.setTitleColor(UIColor.lightGray, for: .normal)
        PhoneLoginButton.layer.cornerRadius = 20
        PhoneLoginButton.layer.borderWidth = 1
        PhoneLoginButton.layer.borderColor = UIColor.lightGray.cgColor
        PhoneLoginButton.addTarget(self, action: #selector(phoneLoginButtonPressed), for: .touchUpInside)
        mainScrollView.addSubview(PhoneLoginButton)
        
        // termsLabel text
        termsLabel.frame = CGRect(x: 10, y: (screenSize.height)-100, width: screenSize.width-20, height: 60)
        termsLabel.backgroundColor = UIColor.white
        termsLabel.textColor = UIColor.lightGray
        termsLabel.font = self.termsLabel.font.withSize(12)
        let text1 = ".לא נפרסם דבר בשמך בפייסבוק ^"
        let text2 = "בהתחברות, את/ה מסכים לתנאים ולהתניות שלנו וכן למדיניות הפרטיות"
        let buttomText = text1 + "\n" + text2
        termsLabel.text = buttomText
        let underlineAttriString = NSMutableAttributedString(string: buttomText)
        let range1 = (buttomText as NSString).range(of: "לתנאים ולהתניות שלנו")
        underlineAttriString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: range1)
        let range2 = (buttomText as NSString).range(of: "למדיניות הפרטיות")
        underlineAttriString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: range2)
        termsLabel.attributedText = underlineAttriString
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.delegate = self
        termsLabel.addGestureRecognizer(tap)
        termsLabel.isUserInteractionEnabled = true
        termsLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        termsLabel.numberOfLines = 0
        termsLabel.textAlignment = .center
        termsLabel.layer.borderColor = UIColor.lightGray.cgColor
        let borderWidth = 0.5 as CGFloat
        termsLabel.layer.borderWidth = borderWidth
        let mask = UIView(frame: CGRect(x: borderWidth, y: 0, width: self.termsLabel.frame.size.width-borderWidth*2, height: termsLabel.frame.size.height-borderWidth))
        mask.backgroundColor = UIColor.black
        termsLabel.layer.mask = mask.layer;
        mainScrollView.addSubview(self.termsLabel)
        
        // Hiden text
        hidenTextLabel.translatesAutoresizingMaskIntoConstraints = false
        let hidenText1 = getText1()
        let hidenText2 = getText2()
        var attrs = [NSFontAttributeName : UIFont.systemFont(ofSize: 14)]
        let normalString = NSMutableAttributedString(string:hidenText2, attributes:attrs)
        attrs = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)]
        let boldString = NSMutableAttributedString(string:hidenText1, attributes:attrs)
        boldString.append(normalString)
        hidenTextLabel.attributedText = boldString
        hidenTextLabel.textColor = UIColor.lightGray
        hidenTextLabel.lineBreakMode = .byWordWrapping
        hidenTextLabel.numberOfLines = 0
        hidenTextLabel.textAlignment = .center
        hidenTextLabel.sizeToFit()
        hidenTextLabel.alpha = 0.0
        mainScrollView.addSubview(hidenTextLabel)
       mainScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[termsLabel]-0-[hidenTextLabel]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:["termsLabel":termsLabel,"hidenTextLabel":hidenTextLabel]))
    }
    
    func scrollUp() {
        setView(view: termsLabel, alpha: 0.0)
        setView(view: hidenTextLabel, alpha: 1.0)
        setView(view: pageControl, alpha: 0.0)
        setView(view: arrowUpButton, alpha: 1.0)
        mainScrollView.setContentOffset(CGPoint(x: 0, y: 270), animated: true)
    }
    
    func scrollDown() {
        print("Scroll up")
        setView(view: termsLabel, alpha: 1.0)
        setView(view: hidenTextLabel, alpha: 0.0)
        setView(view: pageControl, alpha: 1.0)
        setView(view: arrowUpButton, alpha: 0.0)
        mainScrollView.setContentOffset(CGPoint(x: 0, y: -40), animated: true)
    }
    
    func setView(view: UIView, alpha: CGFloat) {
        UIView.animate(withDuration: 0.2, animations: {
            view.alpha = alpha
        })

    }
    
    func handleTap(gesture: UITapGestureRecognizer) {
        let text = (termsLabel.text)!
        let up = (text as NSString).range(of: "^")
        let termsRange = (text as NSString).range(of: "לתנאים ולהתניות שלנו")
        let privacyRange = (text as NSString).range(of: "למדיניות הפרטיות")
        let firstRow = (text as NSString).range(of: "לא נפרסם דבר בשמך בפייסבוק")
        switch true {
        case gesture.didTapAttributedTextInLabel(label: termsLabel, inRange: up):
            print("Tapped ^ ")
            scrollUp()
        case gesture.didTapAttributedTextInLabel(label: termsLabel, inRange: firstRow):
            print("Tapped first row")
        case gesture.didTapAttributedTextInLabel(label: termsLabel, inRange: termsRange):
            print("Tapped terms")
            termsOfUsePressed()
        case gesture.didTapAttributedTextInLabel(label: termsLabel, inRange: privacyRange):
            print("Tapped privacy")
            privacyPolicyPressed()
        default:
            print("Tapped none")
        }
    }
    
    func facebookLoginButtonPressed() {
        print("Facebook login button pressed")
        fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        self.getFBUserData()
                        self.fbLoginManager.logOut()
                        self.goToMainView()
                    }
                }
            }
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                }
            })
        }
    }
    
    func phoneLoginButtonPressed() {
        print("Phone login button pressed")
        let phoneLoginVC = PhoneLoginViewController()
        present(phoneLoginVC, animated: false, completion: nil)
    }
    func termsOfUsePressed() {
        print("Terms Of Use pressed")
        let tOUVC = TermsOfUse()
        present(tOUVC, animated: false, completion: nil)
    }
    func privacyPolicyPressed() {
        print("Privacy Policy pressed")
        let pPVC = PrivacyPolicy()
        present(pPVC, animated: false, completion: nil)
    }
    
    
    func configurePageControl() {

        self.pageControl.numberOfPages = loginImages.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.red
        self.mainScrollView.addSubview(pageControl)
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * photoSlideScrollView.frame.size.width
        photoSlideScrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    func goToMainView() {
        let mainVC = MainScrollView()
        present(mainVC, animated: false, completion: nil)
    }
    
    func getText1() -> String {
        let text = "אנו מתייחסים לפרטיות שלך במלוא הרצינות\n\n"
        return text
    }
    
    func getText2() -> String {
        let text = "לא נפרסם שום דבר בפייסבוק\n\nמשתמשים אחרים אף פעם לא ידעו אם עשית להם\nלייק, אלא אם גם הם עשו לך לייק\n\nמשתמשים אחרים לא יכולים ליצור עמך קשר אלא אם\nכבר הותאמתם\n\nהמיקום שלך לא גלוי בפני משתמשים אחרים\n\n\n\n\n"
        return text
    }
    
}

extension UITapGestureRecognizer {
    
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x:(labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y:(labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        let locationOfTouchInTextContainer = CGPoint(x:(locationOfTouchInLabel.x - textContainerOffset.x), y:(locationOfTouchInLabel.y - textContainerOffset.y))
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
    
}





