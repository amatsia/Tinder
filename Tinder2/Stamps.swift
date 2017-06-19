//
//  Test.swift
//  Tinder2
//
//  Created by Hyperactive6 on 16/06/2017.
//  Copyright © 2017 Amatsia Rosenberg. All rights reserved.
//

import UIKit

extension MainScrollView {
    
    func setLikeLabel() -> UILabel {
        let rect = CGRect(x: 60, y: 80, width: 120, height: 65)
        let likeLabel = setLabel(rect:rect, color:.green,string:"LIKE",rotation:-0.35)
        return likeLabel
    }
    
    func setNopeLabel() -> UILabel {
        let rect = CGRect(x: screenSize.width-180, y: 80, width: 130, height: 65)
        let nopeLabel = setLabel(rect:rect, color:.red,string:"NOPE",rotation:0.35)
        return nopeLabel
    }
    
    func setSuperLikeLabel() -> UILabel {
        let rect = CGRect(x: (screenSize.width/2)-40, y: screenSize.height/2.5, width: 160, height: 120)
        let superLikeLabel = setLabel(rect:rect, color:.blue,string:"SUPER\nLIKE",rotation:0.2)
        superLikeLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        superLikeLabel.numberOfLines = 2
        return superLikeLabel
    }
    
    func setLabel(rect:CGRect, color:UIColor,string:String,rotation:CGFloat) -> UILabel {
        let label = UILabel(frame: rect)
        label.backgroundColor = .clear
        label.layer.borderWidth = 3
        label.layer.borderColor = color.cgColor
        label.layer.cornerRadius = 8
        label.text = string
        label.font = UIFont(name: "Helvetica-Bold", size: 40)
        label.textColor = color
        label.textAlignment = .center
        label.transform = CGAffineTransform(rotationAngle: rotation)
        return label
    }
}
