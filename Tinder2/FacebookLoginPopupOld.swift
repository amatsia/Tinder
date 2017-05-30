//
//  FacebookLoginPopup.swift
//  FakeTinder
//
//  Created by Hyperactive6 on 07/05/2017.
//  Copyright © 2017 Amatsia Rosenberg. All rights reserved.
//
/*
import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class FacebookLoginPopupOld: UIViewController, { // UIScrollViewDelegate
    
    let scrollView = UIScrollView() // Create the scrollView
    let contentView = UIView() // Create the contentView
    let screenSize: CGRect = UIScreen.main.bounds
    let screenWidth = UIScreen.main.bounds.width
    var subViewsDict: [String:Any] = [:]
    var viewsDict: [String:Any] = [:]
    var dict: [String : AnyObject] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        //Set up and add scrollView and contentView to view
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.delegate = self
        self.scrollView.isScrollEnabled = true
        self.scrollView.backgroundColor = UIColor.lightGray
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.backgroundColor = UIColor.white
        self.scrollView.addSubview(contentView)
        self.view.addSubview(scrollView)
        
        // Constaraints
        viewsDict = ["scrollView":self.scrollView,
                     "contentView":self.contentView]
        self.setViewConstraints(VorH: "H", text: "scrollView")
        self.setViewConstraints(VorH: "V", text: "scrollView")
        self.setViewConstraints(VorH: "H", text: "contentView")
        self.setViewConstraints(VorH: "V", text: "contentView")
        self.view.addConstraint(NSLayoutConstraint.init(item: self.contentView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1, constant: 0))
        
        // Tinder logo
        let imageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(imageView)
        
        // Mail or phone text field
        let mailOrPhoneTextField = UITextField(frame: CGRect(x: 50, y: (screenSize.height*0.55)+20, width: screenWidth-100, height: 70))
        mailOrPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        mailOrPhoneTextField.placeholder = "דוא״ל או טלפון"
        mailOrPhoneTextField.backgroundColor = UIColor.white
        mailOrPhoneTextField.textColor = UIColor.white
        mailOrPhoneTextField.textAlignment = .right
        mailOrPhoneTextField.layer.cornerRadius = 4
        mailOrPhoneTextField.layer.borderWidth = 1
        mailOrPhoneTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.addSubview(mailOrPhoneTextField)
        
        // Password text field
        let passwordTextField = UITextField(frame: CGRect(x: 50, y: (screenSize.height*0.55)+20, width: screenWidth-100, height: 70))
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "סיסמת פייסבוק"
        passwordTextField.backgroundColor = UIColor.white
        passwordTextField.textColor = UIColor.white
        passwordTextField.textAlignment = .right
        passwordTextField.layer.cornerRadius = 4
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.addSubview(passwordTextField)
        
        // Text label 1
        let textLabel1 = UILabel()
        textLabel1.translatesAutoresizingMaskIntoConstraints = false
        textLabel1.text = "Facebook"
        textLabel1.textAlignment = .center
        textLabel1.backgroundColor = UIColor.blue
        textLabel1.textColor = UIColor.white
        textLabel1.sizeToFit()
        self.contentView.addSubview(textLabel1)
        
        // Text label 2
        let textLabel2 = UILabel()
        textLabel2.translatesAutoresizingMaskIntoConstraints = false
        textLabel2.text = "התחבר/י לחשבון פייסבוק כדי להתחבר אל Tinder"
        textLabel2.textColor = UIColor.darkGray
        textLabel2.lineBreakMode = .byWordWrapping
        textLabel2.numberOfLines = 0
        textLabel2.sizeToFit()
        self.contentView.addSubview(textLabel2)
        
        // Text label 3
        let textLabel3 = UILabel()
        textLabel3.translatesAutoresizingMaskIntoConstraints = false
        textLabel3.text = "צור/צרי חשבון"
        textLabel3.textColor = UIColor.lightGray
        textLabel3.textAlignment = .center
        textLabel3.lineBreakMode = .byWordWrapping
        textLabel3.numberOfLines = 0
        textLabel3.sizeToFit()
        self.contentView.addSubview(textLabel3)
        
        // Text label 4
        let textLabel4 = UILabel()
        textLabel4.translatesAutoresizingMaskIntoConstraints = false
        textLabel4.text = "Not now"
        textLabel4.textColor = UIColor.lightGray
        textLabel4.textAlignment = .center
        textLabel4.lineBreakMode = .byWordWrapping
        textLabel4.numberOfLines = 0
        textLabel4.sizeToFit()
        self.contentView.addSubview(textLabel4)
        
        // Text label 5
        let textLabel5 = UILabel()
        textLabel5.translatesAutoresizingMaskIntoConstraints = false
        textLabel5.text = "שכחת את הסיסמה? * מרכז העזרה"
        textLabel5.textColor = UIColor.lightGray
        textLabel5.textAlignment = .center
        textLabel5.lineBreakMode = .byWordWrapping
        textLabel5.numberOfLines = 0
        textLabel5.sizeToFit()
        self.contentView.addSubview(textLabel5)
        
        // Facebook login button
//        let loginButton:FBSDKLoginButton = {
//            let button = FBSDKLoginButton()
//            button.readPermissions = ["email"]
//            return button
//        }()
        let loginButton = UIButton(frame: CGRect(x: 50, y: (screenSize.height*0.55)+20, width: screenSize.width-100, height: 50))
        loginButton.backgroundColor = UIColor.blue
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.setTitle("התחבר",for: .normal)
        loginButton.layer.cornerRadius = 3
        loginButton.addTarget(self, action: #selector(self.btnFBLoginPressed), for: .touchUpInside)
        self.contentView.addSubview(loginButton)
        
        // Back button
        let backButton = UIButton(frame: CGRect(x: (screenSize.width/2)-20, y: (screenSize.height-20), width: 40, height: 40))
        backButton.backgroundColor = UIColor.blue
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.setTitle("Back",for: .normal)
        backButton.layer.cornerRadius = 20
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        self.contentView.addSubview(backButton)
        
        // TextLabels and Back button Constraints
        let lDist:CGFloat = 20
        self.subViewsDict = ["textLabel1":textLabel1,"textLabel2":textLabel2,"textLabel3":textLabel3,"textLabel4":textLabel4,"textLabel5":textLabel5,"mailOrPhoneTextField":mailOrPhoneTextField,"passwordTextField":passwordTextField,"loginButton":loginButton,"backButton":backButton,"imageView":imageView]
        self.setHorizontalConstraints(textLabel: "textLabel1",width:screenWidth,leftDist: 0)
        self.setHorizontalConstraints(textLabel: "textLabel2",width:screenWidth-(lDist*2),leftDist: lDist)
        self.setHorizontalConstraints(textLabel: "textLabel3",width:screenWidth-(lDist*2),leftDist: lDist)
        self.setHorizontalConstraints(textLabel: "textLabel4",width:screenWidth-(lDist*2),leftDist: lDist)
        self.setHorizontalConstraints(textLabel: "textLabel5",width:screenWidth-(lDist*2),leftDist: lDist)
        self.setHorizontalConstraints(textLabel: "imageView",width:40,leftDist: (screenWidth/2)-lDist)
        self.setHorizontalConstraints(textLabel: "mailOrPhoneTextField",width:screenWidth-(lDist*2),leftDist: lDist)
        self.setHorizontalConstraints(textLabel: "passwordTextField",width:screenWidth-(lDist*2),leftDist: lDist)
        self.setHorizontalConstraints(textLabel: "backButton",width:screenWidth-(lDist*2),leftDist: lDist)
        self.setHorizontalConstraints(textLabel: "loginButton",width:screenWidth-(lDist*2),leftDist: lDist)
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[textLabel1(50)]-60-[imageView(60)]-20-[textLabel2]-20-[mailOrPhoneTextField(40)]-0-[passwordTextField(40)]-20-[loginButton(40)]-20-[textLabel3]-10-[textLabel4]-20-[textLabel5]-40-[backButton]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:subViewsDict))
    }
    
    func setViewConstraints(VorH:String, text:String) -> Void {
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "\(VorH):|-0-[\(text)]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: self.viewsDict))
    }
    
    func setHorizontalConstraints(textLabel:String,width:CGFloat,leftDist:CGFloat) -> Void {
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(leftDist)-[\(textLabel)(\(width))]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:self.subViewsDict))
    }
    
//    func loginButtonPressed() -> Void {
//        print("Login Button pressed")
//
//    }
    
    func backButtonPressed() -> Void {
        print("Back Button pressed")
        dismiss(animated: true, completion: nil)
    }
    
    func btnFBLoginPressed(_ sender: AnyObject) {
        print("Facebook login button pressed")
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        self.getFBUserData()
                        fbLoginManager.logOut()
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
    
}*/
