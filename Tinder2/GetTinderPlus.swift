//
//  GetTinderPlus.swift
//  Tinder2
//
//  Created by Hyperactive6 on 21/05/2017.
//  Copyright © 2017 Amatsia Rosenberg. All rights reserved.
//

import UIKit

class GetTinderPlus : UIViewController, UIScrollViewDelegate, UIPageViewControllerDelegate {
    
    let getTinderPlusView = UIView()
    let getTinderPlusBackgroundView = UIView()
    let screenWidth = UIScreen.main.bounds.width
    let TPlusScrollView = UIScrollView(frame: CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width-40, height: 180))
    var pageControl = UIPageControl()
    let choose1Month = UIButton()
    let choose6Month = UIButton()
    let choose12Month = UIButton()
    var title1 = NSMutableAttributedString(string: "")
    var title2 = NSMutableAttributedString(string: "")
    var title3 = NSMutableAttributedString(string: "")
    var upperLabelView6 = UIView()
    var upperLabelView12 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
        
        // view
        getTinderPlusView.translatesAutoresizingMaskIntoConstraints = false
        getTinderPlusBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        getTinderPlusBackgroundView.backgroundColor = .black
        getTinderPlusBackgroundView.alpha = 0.8
        getTinderPlusView.backgroundColor = .white
        getTinderPlusView.layer.cornerRadius = 10
        view.addSubview(getTinderPlusBackgroundView)
        view.addSubview(getTinderPlusView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[view]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["view" : getTinderPlusBackgroundView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["view" : getTinderPlusBackgroundView]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[view]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["view" : getTinderPlusView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[view]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["view" : getTinderPlusView]))
        
        // Title
        let title = UILabel(frame: CGRect(x: 10, y: 10, width: screenWidth-80, height: 30))
        title.text = "קבל/י טינדר פלוס"
        title.textColor = .black
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 28)
        getTinderPlusView.addSubview(title)
        
        // Sliding photos and text arrays
        let TPlusImages = [#imageLiteral(resourceName: "TPlus1"),#imageLiteral(resourceName: "TPlus2"),#imageLiteral(resourceName: "TPlus3"),#imageLiteral(resourceName: "TPlus4"),#imageLiteral(resourceName: "TPlus5"),#imageLiteral(resourceName: "TPlus6")]
        let TPLusBigTexts =                                                     ["החזר/י לאחור את הדפדוף האחרון שלך","","שליחת יותר סופר לייקים","מספר לייקים בלתי מוגבל","שנה/י את מיקומך","כבה מודעות"]
        let TPLusSmallTexts = ["חזור/י ודפדף/י שוב","הפכו את הפרופיל שלכם לנצפה ביותר באזורכם למשך 30 דקות ומצאו יותר התאמות","כך ניתן ליידע אותם שאת/ה מגלה עניין","לדפדף ולהנות","התאמות ברחבי העולם","דפדוף ללא הפרעה"]
        
        // Scroll view settings
        configurePageControl()
        TPlusScrollView.delegate = self
        TPlusScrollView.isScrollEnabled = true
        TPlusScrollView.isPagingEnabled = true
        let width = TPlusScrollView.frame.size.width
        let height = TPlusScrollView.frame.size.height
        getTinderPlusView.addSubview(TPlusScrollView)
        
        for index in 0..<6 {
            // Slide views settings
            let slideView = UIView()
            slideView.backgroundColor = .white
            slideView.translatesAutoresizingMaskIntoConstraints = false
            let imageView = UIImageView()
            imageView.backgroundColor = .white
            imageView.translatesAutoresizingMaskIntoConstraints = false
            let bigTextLabel = UILabel()
            bigTextLabel.backgroundColor = .white
            bigTextLabel.translatesAutoresizingMaskIntoConstraints = false
            let smallTextLabel = UILabel()
            smallTextLabel.backgroundColor = .white
            smallTextLabel.translatesAutoresizingMaskIntoConstraints = false
            TPlusScrollView.addSubview(slideView)
            slideView.addSubview(imageView)
            slideView.addSubview(bigTextLabel)
            slideView.addSubview(smallTextLabel)
            let dict = ["image":imageView,"bigText":bigTextLabel,"smallText":smallTextLabel]
            let origin = width * CGFloat(index)
            imageView.image = TPlusImages[index]
            bigTextLabel.text = TPLusBigTexts[index]
            bigTextLabel.textAlignment = .center
            bigTextLabel.font = UIFont.boldSystemFont(ofSize: 20)
            bigTextLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            bigTextLabel.numberOfLines = 0
            smallTextLabel.text = TPLusSmallTexts[index]
            smallTextLabel.textAlignment = .center
            smallTextLabel.font = UIFont.systemFont(ofSize: 20)
            smallTextLabel.textColor = .darkGray
            smallTextLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            smallTextLabel.numberOfLines = 0
            
            // Slide views constraints
            TPlusScrollView.addConstraint(NSLayoutConstraint(item: slideView, attribute: .leading, relatedBy: .equal, toItem: TPlusScrollView, attribute: .leading, multiplier: 1, constant: origin))
            TPlusScrollView.addConstraint(NSLayoutConstraint(item: slideView, attribute: .top, relatedBy: .equal, toItem: TPlusScrollView, attribute: .top, multiplier: 1, constant: 0))
            TPlusScrollView.addConstraint(NSLayoutConstraint(item: slideView, attribute: .height, relatedBy: .equal, toItem: TPlusScrollView, attribute: .height, multiplier: 1, constant: 0))
            TPlusScrollView.addConstraint(NSLayoutConstraint(item: slideView, attribute: .width, relatedBy: .equal, toItem: TPlusScrollView, attribute: .width, multiplier: 1, constant: 0))
            slideView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[image(\(width))]|", options: NSLayoutFormatOptions(), metrics: nil, views: dict))
            slideView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[bigText]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: dict))
            slideView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[smallText]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: dict))
            slideView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[image(\(height-50))]-0-[bigText(25)]-0-[smallText(25)]|", options: NSLayoutFormatOptions(), metrics: nil, views: dict))
        }
        TPlusScrollView.contentSize = CGSize(width: width*6, height: height)
        pageControl.addTarget(self, action: #selector(changePage), for: UIControlEvents.valueChanged)
        
        // set 3 frames for tinder plus buying options
        title1 = setAttributedText(number: "1\n", month: "חודש\n", costs: "79.90 ₪/חודש") as! NSMutableAttributedString
        setChoosingButtons(sender: choose1Month, backgroundColor: .lightGray, titleColor: .darkGray, title: title1)
        choose1Month.addTarget(self, action: #selector(choose1MonthPressed), for: .touchUpInside)
        getTinderPlusView.addSubview(choose1Month)
        title2 = setAttributedText(number: "6\n", month: "חודשים\n", costs: "49.98 ₪/חודש") as! NSMutableAttributedString
        setChoosingButtons(sender: choose6Month, backgroundColor: .lightGray, titleColor: .darkGray, title: title2)
        choose6Month.addTarget(self, action: #selector(choose6MonthPressed), for: .touchUpInside)
        getTinderPlusView.addSubview(choose6Month)
        title3 = setAttributedText(number: "12\n", month: "חודשים\n", costs: "33.32 ₪/חודש") as! NSMutableAttributedString
        setChoosingButtons(sender: choose12Month, backgroundColor: .lightGray, titleColor: .darkGray, title: title3)
        choose12Month.addTarget(self, action: #selector(choose12MonthPressed), for: .touchUpInside)
        getTinderPlusView.addSubview(choose12Month)
        
        choose6MonthPressed()
        
        // Choosing option constraints
        let choosingButtonDict = ["one":choose1Month,"six":choose6Month,"twelve":choose12Month,"PC":pageControl] as [String : Any]
        let third = (screenWidth-40)/3
        getTinderPlusView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[PC]-20-[one(150)]", options: NSLayoutFormatOptions(), metrics: nil, views: choosingButtonDict))
        getTinderPlusView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[PC]-20-[six(150)]", options: NSLayoutFormatOptions(), metrics: nil, views: choosingButtonDict))
        getTinderPlusView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[PC]-20-[twelve(150)]", options: NSLayoutFormatOptions(), metrics: nil, views: choosingButtonDict))
        getTinderPlusView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[one(\(third))]-0-[six(\(third))]-0-[twelve(\(third))]|", options: NSLayoutFormatOptions(), metrics: nil, views: choosingButtonDict))
 
        // set buying button
        let buyingButton = UIButton()
        buyingButton.translatesAutoresizingMaskIntoConstraints = false
        buyingButton.backgroundColor = UIColor.red
        buyingButton.setTitle("המשך", for: .normal)
        buyingButton.setTitleColor(UIColor.white, for: .normal)
        buyingButton.contentHorizontalAlignment = .center
        buyingButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        buyingButton.layer.cornerRadius = 15
        buyingButton.addTarget(self, action: #selector(buyingButtonPressed), for: .touchUpInside)
        getTinderPlusView.addSubview(buyingButton)
        getTinderPlusView.addConstraint(NSLayoutConstraint.init(item: buyingButton, attribute: .centerX, relatedBy: .equal, toItem: getTinderPlusView, attribute: .centerX, multiplier: 1, constant: 0))
        getTinderPlusView.addConstraint(NSLayoutConstraint.init(item: buyingButton, attribute: .top, relatedBy: .equal, toItem: TPlusScrollView, attribute: .bottom, multiplier: 1, constant: 240))
        getTinderPlusView.addConstraint(NSLayoutConstraint.init(item: buyingButton, attribute: .width, relatedBy: .equal, toItem: getTinderPlusView, attribute: .width, multiplier: 0.67, constant: 0))
        getTinderPlusView.addConstraint(NSLayoutConstraint.init(item: buyingButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
        
        // No thanks button
        let NoThanksButton = UIButton()
        NoThanksButton.translatesAutoresizingMaskIntoConstraints = false
        NoThanksButton.backgroundColor = UIColor.clear
        NoThanksButton.setTitle("לא, תודה", for: .normal)
        NoThanksButton.setTitleColor(UIColor.darkGray, for: .normal)
        NoThanksButton.contentHorizontalAlignment = .center
        NoThanksButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        NoThanksButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        getTinderPlusView.addSubview(NoThanksButton)
        getTinderPlusView.addConstraint(NSLayoutConstraint.init(item: NoThanksButton, attribute: .centerX, relatedBy: .equal, toItem: getTinderPlusView, attribute: .centerX, multiplier: 1, constant: 0))
        getTinderPlusView.addConstraint(NSLayoutConstraint.init(item: NoThanksButton, attribute: .top, relatedBy: .equal, toItem: buyingButton, attribute: .bottom, multiplier: 1, constant: 20))
        getTinderPlusView.addConstraint(NSLayoutConstraint.init(item: NoThanksButton, attribute: .width, relatedBy: .equal, toItem: buyingButton, attribute: .width, multiplier: 1, constant: 0))
        getTinderPlusView.addConstraint(NSLayoutConstraint.init(item: NoThanksButton, attribute: .height, relatedBy: .equal, toItem: buyingButton, attribute: .height, multiplier: 1, constant: 0))
    }
    
    func configurePageControl() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 6
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.red
        getTinderPlusView.addSubview(pageControl)
        getTinderPlusView.addConstraint(NSLayoutConstraint(item: pageControl, attribute: .centerX, relatedBy: .equal, toItem: getTinderPlusView, attribute: .centerX, multiplier: 1, constant: 0))
        getTinderPlusView.addConstraint(NSLayoutConstraint(item: pageControl, attribute: .top, relatedBy: .equal, toItem: getTinderPlusView, attribute: .top, multiplier: 1, constant: 240))
        getTinderPlusView.addConstraint(NSLayoutConstraint(item: pageControl, attribute: .height, relatedBy: .equal, toItem: pageControl, attribute: .height, multiplier: 1, constant: 20))
        getTinderPlusView.addConstraint(NSLayoutConstraint(item: pageControl, attribute: .width, relatedBy: .equal, toItem: getTinderPlusView, attribute: .width, multiplier: 0.5, constant: 0))
 
    }
    
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * TPlusScrollView.frame.size.width
        UIView.animate(withDuration: 0.04, delay: 0.0, options: .curveEaseOut, animations: {
            self.TPlusScrollView.setContentOffset(CGPoint(x: x,y :0), animated: false)
        }, completion: nil)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    func moveToNextPage(sender: AnyObject) -> () {
        var x = CGFloat((pageControl.currentPage)+1) * TPlusScrollView.frame.size.width
        if x>TPlusScrollView.frame.size.width*5 {
            x=0
        }
        UIView.animate(withDuration: 0.04, delay: 0.0, options: .curveEaseOut, animations: {
            self.TPlusScrollView.setContentOffset(CGPoint(x: x,y :0), animated: false)
        }, completion: nil)
        scrollViewDidEndDecelerating(TPlusScrollView)
    }
    
    func buyingButtonPressed() -> Void {
        print("Buying tinder plus button pressed")
    }
    
    func choose1MonthPressed() -> Void {
        print("One month button pressed")
        setChoosingButtons(sender: choose1Month , backgroundColor: .white, titleColor: .blue, title:title1)
        setChoosingButtons(sender: choose6Month, backgroundColor: .lightGray, titleColor: .darkGray, title: title2)
        setChoosingButtons(sender: choose12Month, backgroundColor: .lightGray, titleColor: .darkGray, title: title3)
        upperLabelView6.removeFromSuperview()
        upperLabelView12.removeFromSuperview()
    }
    
    func choose6MonthPressed() -> Void {
        print("Six month button pressed")
        setChoosingButtons(sender: choose1Month , backgroundColor: .lightGray, titleColor: .darkGray, title:title1)
        setChoosingButtons(sender: choose6Month, backgroundColor: .white, titleColor: .blue, title: title2)
        setChoosingButtons(sender: choose12Month, backgroundColor: .lightGray, titleColor: .darkGray, title: title3)
        upperLabelView6.translatesAutoresizingMaskIntoConstraints = false
        upperLabelView12.removeFromSuperview()
        upperLabelView6.backgroundColor = .blue
        upperLabelView6.layer.cornerRadius = 10
        let upperLabel6 = addUpperLabel(text: "הפופולרי ביותר")
        upperLabel6.translatesAutoresizingMaskIntoConstraints = false
        upperLabelView6.addSubview(upperLabel6)
        var heightConst = NSLayoutConstraint(item: upperLabel6, attribute: .height, relatedBy: .equal, toItem: upperLabelView6, attribute: .height, multiplier: 1, constant: 0)
        var widthConst = NSLayoutConstraint(item: upperLabel6, attribute: .width, relatedBy: .equal, toItem: upperLabelView6, attribute: .width, multiplier: 1, constant: 0)
        var centerXConst = NSLayoutConstraint(item: upperLabel6, attribute: .centerX, relatedBy: .equal, toItem: upperLabelView6, attribute: .centerX, multiplier: 1, constant: 0)
        var centerYConst = NSLayoutConstraint(item: upperLabel6, attribute: .centerY, relatedBy: .equal, toItem: upperLabelView6, attribute: .centerY, multiplier: 1, constant: 0)
        upperLabelView6.addConstraints([heightConst,widthConst,centerXConst,centerYConst])
        getTinderPlusView.addSubview(upperLabelView6)
        heightConst = NSLayoutConstraint(item: upperLabelView6, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        widthConst = NSLayoutConstraint(item: upperLabelView6, attribute: .width, relatedBy: .equal, toItem: choose6Month, attribute: .width, multiplier: 0.8, constant: 0)
        centerXConst = NSLayoutConstraint(item: upperLabelView6, attribute: .centerX, relatedBy: .equal, toItem: choose6Month, attribute: .centerX, multiplier: 1, constant: 0)
        centerYConst = NSLayoutConstraint(item: upperLabelView6, attribute: .centerY, relatedBy: .equal, toItem: choose6Month, attribute: .top, multiplier: 1, constant: 0)
    getTinderPlusView.addConstraints([heightConst,widthConst,centerXConst,centerYConst])
    }
    
    func choose12MonthPressed() -> Void {
        print("Twelve month button pressed")
        setChoosingButtons(sender: choose1Month , backgroundColor: UIColor.lightGray, titleColor: UIColor.darkGray, title:title1)
        setChoosingButtons(sender: choose6Month, backgroundColor: .lightGray, titleColor: .darkGray, title: title2)
        setChoosingButtons(sender: choose12Month, backgroundColor: .white, titleColor: .blue, title: title3)
        upperLabelView12.translatesAutoresizingMaskIntoConstraints = false
        upperLabelView6.removeFromSuperview()
        upperLabelView12.backgroundColor = .blue
        upperLabelView12.layer.cornerRadius = 10
        let upperLabel12 = addUpperLabel(text: "המשתלם ביותר")
        upperLabel12.translatesAutoresizingMaskIntoConstraints = false
        upperLabelView12.addSubview(upperLabel12)
        var heightConst = NSLayoutConstraint(item: upperLabel12, attribute: .height, relatedBy: .equal, toItem: upperLabelView12, attribute: .height, multiplier: 1, constant: 0)
        var widthConst = NSLayoutConstraint(item: upperLabel12, attribute: .width, relatedBy: .equal, toItem: upperLabelView12, attribute: .width, multiplier: 1, constant: 0)
        var centerXConst = NSLayoutConstraint(item: upperLabel12, attribute: .centerX, relatedBy: .equal, toItem: upperLabelView12, attribute: .centerX, multiplier: 1, constant: 0)
        var centerYConst = NSLayoutConstraint(item: upperLabel12, attribute: .centerY, relatedBy: .equal, toItem: upperLabelView12, attribute: .centerY, multiplier: 1, constant: 0)
        upperLabelView12.addConstraints([heightConst,widthConst,centerXConst,centerYConst])
        getTinderPlusView.addSubview(upperLabelView12)
        heightConst = NSLayoutConstraint(item: upperLabelView12, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        widthConst = NSLayoutConstraint(item: upperLabelView12, attribute: .width, relatedBy: .equal, toItem: choose12Month, attribute: .width, multiplier: 0.8, constant: 0)
        centerXConst = NSLayoutConstraint(item: upperLabelView12, attribute: .centerX, relatedBy: .equal, toItem: choose12Month, attribute: .centerX, multiplier: 1, constant: 0)
        centerYConst = NSLayoutConstraint(item: upperLabelView12, attribute: .centerY, relatedBy: .equal, toItem: choose12Month, attribute: .top, multiplier: 1, constant: 0)
        getTinderPlusView.addConstraints([heightConst,widthConst,centerXConst,centerYConst])
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
        print("Get Tplus - Back button pressed")
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
