//
//  phoneLogin.swift
//  FakeTinder
//
//  Created by Hyperactive6 on 26/04/2017.
//  Copyright © 2017 Amatsia Rosenberg. All rights reserved.
//

import UIKit

class PhoneLoginViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let screenSize: CGRect = UIScreen.main.bounds
    let explanationsTextLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Instructions (Red)
        let instructionsTextLabel = UILabel()
        instructionsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        let text1 = "הזן את מספר הטלפון"
        let text2 = "הסלולרי שלך"
        let redText = text1 + "\n" + text2
        instructionsTextLabel.text = redText
        instructionsTextLabel.font = instructionsTextLabel.font.withSize(25)
        instructionsTextLabel.textColor = .red
        instructionsTextLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        instructionsTextLabel.numberOfLines = 0
        instructionsTextLabel.textAlignment = .center
        self.view.addSubview(instructionsTextLabel)
        
        // Country code-number input
        let countryCodeInputTextField = UITextField()
        countryCodeInputTextField.translatesAutoresizingMaskIntoConstraints = false
        countryCodeInputTextField.backgroundColor = .lightGray
        self.view.addSubview(countryCodeInputTextField)

        // Number input
        let numberInputTextField = UITextField()
        numberInputTextField.translatesAutoresizingMaskIntoConstraints = false
        numberInputTextField.backgroundColor = .lightGray
        self.view.addSubview(numberInputTextField)
        
        // Explanations (Gray)
        self.explanationsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        let line1 = "הקש על הבא כדי לאמת את החשבון שלך ב-"
        let line2 = "Account Kit המופעל באמצעות פייסבוק. לא דרוש"
        let line3 = "לך חשבון פייסבוק כדי להשתמש ב-Account Kit."
        let line4 = "ייתכן שתקבל הודעת טקסט לאימות המספר. ייתכן"
        let line5 = "שתחויב בתשלום לפי תעריפי ההודעות והנתונים."
        let line6 = "למד איך פייסבוק משתמשת בפרטים שלך."
        let explanationText = line1 + "\n" + line2 + "\n" + line3 + "\n" + line4 + "\n" + line5 + "\n" + line6
        explanationsTextLabel.text = explanationText
        explanationsTextLabel.font = instructionsTextLabel.font.withSize(12)
        
        let underlineAttriString = NSMutableAttributedString(string: explanationText)
        let range = (explanationText as NSString).range(of: "למד איך פייסבוק משתמשת בפרטים שלך.")
        underlineAttriString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: range)
        explanationsTextLabel.attributedText = underlineAttriString
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.delegate = self
        explanationsTextLabel.addGestureRecognizer(tap)
        explanationsTextLabel.isUserInteractionEnabled = true
        explanationsTextLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        explanationsTextLabel.numberOfLines = 0
        explanationsTextLabel.textAlignment = .center
        explanationsTextLabel.textColor = .lightGray
        self.view.addSubview(explanationsTextLabel)
        
        // Next button - need to change rect to constraints!!
        let nextButton = UIButton()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.backgroundColor = .lightGray
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.setTitle("הבא",for: .normal)
        nextButton.addTarget(self, action: #selector(self.nextButtonPressed), for: .touchUpInside)
        self.view.addSubview(nextButton)
        
        // constraints
        let dict = Dictionary(dictionaryLiteral: ("code", countryCodeInputTextField),("number",numberInputTextField),("explanation",explanationsTextLabel))
        let instractionHorizontalConstraints = NSLayoutConstraint(item: instructionsTextLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let instractionTopConstraints = NSLayoutConstraint(item: instructionsTextLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 100)
        let instractionWidthConstraints = NSLayoutConstraint(item: instructionsTextLabel, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: -80)
        let instractionHeightConstraints = NSLayoutConstraint(item: instructionsTextLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80)
        let phoneInputHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[code(70)]-10-[number]-50-|", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        let codeTopConstraints = NSLayoutConstraint(item: countryCodeInputTextField, attribute: .top, relatedBy: .equal, toItem: instructionsTextLabel, attribute: .bottom, multiplier: 1, constant: 40)
        let codeHeightConstraints = NSLayoutConstraint(item: countryCodeInputTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        let numberTopConstraints = NSLayoutConstraint(item: numberInputTextField, attribute: .top, relatedBy: .equal, toItem: countryCodeInputTextField, attribute: .top, multiplier: 1, constant: 0)
        let numberHeightConstraints = NSLayoutConstraint(item: numberInputTextField, attribute: .height, relatedBy: .equal, toItem: countryCodeInputTextField, attribute: .height, multiplier: 1, constant: 0)
        self.view.addConstraint(NSLayoutConstraint(item: explanationsTextLabel, attribute: .top, relatedBy: .equal, toItem: numberInputTextField, attribute: .bottom, multiplier: 1, constant: 30))
        let explanationHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[explanation]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        let nextTopConstraint = NSLayoutConstraint(item: nextButton, attribute: .top, relatedBy: .equal, toItem: explanationsTextLabel, attribute: .bottom, multiplier: 1, constant: 20)
        let nextCenterXConstraint = NSLayoutConstraint(item: nextButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let nextWidthConstraint = NSLayoutConstraint(item: nextButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: -100)
        let nextHeightConstraint = NSLayoutConstraint(item: nextButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        self.view.addConstraints([instractionHorizontalConstraints,instractionTopConstraints,instractionWidthConstraints,instractionHeightConstraints,codeTopConstraints,codeHeightConstraints,numberTopConstraints,numberHeightConstraints,nextTopConstraint,nextCenterXConstraint,nextWidthConstraint,nextHeightConstraint])
        self.view.addConstraints(phoneInputHorizontalConstraints)
        self.view.addConstraints(explanationHorizontalConstraints)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 65))
        view.addSubview(navBar)
        navBar.barTintColor = .white
        let navItem = UINavigationItem(title: "התחבר אל Tinder")
        navBar.setItems([navItem], animated: false)
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red]
        let barButton = UIBarButtonItem(title: "הקודם", style: .plain, target: self, action: #selector(backButtonPressed))
        barButton.tintColor = .red
        navItem.rightBarButtonItem = barButton
    }
    
    func handleTap(gesture: UITapGestureRecognizer) {
        let text = (self.explanationsTextLabel.text)!
        let range = (text as NSString).range(of: "למד איך פייסבוק משתמשת בפרטים שלך.")
        switch true {
        case gesture.didTapAttributedTextInLabel(label: self.explanationsTextLabel, inRange: range):
            print("Tapped on how Facebook using your details")
        default:
            print("Tapped none")
        }
    }
    
    func nextButtonPressed() {
        print("Next button pressed")
    }
    
    func backButtonPressed() {
        print("Phone login - Back button pressed")
        let mainVC = ScrollViewController()
        present(mainVC, animated: false, completion: nil)
    }

}
