//
//  TermsOfUse.swift
//  FakeTinder
//
//  Created by Hyperactive6 on 01/05/2017.
//  Copyright © 2017 Amatsia Rosenberg. All rights reserved.
//

import UIKit

class TermsOfUse: UIViewController, UIScrollViewDelegate, UINavigationBarDelegate {

    let scrollView = UIScrollView() // Create the scrollView
    let contentView = UIView() // Create the contentView
    let screenSize: CGRect = UIScreen.main.bounds
    var subViewsDict: [String:Any] = [:]
    var viewsDict: [String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        // Text label 1
        let textLabel1 = UILabel()
        textLabel1.translatesAutoresizingMaskIntoConstraints = false
        textLabel1.text = self.getText1()
        textLabel1.textColor = UIColor.lightGray
        textLabel1.lineBreakMode = .byWordWrapping
        textLabel1.numberOfLines = 0
        textLabel1.sizeToFit()
        self.contentView.addSubview(textLabel1)
        
        // Text label 2
        let textLabel2 = UILabel()
        textLabel2.translatesAutoresizingMaskIntoConstraints = false
        textLabel2.text = self.getText2()
        textLabel2.textColor = UIColor.lightGray
        textLabel2.lineBreakMode = .byWordWrapping
        textLabel2.numberOfLines = 0
        textLabel2.sizeToFit()
        self.contentView.addSubview(textLabel2)
        
        // Text label 3
        let textLabel3 = UILabel()
        textLabel3.translatesAutoresizingMaskIntoConstraints = false
        textLabel3.text = self.getText3()
        textLabel3.textColor = UIColor.lightGray
        textLabel3.lineBreakMode = .byWordWrapping
        textLabel3.numberOfLines = 0
        textLabel3.sizeToFit()
        self.contentView.addSubview(textLabel3)
        
        // Text label 4
        let textLabel4 = UILabel()
        textLabel4.translatesAutoresizingMaskIntoConstraints = false
        textLabel4.text = self.getText4()
        textLabel4.textColor = UIColor.lightGray
        textLabel4.lineBreakMode = .byWordWrapping
        textLabel4.numberOfLines = 0
        textLabel4.sizeToFit()
        self.contentView.addSubview(textLabel4)
        
        // Back button - need to check how it works on Iphone!!
        let backButton = UIButton(frame: CGRect(x: (screenSize.width/2)-25, y: 40, width: 50, height: 50))
        backButton.backgroundColor = UIColor.blue
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.setTitle("Back",for: .normal)
        backButton.layer.cornerRadius = 25
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        self.contentView.addSubview(backButton)
        
        // TextLabel and Back button Constraints
        self.subViewsDict = ["textLabel1":textLabel1,"textLabel2":textLabel2,"textLabel3":textLabel3,"textLabel4":textLabel4,"backButton":backButton]
        self.setHorizontalConstraints(textLabel: "textLabel1",dist: 10)
        self.setHorizontalConstraints(textLabel: "textLabel2",dist: 10)
        self.setHorizontalConstraints(textLabel: "textLabel3",dist: 10)
        self.setHorizontalConstraints(textLabel: "textLabel4",dist: 10)
        self.setHorizontalConstraints(textLabel: "backButton",dist: 0)
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[backButton]-20-[textLabel1]-[textLabel2]-[textLabel3]-[textLabel4]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:subViewsDict))
    }
    
    func setViewConstraints(VorH:String, text:String) -> Void {
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "\(VorH):|-0-[\(text)]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: self.viewsDict))
    }
    
    func setHorizontalConstraints(textLabel:String, dist:Int) -> Void {
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(dist)-[\(textLabel)]-\(dist)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:self.subViewsDict))
    }
    
    func backButtonPressed() -> Void {
        print("Back button pressed")
        let mainVC = ScrollViewController()
        present(mainVC, animated: false, completion: nil)
    }
    
    func getText1() -> String {
        let text = "TERMS OF USE\n\nLast revised on September 14, 2016\nWelcome to Tinder, operated by Tinder, Inc. (the “Company” or “Tinder”).\nBy creating a Tinder account or by using the Tinder iMessage app (“Tinder iMessage”), whether through a mobile device, mobile application or computer (collectively, the “Service”) you agree to be bound by these Terms of Use and ourPrivacy Policy, which is incorporated by reference into this Agreement and available in the Service (this “Agreement”). If you do not accept and agree to be bound by all of the terms of this Agreement, please do not use the Service.\nAcceptance of Terms of Use Agreement.\nThis Agreement is an electronic contract that establishes the legally binding terms you must accept to use the Service. This Agreement includes the Company’s (i) Privacy Policy, (ii) our Safety Tips and (iii) terms disclosed and agreed to by you if you purchase or accept additional features, products or services we offer on the Service.\nWe may, at any time and for any reason make changes to this Agreement. We may do this for a variety of reasons including to reflect changes in or requirements of the law, new features, or changes in business practices. The most recent version of this Agreement will be posted on the Services under Settings and also on gotinder.com, and you should regularly check for the most recent version. The most recent version is the version that applies. If the changes include material changes that affect your rights or obligations, we will notify you of the changes by reasonable means, which could include notification through the Services or via email. If you continue to use the Services after the changes become effective, then you shall be deemed to have accepted those changes. If you don’t agree to these changes, you must end your relationship with us by ceasing to use the Services and leaving Tinder.\nEligibility. You must be at least 18 years of age to create an account on Tinder and use the Service. By creating and account and using the Service, you represent and warrant that you can form a binding contract with Tinder, you are not a person who is barred from using the Service under the laws of the United States or any other applicable jurisdiction–meaning that you do not appear on the U.S. Treasury Department’s list of Specially Designated Nationals or face any other similar prohibition, and you will comply with this Agreement and all applicable local, state, national and international laws, rules and regulations. If you create an account, you represent and warrant that you have never been convicted of a felony and that you are not required to register as a sex offender with any state, federal or local sex offender registry.\nCreating an Account on Tinder. In order to use Tinder, you must have or create a Facebook account and sign in using your Facebook login.  If you do so, you authorize us to access and use certain Facebook account information, including but not limited to your public Facebook profile and information about Facebook friends you might share in common with other Tinder users. For more information regarding the information we collect from you and how we use it, please consult ourPrivacy Policy.\nTerms for Tinder iMessage. Tinder iMessage is an iMessage app that allows users to have a Tinder-like experience outside of Tinder. Through Tinder iMessage, you can select photos from your mobile device to create your own card stack to share with your contacts. Contacts who have Tinder iMessage will be able to vote on the photos by swiping right, swiping left or using the voting buttons, and you see the results of the vote. Tinder iMessage operates separately from the main Tinder experience, so when you use Tinder iMessage, you aren’t creating an account, logging in with Facebook, sharing your Facebook details with us or creating a profile that will be shown on Tinder.\nTerm and Termination. This Agreement will remain in full force and effect while you use the Service and/or have a Tinder account. You may terminate your account at any time, for any reason, by following the instructions in “Settings” in the Service. The Company may terminate or suspend your account at any time without notice if the Company believes that you have breached this Agreement in its sole discretion. Upon such termination or suspension, you will not be entitled to any refund of unused fees for in app purchases. After your account is terminated, this Agreement will terminate, except that the following provisions will still apply: Section 5, Section 9, Section 10(e), Section 16, and Sections 17-20.\nNon-commercial Use by Users. The Service is for personal use only. Users may not use the Service or any content contained in the Service (including, but not limited to, content of other users, designs, text, graphics, images, video, logos, software, and computer code) in connection with any commercial endeavors, such as advertising or soliciting any user to buy or sell any products or services not offered by the Company. Users of the Service may not use any information obtained from the Service to contact, advertise to, solicit, or sell to any other user without his or her prior explicit consent. Organizations, companies, and/or businesses may not use the Service for any purpose except with Tinder’s express consent (such as for promoted profiles or other advertisements), which Tinder may provide or deny in its sole discretion. The Company may investigate and take any available legal action in response to illegal and/or unauthorized uses of the Service.\nAccount Security. You are responsible for maintaining the confidentiality of your Facebook login credentials you use to sign up for Tinder, and you are solely responsible for all activities that occur under those credentials. You agree to immediately notify the Company of any disclosure or unauthorized use of your login credentials at help@gotinder.com.\nYour Interactions with Other Users.\nYOU ARE SOLELY RESPONSIBLE FOR YOUR INTERACTIONS WITH OTHER USERS. YOU UNDERSTAND THAT THE COMPANY CURRENTLY DOES NOT CONDUCT CRIMINAL BACKGROUND CHECKS ON ITS USERS. THE COMPANY ALSO DOES NOT VERIFY THE STATEMENTS OF ITS USERS. THE COMPANY MAKES NO REPRESENTATIONS OR WARRANTIES AS TO THE CONDUCT OF USERS OR THEIR COMPATIBILITY WITH ANY CURRENT OR FUTURE USERS. THE COMPANY RESERVES THE RIGHT TO CONDUCT ANY CRIMINAL BACKGROUND CHECK OR OTHER SCREENINGS (SUCH AS SEX OFFENDER REGISTER SEARCHES), AT ANY TIME AND USING AVAILABLE PUBLIC RECORDS.\nThe Company is not responsible for the conduct of any user. As noted in and without limiting Sections 16 and 18 below, in no event shall the Company, its affiliates or its partners be liable (directly or indirectly) for any losses or damages whatsoever, whether direct, indirect, general, special, compensatory, consequential, and/or incidental, arising out of or relating to the conduct of you or anyone else in connection with the use of the Service including, without limitation, death, bodily injury, emotional distress, and/or any other damages resulting from communications or meetings with other users or persons you meet through the Service. You agree to take all necessary precautions in all interactions with other users, particularly if you decide to communicate off the Service or meet in person, or if you decide to send money to another user. In addition, you agree to review and follow the Company’s Safety Tips, located in the Service, prior to using the Service. You should not provide your financial information (for example, your credit card or bank account information), or wire or otherwise send money, to other users."
        return text
    }
    
    func getText2() -> String {
        let text = "Proprietary Rights. The Company owns and retains all proprietary rights in the Service, and in all content, trademarks, trade names, service marks and other intellectual property rights related thereto. The Service contains the copyrighted material, trademarks, and other proprietary information of the Company and its licensors. You agree to not copy, modify, transmit, create any derivative works from, make use of, or reproduce in any way any copyrighted material, trademarks, trade names, service marks, or other intellectual property or proprietary information accessible through the Service, without first obtaining the prior written consent of the Company or, if such property is not owned by the Company, the owner of such intellectual property or proprietary rights. You agree to not remove, obscure or otherwise alter any proprietary notices appearing on any content, including copyright, trademark and other intellectual property notices.\nContent Posted by You in the Service.\nYou are solely responsible for the content and information that you post, upload, publish, link to, transmit, record, display or otherwise make available (collectively, “post”) on the Service or transmit to other users, including text messages, chat, videos, photographs, or profile text, whether publicly posted or privately transmitted (collectively, “Content”). You may not post as part of the Service, or transmit to the Company or any other user (either on or off the Service), any offensive, inaccurate, incomplete, abusive, obscene, profane, threatening, intimidating, harassing, racially offensive, or illegal material, or any material that infringes or violates another person’s rights (including intellectual property rights, and rights of privacy and publicity). You represent and warrant that (i) all information that you submit upon creation of your account, including information submitted from your Facebook account, is accurate and truthful and that you will promptly update any information provided by you that subsequently becomes inaccurate, incomplete, misleading or false and (ii) you have the right to post the Content on the Service and grant the licenses set forth below.\nYou understand and agree that the Company may, but is not obligated to, monitor or review any Content you post as part of a Service. The Company may delete any Content, in whole or in part, that in the sole judgment of the Company violates this Agreement or may harm the reputation of the Service or the Company.\nBy posting Content as part of the Service, you grant to Tinder a worldwide, transferable, sub-licensable, royalty-free, right and license to host, store, use, copy, display, reproduce, adapt, edit, publish, modify and distribute the Content. This license is for the limited purpose of operating, developing, providing, promoting, and improving the Service and researching and developing new ones.\nIn addition to the types of Content described in Section 10(a) above, the following is a partial list of the kind of Content that is prohibited in the Service. You may not post, upload, display or otherwise make available Content that:\npromotes racism, bigotry, hatred or physical harm of any kind against any group or individual;\nadvocates harassment or intimidation of another person;\nrequests money from, or is intended to defraud, other users of the Service;\nspams or solicits Tinder’s users;\npromotes information that is false or misleading, or promotes illegal activities or conduct that is defamatory, libelous or otherwise objectionable;\npromotes an illegal or unauthorized copy of another person’s copyrighted work, such as providing pirated computer programs, images, audio or video files or links to them;\ncontains video, audio photographs, or images of another person without his or her permission (or in the case of a minor, the minor’s legal guardian);\ncontains restricted or password only access pages, or hidden pages or images (those not linked to or from another accessible page);\nprovides material that exploits people in a sexual, violent or other illegal manner, or solicits personal information from anyone under the age of 18;\nprovides instructional information about illegal activities such as making or buying illegal weapons or drugs, violating someone’s privacy, or providing, disseminating or creating computer viruses;\ncontains viruses, time bombs, trojan horses, cancelbots, worms or other harmful, or disruptive codes, components or devices;\nimpersonates, or otherwise misrepresents affiliation, connection or association with, any person or entity;\nprovides information or data you do not have a right to make available under law or under contractual or fiduciary relationships (such as inside information, proprietary and confidential information);\ndisrupts the normal flow of dialogue, causes a screen to “scroll” faster than other users are able to type, or otherwise negatively affects other users’ ability to engage in real time exchanges; and\nsolicits passwords or personal identifying information for commercial or unlawful purposes from other users or disseminates another person’s personal information without his or her permission.\nThe Company reserves the right, in its sole discretion, to investigate and take any legal action against anyone who violates this provision, including removing the offending communication from the Service and terminating or suspending the account of such violators.\n\nYour use of the Service, including all Content you post through the Service, must comply with all applicable laws and regulations. You agree that the Company may access, preserve and disclose your account information and Content if required to do so by law or in a good faith belief that such access, preservation or disclosure is reasonably necessary, such as to: (i) comply with legal process; (ii) enforce this Agreement; (iii) respond to claims that any Content violates the rights of third parties; (iv) respond to your requests for customer service or allow you to use the Service in the future; or (v) protect the rights, property or personal safety of the Company or any other person.\n\nYou agree that any Content you place on the Service may be viewed by other users and may be viewed by any person visiting or participating in the Service (such as individuals who may receive shared Content from other Tinder users).\nProhibited Activities. The Company reserves the right to investigate, suspend and/or terminate your account if you have misused the Service or behaved in a way the Company regards as inappropriate or unlawful, including actions or communications the occur off the Service but involve users you meet through the Service. The following is a partial list of the type of actions that you may not engage in with respect to the Service. You will not:\nimpersonate any person or entity.\nsolicit money from any users.\npost any Content that is prohibited by Section 10.\n“stalk” or otherwise harass any person.\n"
        return text
    }

    func getText3() -> String {
        let text = "Generally. From time to time, Tinder may offer additional products and services for purchase (“in app purchases”) through the App Store ℠, Google Play or other application platforms authorized by Tinder (each, a “Software Store”). If you choose to make an in app purchase, you will be prompted to enter details for your account with the mobile platform you are using (e.g., Apple, Android, etc.) (“your IAP Account”), and your IAP Account will be charged for the in app purchase in accordance with the terms disclosed to you at the time of purchase as well as the general terms for in app purchases that apply to your IAP Account. Some Software Stores may charge you sales tax, depending on where you live. If you purchase an auto-recurring periodic subscription through an in app purchase, your IAP Account will be billed continuously for the subscription until you cancel. After your initial subscription commitment period, and again after any subsequent subscription period, your subscription will automatically continue for an additional equivalent period, at the price you agreed to when subscribing. If you do not wish your subscription to renew automatically, or if you want to change or terminate your subscription, you will need to log in to your IAP account and follow instructions to cancel your subscription.  If you cancel your subscription, you may use your subscription until the end of your then-current subscription term; your subscription will not be renewed after your then-current term expires. However, you won’t be eligible for a prorated refund of any portion of the subscription fee paid for the then-current subscription period. Please refer to the terms of your application platform which apply to your in app purchases.\n\nSuper Likes and Other Virtual Items.  From time to time, you may be able to purchase, with “real world” money, a limited, personal, non-transferable, non-sublicensable, revocable license to use “virtual items,” including but not limited to Super Likes (collectively, “Virtual Items”). You are only allowed to purchase Virtual Items from us or our authorized partners through the Service and not in any other way. Purchase and use of Virtual Items through a Software Store is subject to such Software Store’s governing documents, including but not limited to its terms of service and privacy policy. Regardless of the terminology used, Virtual Items represent a limited license right governed by this Agreement. Except as otherwise prohibited by applicable law, Virtual Items obtained by you are licensed to you, and you acknowledge that no title or ownership in or to Virtual Items is being transferred or assigned to you. This Agreement should not be construed as a sale of any rights in Virtual Items. Any Virtual Item balance shown in your account does not constitute a real-world balance or reflect any stored value, but instead constitutes a measurement of the extent of your license. Virtual Items do not incur fees for non-use, however, the license granted to you in Virtual Items will terminate in accordance with the terms of this Agreement, when Tinder ceases providing the Service or your Account is otherwise terminated. Tinder, in its sole discretion, reserves the right to charge fees for the right to access or use Virtual Items and/or may distribute Virtual Items with or without charge. Tinder may manage, regulate, control, modify or eliminate Virtual Items at any time. Tinder shall have no liability to you or any third party in the event that Tinder exercises any such rights. The transfer of Virtual Items is prohibited, and you shall not sell, redeem or otherwise transfer Virtual Items to any person or entity. Virtual Items may only be redeemed through the Service. ALL PURCHASES AND REDEMPTIONS OF VIRTUAL ITEMS MADE THROUGH THE SERVICE ARE FINAL AND NON-REFUNDABLE. The provision of Virtual Items for use in the Service is a service provided by Tinder that commences immediately upon the acceptance of your purchase of such Virtual Items. You agree to pay all fees and applicable taxes incurred by you or anyone using your Tinder account. Tinder may revise the pricing for the goods and services offered through the Service at any time. YOU ACKNOWLEDGE THAT TINDER IS NOT REQUIRED TO PROVIDE A REFUND FOR ANY REASON, AND THAT YOU WILL NOT RECEIVE MONEY OR OTHER COMPENSATION FOR UNUSED VIRTUAL ITEMS WHEN AN ACCOUNT IS CLOSED, WHETHER SUCH CLOSURE WAS VOLUNTARY OR INVOLUNTARY.\n\nModifications to Service. The Company reserves the right at any time to modify or discontinue, temporarily or permanently, the Service (or any part thereof) with or without notice. You agree that the Company shall not be liable to you or to any third party for any modification, suspension or discontinuance of the Service. To protect the integrity of the Service, the Company reserves the right at any time in its sole discretion to block users from certain IP addresses from accessing the Service.\n\nCopyright Policy; Notice and Procedure for Making Claims of Copyright Infringement. You may not post, distribute, or reproduce in any way any copyrighted material, trademarks, or other proprietary information without obtaining the prior written consent of the owner of such proprietary rights. If you believe that your work has been copied and posted on the Service in a way that constitutes copyright infringement, please provide our Copyright Agent with the following information:\n\nan electronic or physical signature of the person authorized to act on behalf of the owner of the copyright interest;\na description of the copyrighted work that you claim has been infringed;\na description of where the material that you claim is infringing is located on the Service (and such description must be reasonably sufficient to enable the Company to find the alleged infringing material, such as a url);\nyour address, telephone number and email address;\na written statement by you that you have a good faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law; and\na statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner’s behalf.\nNotice of claims of copyright infringement should be provided to the Company’s Copyright Agent atcopyright@match.com or the following address:\n\nCopyright Agent\nc/o Tinder Legal\nP.O. Box 25458\nDallas, Texas 75225\n\nThe Company will terminate the accounts of repeat infringers.\n\nDisclaimers.\n\nYou acknowledge and agree that neither the Company nor its affiliates and third party partners are responsible for and shall not have any liability, directly or indirectly, for any loss or damage, including personal injury or death, as a result of or alleged to be the result of (i) any incorrect or inaccurate Content posted in the Service, whether caused by users or any of the equipment or programming associated with or utilized in the Service; (ii) the timeliness, deletion or removal, incorrect delivery or failure to store any Content or communications; (iii) the conduct, whether online or offline, of any user; (iv) any error, omission or defect in, interruption, deletion, alteration, delay in operation or transmission, theft or destruction of, or unauthorized access to, any user or user communications; or (v) any problems, failure or technical malfunction of any telephone network or lines, computer online systems, servers or providers, computer equipment, software, failure of email or players on account of technical problems or traffic congestion on the Internet or at any website or combination thereof, including injury or damage to users or to any other person’s computer or device related to or resulting from participating or downloading materials in connection with the Internet and/or in connection with the Service. TO THE MAXIMUM EXTENT ALLOWED BY APPLICABLE LAW, THE COMPANY PROVIDES THE SERVICE ON AN “AS IS” AND “AS AVAILABLE” BASIS AND GRANTS NO WARRANTIES OF ANY KIND, WHETHER EXPRESS, IMPLIED, STATUTORY OR OTHERWISE WITH RESPECT TO THE SERVICE (INCLUDING ALL CONTENT CONTAINED THEREIN), INCLUDING (WITHOUT LIMITATION) ANY IMPLIED WARRANTIES OF SATISFACTORY QUALITY, MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NON-INFRINGEMENT. THE COMPANY DOES NOT REPRESENT OR WARRANT THAT THE SERVICE WILL BE UNINTERRUPTED OR ERROR FREE, SECURE OR THAT ANY DEFECTS OR ERRORS IN THE SERVICE WILL BE CORRECTED.\n\nANY MATERIAL DOWNLOADED OR OTHERWISE OBTAINED THROUGH THE USE OF THE SERVICE IS ACCESSED AT YOUR OWN DISCRETION AND RISK, AND YOU WILL BE SOLELY RESPONSIBLE FOR AND HEREBY WAIVE ANY AND ALL CLAIMS AND CAUSES OF ACTION WITH RESPECT TO ANY DAMAGE TO YOUR DEVICE, COMPUTER SYSTEM, INTERNET ACCESS, DOWNLOAD OR DISPLAY DEVICE, OR LOSS OR CORRUPTION OF DATA THAT RESULTS OR MAY RESULT FROM THE DOWNLOAD OF ANY SUCH MATERIAL. IF YOU DO NOT ACCEPT THIS LIMITATION OF LIABILITY, YOU ARE NOT AUTHORIZED TO DOWNLOAD OR OBTAIN ANY MATERIAL THROUGH THE SERVICE.\n"
        return text
    }
    
    func getText4() -> String {
        let text = "From time to time, the Company may make third party opinions, advice, statements, offers, or other third party information or content available through the Service. All third party content is the responsibility of the respective authors of such content. THE COMPANY DOES NOT: (I) GUARANTEE THE ACCURACY, COMPLETENESS, OR USEFULNESS OF ANY THIRD PARTY CONTENT PROVIDED THROUGH THE SERVICE, OR (II) ADOPT, ENDORSE OR ACCEPT RESPONSIBILITY FOR THE ACCURACY OR RELIABILITY OF ANY OPINION, ADVICE, OR STATEMENT MADE BY ANY PARTY THAT APPEARS IN THE SERVICE. UNDER NO CIRCUMSTANCES WILL THE COMPANY OR ITS AFFILIATES BE RESPONSIBLE OR LIABLE FOR ANY LOSS OR DAMAGE RESULTING FROM YOUR RELIANCE ON INFORMATION OR OTHER CONTENT POSTED IN THE SERVICE, OR TRANSMITTED TO OR BY ANY USERS.\n\nLinks. The Service may contain, and the Service or third parties may provide, advertisements and promotions offered by third parties and links to other web sites or resources. You acknowledge and agree that the Company is not responsible for the availability of such external websites or resources, and does not endorse and is not responsible or liable for any content, information, statements, advertising, goods or services, or other materials on or available from such websites or resources. Your correspondence or business dealings with, or participation in promotions of, third parties found in or through the Service are solely between you and such third party. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of, or reliance upon, any such content, information, statements, advertising, goods or services or other materials available on or through any such website or resource.\n\nLimitation on Liability. TO THE FULLEST EXTENT ALLOWED BY APPLICABLE LAW, IN NO EVENT WILL THE COMPANY, ITS AFFILIATES, BUSINESS PARTNERS, LICENSORS OR SERVICE PROVIDERS BE LIABLE TO YOU OR ANY THIRD PERSON FOR ANY INDIRECT, RELIANCE, CONSEQUENTIAL, EXEMPLARY, INCIDENTAL, SPECIAL OR PUNITIVE DAMAGES, INCLUDING, WITHOUT LIMITATION, LOSS OF PROFITS, LOSS OF GOODWILL, DAMAGES FOR LOSS, CORRUPTION OR BREACHES OF DATA OR PROGRAMS, SERVICE INTERRUPTIONS AND PROCUREMENT OF SUBSTITUTE SERVICES, EVEN IF THE COMPANY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. NOTWITHSTANDING ANYTHING TO THE CONTRARY CONTAINED HEREIN, THE COMPANY'S LIABILITY TO YOU FOR ANY CAUSE WHATSOEVER, AND REGARDLESS OF THE FORM OF THE ACTION, WILL AT ALL TIMES BE LIMITED TO THE AMOUNT PAID, IF ANY, BY YOU TO THE COMPANY FOR THE SERVICE WHILE YOU HAVE AN ACCOUNT.\n\nSOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OR LIMITATION OF CERTAIN DAMAGES, SO SOME OR ALL OF THE EXCLUSIONS AND LIMITATIONS IN THIS SECTION MAY NOT APPLY TO YOU.\n\n\nArbitration and Governing Law.\n\nExcept for users residing within the European Union, Norway and elsewhere where prohibited by applicable law:\nThe exclusive means of resolving any dispute or claim arising out of or relating to this Agreement (including any alleged breach thereof) or the Service shall be BINDING ARBITRATION administered by the American Arbitration Association. The one exception to the exclusivity of arbitration is that you have the right to bring an individual claim against the Company in a small-claims court of competent jurisdiction. But whether you choose arbitration or small-claims court, you may not under any circumstances commence or maintain against the Company any class action, class arbitration, or other representative action or proceeding.\nBy using the Service in any manner, you agree to the above arbitration agreement. In doing so, YOU GIVE UP YOUR RIGHT TO GO TO COURT to assert or defend any claims between you and the Company (except for matters that may be taken to small-claims court). YOU ALSO GIVE UP YOUR RIGHT TO PARTICIPATE IN A CLASS ACTION OR OTHER CLASS PROCEEDING. Your rights will be determined by a NEUTRAL ARBITRATOR, NOT A JUDGE OR JURY. You are entitled to a fair hearing before the arbitrator. The arbitrator can grant any relief that a court can, but you should note that arbitration proceedings are usually simpler and more streamlined than trials and other judicial proceedings. Decisions by the arbitrator are enforceable in court and may be overturned by a court only for very limited reasons. For details on the arbitration process, see ourArbitration Procedures.\nAny proceeding to enforce this arbitration agreement, including any proceeding to confirm, modify, or vacate an arbitration award, may be commenced in any court of competent jurisdiction. In the event that this arbitration agreement is for any reason held to be unenforceable, any litigation against the Company (except for small-claims court actions) may be commenced only in the federal or state courts located in Dallas County, Texas. You hereby irrevocably consent to the jurisdiction of those courts for such purposes.\nThis Agreement, and any dispute between you and the Company, shall be governed by the laws of the state of Texas without regard to principles of conflicts of law, provided that this arbitration agreement shall be governed by the Federal Arbitration Act.\n\nFor users residing in the European Union, Norway or elsewhere where this arbitration agreement is prohibited by law, the laws of Texas, U.S.A., excluding Texas’s conflict of laws rules, will apply to any disputes arising out of or relating to this Agreement or the Services. All claims arising out of or relating to this Agreement or the Services will be litigated exclusively in the federal or state courts of Dallas County, Texas, USA, and you and Tinder consent to personal jurisdiction in those courts.n\nIndemnity by You. You agree to indemnify and hold the Company, its subsidiaries, and affiliates, and its and their officers, agents, partners and employees, harmless from any loss, liability, claim, or demand, including reasonable attorney’s fees, made by any third party due to or arising out of your breach of or failure to comply with this Agreement (including any breach of your representations and warranties contained herein), any postings or Content you post in the Service, and the violation of any law or regulation by you. The Company reserves the right to assume the exclusive defense and control of any matter otherwise subject to indemnification by you, in which event you will fully cooperate with the Company in connection therewith.\n\nNotice. The Company may provide you with notices, including those regarding changes to this Agreement, using any reasonable means, which may include email, SMS, MMS, text message or postings in the Service. Such notices may not be received if you violate this Agreement by accessing the Service in an unauthorized manner. You agree that you are deemed to have received any and all notices that would have been delivered had you accessed the Service in an authorized manner.\n\nEntire Agreement; Other. This Agreement, with the Privacy Policy and any specific guidelines or rules that are separately posted for particular services or offers in the Service, contains the entire agreement between you and the Company regarding the use of the Service. If any provision of this Agreement is held invalid, the remainder of this Agreement shall continue in full force and effect. The failure of the Company to exercise or enforce any right or provision of this Agreement shall not constitute a waiver of such right or provision. You agree that your Tinder account is non-transferable and all of your rights to your profile or contents within your Tinder account terminate upon your death. No agency, partnership, joint venture or employment is created as a result of this Agreement and you may not make any representations or bind the Company in any manner.\n\nSpecial State Terms. The following provisions are added to this Agreement for Tinder Plus subscribers residing in Arizona, California, Connecticut, Illinois, Iowa, Minnesota, New York, North Carolina, Ohio and Wisconsin:\n\nYou, the buyer, may cancel this Agreement, without penalty or obligation, at any time prior to midnight of the third business day following the original date of this contract, excluding Sundays and holidays. To cancel this agreement, please follow these instructions:\n\n\nIf you subscribed to Tinder Plus using your Apple ID:\n\n\nTo request a refund, go to iTunes, click on your Apple ID, select “View Apple ID,” sign in if requested, select “Purchase History,” find the transaction, and tap “Report Problem.” You can also submit a request at https://getsupport.apple.com/ContactInfo.action.\n\n\nIf you subscribed to Tinder Plus using your Google Play Store Account:\n\n\nPlease tap the “Contact Us” button at the bottom of the “Need Help” Section on the Tinder app and provide us with the order number. You can find the order number in the order confirmation email from the Google Play Store.\n\n\nIn the event that you die before the end of your subscription period, your estate shall be entitled to a refund of that portion of any payment you had made for your subscription which is allocable to the period after your death. In the event that you become disabled (such that you are unable to use the services of Tinder) before the end of your subscription period, you shall be entitled to a refund of that portion of any payment you had made for your subscription which is allocable to the period after your disability by providing the company notice at the same address as listed above."
        return text
    }
}