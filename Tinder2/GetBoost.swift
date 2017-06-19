//
//  GetBoost.swift
//  Tinder2
//
//  Created by Hyperactive6 on 14/06/2017.
//  Copyright © 2017 Amatsia Rosenberg. All rights reserved.
//

import UIKit

class GetBoost : UIViewController {
    
    let getBoostView = UIView()
    let getBoostBackgroundView = UIView()
    let screenWidth = UIScreen.main.bounds.width
    let choose1Boost = UIButton()
    let choose5Boosts = UIButton()
    let choose10Boosts = UIButton()
    var title1 = NSMutableAttributedString(string: "")
    var title2 = NSMutableAttributedString(string: "")
    var title3 = NSMutableAttributedString(string: "")
    var upperLabelView5 = UIView()
    var upperLabelView10 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view
        getBoostView.translatesAutoresizingMaskIntoConstraints = false
        getBoostBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        getBoostBackgroundView.backgroundColor = .black
        getBoostBackgroundView.alpha = 0.8
        getBoostView.backgroundColor = .white
        getBoostView.layer.cornerRadius = 10
        view.addSubview(getBoostBackgroundView)
        view.addSubview(getBoostView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[view]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["view" : getBoostBackgroundView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["view" : getBoostBackgroundView]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[view]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["view" : getBoostView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[view]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["view" : getBoostView]))
        
        // Background image view
        let backgroundImageView = UIImageView(image: #imageLiteral(resourceName: "purpleBackground"))
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        getBoostView.addSubview(backgroundImageView)
        getBoostView.addConstraint(NSLayoutConstraint(item: backgroundImageView, attribute: .top, relatedBy: .equal, toItem: getBoostView, attribute: .top, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint(item: backgroundImageView, attribute: .leading, relatedBy: .equal, toItem: getBoostView, attribute: .leading, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint(item: backgroundImageView, attribute: .trailing, relatedBy: .equal, toItem: getBoostView, attribute: .trailing, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint(item: backgroundImageView, attribute: .height, relatedBy: .equal, toItem: backgroundImageView, attribute: .width, multiplier: 0.75, constant: 0))
        
        // set 3 frames for tinder plus buying options
        title1 = setAttributedText(number: "1\n", month: "חיזוק\n", costs: "15.90 ₪/פר בוסט") as! NSMutableAttributedString
        setChoosingButtons(sender: choose1Boost, backgroundColor: .lightGray, titleColor: .darkGray, title: title1)
        choose1Boost.addTarget(self, action: #selector(choose1BoostPressed), for: .touchUpInside)
        getBoostView.addSubview(choose1Boost)
        title2 = setAttributedText(number: "5\n", month: "חיזוקים\n", costs: "11.98 ₪/פר בוסט") as! NSMutableAttributedString
        setChoosingButtons(sender: choose5Boosts, backgroundColor: .lightGray, titleColor: .darkGray, title: title2)
        choose5Boosts.addTarget(self, action: #selector(choose5BoostsPressed), for: .touchUpInside)
        getBoostView.addSubview(choose5Boosts)
        title3 = setAttributedText(number: "10\n", month: "חיזוקים\n", costs: "9.99 ₪/פר בוסט") as! NSMutableAttributedString
        setChoosingButtons(sender: choose10Boosts, backgroundColor: .lightGray, titleColor: .darkGray, title: title3)
        choose10Boosts.addTarget(self, action: #selector(choose10BoostsPressed), for: .touchUpInside)
        getBoostView.addSubview(choose10Boosts)

        choose5BoostsPressed()
        
        // Choosing option constraints
        let third = (screenWidth-20)/3
        getBoostView.addConstraint(NSLayoutConstraint(item: choose1Boost, attribute: .top, relatedBy: .equal, toItem: backgroundImageView, attribute: .bottom, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint(item: choose1Boost, attribute: .leading, relatedBy: .equal, toItem: getBoostView, attribute: .leading, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint(item: choose1Boost, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: third))
        getBoostView.addConstraint(NSLayoutConstraint(item: choose1Boost, attribute: .height, relatedBy: .equal, toItem: choose1Boost, attribute: .width, multiplier: 1, constant: 10))
        getBoostView.addConstraint(NSLayoutConstraint(item: choose5Boosts, attribute: .top, relatedBy: .equal, toItem: choose1Boost, attribute: .top, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint(item: choose5Boosts, attribute: .leading, relatedBy: .equal, toItem: choose1Boost, attribute: .trailing, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint(item: choose5Boosts, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: third))
        getBoostView.addConstraint(NSLayoutConstraint(item: choose5Boosts, attribute: .height, relatedBy: .equal, toItem: choose1Boost, attribute: .height, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint(item: choose10Boosts, attribute: .top, relatedBy: .equal, toItem: choose1Boost, attribute: .top, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint(item: choose10Boosts, attribute: .leading, relatedBy: .equal, toItem: choose5Boosts, attribute: .trailing, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint(item: choose10Boosts, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: third))
        getBoostView.addConstraint(NSLayoutConstraint(item: choose10Boosts, attribute: .height, relatedBy: .equal, toItem: choose1Boost, attribute: .height, multiplier: 1, constant: 0))
        
        // set boost me button
        let boostMeButton = UIButton()
        boostMeButton.translatesAutoresizingMaskIntoConstraints = false
        boostMeButton.backgroundColor = .red
        boostMeButton.setTitle("עשה לי חיזוק", for: .normal)
        boostMeButton.setTitleColor(UIColor.white, for: .normal)
        boostMeButton.contentHorizontalAlignment = .center
        boostMeButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        boostMeButton.layer.cornerRadius = 20
        boostMeButton.addTarget(self, action: #selector(makeBoostButtonPressed), for: .touchUpInside)
        getBoostView.addSubview(boostMeButton)
        getBoostView.addConstraint(NSLayoutConstraint.init(item: boostMeButton, attribute: .centerX, relatedBy: .equal, toItem: getBoostView, attribute: .centerX, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint.init(item: boostMeButton, attribute: .top, relatedBy: .equal, toItem: choose1Boost, attribute: .bottom, multiplier: 1, constant: 30))
        getBoostView.addConstraint(NSLayoutConstraint.init(item: boostMeButton, attribute: .width, relatedBy: .equal, toItem: getBoostView, attribute: .width, multiplier: 0.75, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint.init(item: boostMeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
        
        // --or--
        let orLabel = UILabel()
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.backgroundColor = .clear
        orLabel.text = "או"
        orLabel.textColor = .lightGray
        orLabel.textAlignment = .center
        orLabel.font = UIFont.systemFont(ofSize: 20)
        getBoostView.addSubview(orLabel)
        getBoostView.addConstraint(NSLayoutConstraint.init(item: orLabel, attribute: .centerX, relatedBy: .equal, toItem: getBoostView, attribute: .centerX, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint.init(item: orLabel, attribute: .top, relatedBy: .equal, toItem: boostMeButton, attribute: .bottom, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint.init(item: orLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50))
        getBoostView.addConstraint(NSLayoutConstraint.init(item: orLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
        
        // Join tinder plus
        let joinTinderPlusButton = UIButton()
        joinTinderPlusButton.translatesAutoresizingMaskIntoConstraints = false
        joinTinderPlusButton.backgroundColor = .white
        joinTinderPlusButton.layer.borderColor = UIColor.red.cgColor
        joinTinderPlusButton.layer.borderWidth = 2
        joinTinderPlusButton.setTitle("הצטרפות לטינדר פלוס", for: .normal)
        joinTinderPlusButton.setTitleColor(UIColor.red, for: .normal)
        joinTinderPlusButton.contentHorizontalAlignment = .center
        joinTinderPlusButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        joinTinderPlusButton.layer.cornerRadius = 20
        joinTinderPlusButton.addTarget(self, action: #selector(joinTinderPlusButtonPressed), for: .touchUpInside)
        getBoostView.addSubview(joinTinderPlusButton)
        getBoostView.addConstraint(NSLayoutConstraint.init(item: joinTinderPlusButton, attribute: .centerX, relatedBy: .equal, toItem: getBoostView, attribute: .centerX, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint.init(item: joinTinderPlusButton, attribute: .top, relatedBy: .equal, toItem: orLabel, attribute: .bottom, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint.init(item: joinTinderPlusButton, attribute: .width, relatedBy: .equal, toItem: boostMeButton, attribute: .width, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint.init(item: joinTinderPlusButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
        
        
        // No thanks button
        let NoThanksButton = UIButton()
        NoThanksButton.translatesAutoresizingMaskIntoConstraints = false
        NoThanksButton.backgroundColor = UIColor.clear
        NoThanksButton.setTitle("לא, תודה", for: .normal)
        NoThanksButton.setTitleColor(UIColor.darkGray, for: .normal)
        NoThanksButton.contentHorizontalAlignment = .center
        NoThanksButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        NoThanksButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        getBoostView.addSubview(NoThanksButton)
        getBoostView.addConstraint(NSLayoutConstraint.init(item: NoThanksButton, attribute: .centerX, relatedBy: .equal, toItem: getBoostView, attribute: .centerX, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint.init(item: NoThanksButton, attribute: .top, relatedBy: .equal, toItem: joinTinderPlusButton, attribute: .bottom, multiplier: 1, constant: 20))
        getBoostView.addConstraint(NSLayoutConstraint.init(item: NoThanksButton, attribute: .width, relatedBy: .equal, toItem: boostMeButton, attribute: .width, multiplier: 1, constant: 0))
        getBoostView.addConstraint(NSLayoutConstraint.init(item: NoThanksButton, attribute: .height, relatedBy: .equal, toItem: boostMeButton, attribute: .height, multiplier: 1, constant: 0))
    }
    
    func makeBoostButtonPressed() -> Void {
        print("Make boost button pressed")
    }
    
    func joinTinderPlusButtonPressed() -> Void {
        print("Join tinder plus button pressed")
    }
    
    func choose1BoostPressed() -> Void {
        print("One boost button pressed")
        setChoosingButtons(sender: choose1Boost , backgroundColor: UIColor.init(colorLiteralRed: 1.0, green: 200/255, blue: 200/255, alpha: 1.0), titleColor: .red , title:title1)
        setChoosingButtons(sender: choose5Boosts, backgroundColor: .lightGray, titleColor: .darkGray, title: title2)
        setChoosingButtons(sender: choose10Boosts, backgroundColor: .lightGray, titleColor: .darkGray, title: title3)
        upperLabelView5.removeFromSuperview()
        upperLabelView10.removeFromSuperview()
    }
    
    func choose5BoostsPressed() -> Void {
        print("Five boosts button pressed")
        setChoosingButtons(sender: choose1Boost , backgroundColor: .lightGray, titleColor: .darkGray, title:title1)
        setChoosingButtons(sender: choose5Boosts, backgroundColor: UIColor.init(colorLiteralRed: 1.0, green: 200/255, blue: 200/255, alpha: 1.0), titleColor: .red, title: title2)
        setChoosingButtons(sender: choose10Boosts, backgroundColor: .lightGray, titleColor: .darkGray, title: title3)
        upperLabelView10.removeFromSuperview()
        upperLabelView5.translatesAutoresizingMaskIntoConstraints = false
        upperLabelView5.backgroundColor = .red
        upperLabelView5.layer.cornerRadius = 10
        let upperLabel5 = addUpperLabel(text: "חיסכון של 25%")
        upperLabel5.translatesAutoresizingMaskIntoConstraints = false
        upperLabelView5.addSubview(upperLabel5)
        var heightConst = NSLayoutConstraint(item: upperLabel5, attribute: .height, relatedBy: .equal, toItem: upperLabelView5, attribute: .height, multiplier: 1, constant: 0)
        var widthConst = NSLayoutConstraint(item: upperLabel5, attribute: .width, relatedBy: .equal, toItem: upperLabelView5, attribute: .width, multiplier: 1, constant: 0)
        var centerXConst = NSLayoutConstraint(item: upperLabel5, attribute: .centerX, relatedBy: .equal, toItem: upperLabelView5, attribute: .centerX, multiplier: 1, constant: 0)
        var centerYConst = NSLayoutConstraint(item: upperLabel5, attribute: .centerY, relatedBy: .equal, toItem: upperLabelView5, attribute: .centerY, multiplier: 1, constant: 0)
        upperLabelView5.addConstraints([heightConst,widthConst,centerXConst,centerYConst])
        getBoostView.addSubview(upperLabelView5)
        heightConst = NSLayoutConstraint(item: upperLabelView5, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        widthConst = NSLayoutConstraint(item: upperLabelView5, attribute: .width, relatedBy: .equal, toItem: choose5Boosts, attribute: .width, multiplier: 0.8, constant: 0)
        centerXConst = NSLayoutConstraint(item: upperLabelView5, attribute: .centerX, relatedBy: .equal, toItem: choose5Boosts, attribute: .centerX, multiplier: 1, constant: 0)
        centerYConst = NSLayoutConstraint(item: upperLabelView5, attribute: .centerY, relatedBy: .equal, toItem: choose5Boosts, attribute: .top, multiplier: 1, constant: 0)
        getBoostView.addConstraints([heightConst,widthConst,centerXConst,centerYConst])
    }
    
    func choose10BoostsPressed() -> Void {
        print("Ten boosts button pressed")
        setChoosingButtons(sender: choose1Boost , backgroundColor: .lightGray, titleColor: UIColor.darkGray, title:title1)
        setChoosingButtons(sender: choose5Boosts, backgroundColor: .lightGray, titleColor: .darkGray, title: title2)
        setChoosingButtons(sender: choose10Boosts, backgroundColor: UIColor.init(colorLiteralRed: 1.0, green: 200/255, blue: 200/255, alpha: 1.0), titleColor: .red, title: title3)
        upperLabelView10.translatesAutoresizingMaskIntoConstraints = false
        upperLabelView5.removeFromSuperview()
        upperLabelView10.backgroundColor = .red
        upperLabelView10.layer.cornerRadius = 10
        let upperLabel12 = addUpperLabel(text: "חיסכון של 37%")
        upperLabel12.translatesAutoresizingMaskIntoConstraints = false
        upperLabelView10.addSubview(upperLabel12)
        var heightConst = NSLayoutConstraint(item: upperLabel12, attribute: .height, relatedBy: .equal, toItem: upperLabelView10, attribute: .height, multiplier: 1, constant: 0)
        var widthConst = NSLayoutConstraint(item: upperLabel12, attribute: .width, relatedBy: .equal, toItem: upperLabelView10, attribute: .width, multiplier: 1, constant: 0)
        var centerXConst = NSLayoutConstraint(item: upperLabel12, attribute: .centerX, relatedBy: .equal, toItem: upperLabelView10, attribute: .centerX, multiplier: 1, constant: 0)
        var centerYConst = NSLayoutConstraint(item: upperLabel12, attribute: .centerY, relatedBy: .equal, toItem: upperLabelView10, attribute: .centerY, multiplier: 1, constant: 0)
        upperLabelView10.addConstraints([heightConst,widthConst,centerXConst,centerYConst])
        getBoostView.addSubview(upperLabelView10)
        heightConst = NSLayoutConstraint(item: upperLabelView10, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        widthConst = NSLayoutConstraint(item: upperLabelView10, attribute: .width, relatedBy: .equal, toItem: choose10Boosts, attribute: .width, multiplier: 0.8, constant: 0)
        centerXConst = NSLayoutConstraint(item: upperLabelView10, attribute: .centerX, relatedBy: .equal, toItem: choose10Boosts, attribute: .centerX, multiplier: 1, constant: 0)
        centerYConst = NSLayoutConstraint(item: upperLabelView10, attribute: .centerY, relatedBy: .equal, toItem: choose10Boosts, attribute: .top, multiplier: 1, constant: 0)
        getBoostView.addConstraints([heightConst,widthConst,centerXConst,centerYConst])
    }
    
    func setChoosingButtons(sender: UIButton, backgroundColor: UIColor, titleColor: UIColor, title:NSAttributedString) -> Void {
        sender.translatesAutoresizingMaskIntoConstraints = false
        sender.setAttributedTitle(title, for: .normal)
        sender.backgroundColor = backgroundColor
        sender.setTitleColor(titleColor, for: .normal)
        sender.contentHorizontalAlignment = .center
        sender.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        sender.layer.borderColor = titleColor.cgColor
        sender.layer.borderWidth = 2
        sender.titleLabel?.textAlignment = .center
        sender.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
    }
    
    func backButtonPressed() -> Void {
        print("Get Boost - Back button pressed")
        self.view.removeFromSuperview()
    }
    
    func setAttributedText(number:String,month:String,costs:String) -> NSAttributedString {
        let numberText  = number
        let attr1 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 28)]
        let attributedString = NSMutableAttributedString(string:numberText, attributes:attr1)
        let monthText = month
        let attr2 = [NSFontAttributeName : UIFont.systemFont(ofSize: 20)]
        let monthString = NSMutableAttributedString(string:monthText, attributes:attr2)
        let blancText = "\n"
        let blancAttr = [NSFontAttributeName : UIFont.systemFont(ofSize: 8)]
        let blancString = NSMutableAttributedString(string:blancText, attributes:blancAttr)
        let costsText = costs
        let attr3 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14)]
        let costsString = NSMutableAttributedString(string:costsText, attributes:attr3)
        attributedString.append(monthString)
        attributedString.append(blancString)
        attributedString.append(costsString)
        return attributedString
    }
    
    func addUpperLabel(text:String) -> UILabel {
        let upperTextLabel = UILabel()
        upperTextLabel.backgroundColor = .clear
        upperTextLabel.textAlignment = .center
        upperTextLabel.textColor = .white
        upperTextLabel.font = UIFont.systemFont(ofSize: 12)
        upperTextLabel.text = text
        return upperTextLabel
    }
    
}
