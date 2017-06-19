//
//  Global.swift
//  Tinder2
//
//  Created by Hyperactive6 on 04/06/2017.
//  Copyright © 2017 Amatsia Rosenberg. All rights reserved.
//

import UIKit

class GenderToLookFor {
    var isLookingForMale:Bool
    var isLookingForFemale:Bool
    init(isLookingForMale:Bool,isLookingForFemale:Bool) {
        self.isLookingForMale = isLookingForMale
        self.isLookingForFemale = isLookingForFemale
    }
}

var Gender = GenderToLookFor(isLookingForMale:false,isLookingForFemale:true)

class Arrays {
    // Womens
    let womensArray:NSArray
    let womensNames:NSArray
    let womensAges:NSArray
    let womensWorkPlace:NSArray
    let womensDist:NSArray
    let womensText:NSArray
    let womensSchool:NSArray
    // Mens
    let mansArray:NSArray
    let mansNames:NSArray
    let mansAges:NSArray
    let mansWorkPlace:NSArray
    let mansDist:NSArray
    let mansText:NSArray
    let mansSchool:NSArray
    
    init(womensArray:NSArray,womensNames:NSArray,womensAges:NSArray,womensWorkPlace:NSArray,womensDist:NSArray,womensText:NSArray,womensSchool:NSArray,mansArray:NSArray,mansNames:NSArray,mansAges:NSArray,mansWorkPlace:NSArray,mansDist:NSArray,mansText:NSArray,mansSchool:NSArray) {
        self.womensArray = womensArray
        self.womensNames = womensNames
        self.womensAges = womensAges
        self.womensWorkPlace = womensWorkPlace
        self.womensDist = womensDist
        self.womensText = womensText
        self.womensSchool = womensSchool
        self.mansArray = mansArray
        self.mansNames = mansNames
        self.mansAges = mansAges
        self.mansWorkPlace = mansWorkPlace
        self.mansDist = mansDist
        self.mansText = mansText
        self.mansSchool = mansSchool
    }
}

let GlobalArrays = Arrays(womensArray: [[#imageLiteral(resourceName: "wa1"),#imageLiteral(resourceName: "wa2"),#imageLiteral(resourceName: "wa3")],[#imageLiteral(resourceName: "wb1"),#imageLiteral(resourceName: "wb2"),#imageLiteral(resourceName: "wb3"),#imageLiteral(resourceName: "wb4")],[#imageLiteral(resourceName: "wc1"),#imageLiteral(resourceName: "wc2")],[#imageLiteral(resourceName: "wd1")],[#imageLiteral(resourceName: "we1"),#imageLiteral(resourceName: "we2")],[#imageLiteral(resourceName: "wf1"),#imageLiteral(resourceName: "wf2"),#imageLiteral(resourceName: "wf3"),#imageLiteral(resourceName: "wf4")],[#imageLiteral(resourceName: "wg1"),#imageLiteral(resourceName: "wg2"),#imageLiteral(resourceName: "wg3"),#imageLiteral(resourceName: "wg4")]],womensNames:["Daenerys","Ygritte","Margaery","Cersei","Shae","Sansa","Brienne"],womensAges:["20","27","26","35","23","22","36"],womensWorkPlace:["Self employed","Freelancer","","Kings mother","professional","","mercenary"],womensDist:["13","10","7","15","19","6","2"],womensText:["Looking for the next king ","You know nothing","If you are a king - swipe right!","","Just for fun","Serious only","Swipe right if you think you can handle with me"],womensSchool:["המכללה למנהל","אוניברסיטת בן גוריון","אונברסיטת תל אביב","","הקריה האקדמית אונו","","טכניון"],mansArray:[[#imageLiteral(resourceName: "ma1"),#imageLiteral(resourceName: "ma2"),#imageLiteral(resourceName: "ma3"),#imageLiteral(resourceName: "ma4"),#imageLiteral(resourceName: "ma5"),#imageLiteral(resourceName: "ma6")],[#imageLiteral(resourceName: "mb1"),#imageLiteral(resourceName: "mb2"),#imageLiteral(resourceName: "mb3"),#imageLiteral(resourceName: "mb4"),#imageLiteral(resourceName: "mb5")],[#imageLiteral(resourceName: "mc1"),#imageLiteral(resourceName: "mc2"),#imageLiteral(resourceName: "mc3"),#imageLiteral(resourceName: "mc4")],[#imageLiteral(resourceName: "md1"),#imageLiteral(resourceName: "md2"),#imageLiteral(resourceName: "md3")],[#imageLiteral(resourceName: "me1"),#imageLiteral(resourceName: "me2")],[#imageLiteral(resourceName: "mf1"),#imageLiteral(resourceName: "mf2")],[#imageLiteral(resourceName: "mg1"),#imageLiteral(resourceName: "mg2"),#imageLiteral(resourceName: "mg3"),#imageLiteral(resourceName: "mg4"),#imageLiteral(resourceName: "mg5")]],mansNames:["Jon","Jaime","Tyrion","Robb","Ned","Sandor","Khal Drogo"],mansAges:["28","33","37","28","50","38","39"],mansWorkPlace:["Lord Commander","","Edvisor","King of the north","","mercenary","khaleesier"],mansDist:["4","16","9","17","2","11","8"],mansText:["The winter is coming","","Looking for a girl who know how to drink","Serious only","The winter is coming","",""],mansSchool:["המכללה למנהל","אוניברסיטת בן גוריון","אונברסיטת תל אביב","","הקריה האקדמית אונו","","טכניון"])

/*
class Stamps {
    var likeLabel:UILabel
    var nopeLabel:UILabel
    var superLikeLabel:UILabel
    
    
    
    
    init(likeLabel:UILabel,nopeLabel:UILabel,superLikeLabel:UILabel) {
        self.likeLabel = likeLabel
        self.nopeLabel = nopeLabel
        self.superLikeLabel = superLikeLabel
    }
    func setLikeStamp() -> UILabel {
        let like = UILabel()
        like.backgroundColor = .clear
        like.layer.borderWidth = 3
        like.layer.borderColor = UIColor.green.cgColor
        like.layer.cornerRadius = 8
        like.text = "LIKE"
        like.font = UIFont(name: "Helvetica-Bold", size: 30)
        like.textColor = .green
        like.textAlignment = .center
        like.transform = CGAffineTransform(rotationAngle: -0.35)
        return like
    }
}



var Stamp = Stamps(likeLabel:Stamps.setLikeStamp(),nopeLabel:UILabel,superLikeLabel:UILabel)
*/



