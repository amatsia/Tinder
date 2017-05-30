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
        let text1 = "הזן את מספר הטלפון"
        let text2 = "הסלולרי שלך"
        let redText = text1 + "\n" + text2
        instructionsTextLabel.text = redText
        instructionsTextLabel.font = instructionsTextLabel.font.withSize(25)
        instructionsTextLabel.textColor = .red
        instructionsTextLabel.frame = CGRect(x: 0, y: 60, width: screenSize.width, height: 60)
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
        let nextButton = UIButton(frame: CGRect(x: 50, y: (screenSize.height*0.5), width: screenSize.width-100, height: 50))
        nextButton.backgroundColor = .lightGray
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.setTitle("הבא",for: .normal)
        nextButton.addTarget(self, action: #selector(self.nextButtonPressed), for: .touchUpInside)
        self.view.addSubview(nextButton)
        
        // Back button - need to check how it works on Iphone!!
        let backButton = UIButton(frame: CGRect(x: (screenSize.width/2)-25, y: (screenSize.height*0.6)+50, width: 50, height: 50))
        backButton.backgroundColor = UIColor.blue
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.setTitle("Back",for: .normal)
        backButton.layer.cornerRadius = 25
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        self.view.addSubview(backButton)
        
        // constarints
        let dict = Dictionary(dictionaryLiteral: ("code", countryCodeInputTextField),("number",numberInputTextField),("explanation",explanationsTextLabel))
        let phoneInputhorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[code(70)]-10-[number]-50-|", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        let codeVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-160-[code(40)]|", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        let numberVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-160-[number(40)]|", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        
        self.view.addConstraint(NSLayoutConstraint(item: explanationsTextLabel, attribute: .top, relatedBy: .equal, toItem: numberInputTextField, attribute: .bottom, multiplier: 1, constant: 30))
        
        let explanationHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[explanation]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: dict)
        self.view.addConstraints(phoneInputhorizontalConstraints)
        self.view.addConstraints(codeVerticalConstraints)
        self.view.addConstraints(numberVerticalConstraints)
        self.view.addConstraints(explanationHorizontalConstraints)
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
        print("Back button pressed")
        let mainVC = ScrollViewController()
        present(mainVC, animated: false, completion: nil)
    }

}
