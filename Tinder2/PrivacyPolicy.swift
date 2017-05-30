//
//  PrivacyPolicy.swift
//  FakeTinder
//
//  Created by Hyperactive6 on 01\05\2017.
//  Copyright © 2017 Amatsia Rosenberg. All rights reserved.
//

import UIKit

class PrivacyPolicy: UIViewController, UIScrollViewDelegate, UINavigationBarDelegate { 
    
    let scrollView = UIScrollView() // Create the scrollView
    let contentView = UIView() // Create the contentView
    let screenSize: CGRect = UIScreen.main.bounds
    
    
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
        let viewsDict = ["scrollView":self.scrollView,
                         "contentView":self.contentView]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[scrollView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[scrollView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[contentView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[contentView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
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
        
        // Back button - need to check how it works on Iphone!!
        let backButton = UIButton(frame: CGRect(x: (screenSize.width/2)-25, y: 40, width: 50, height: 50))
        backButton.backgroundColor = UIColor.blue
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.setTitle("Back",for: .normal)
        backButton.layer.cornerRadius = 25
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        self.contentView.addSubview(backButton)
        
        // TextLabel and Back button Constraints
        let subViewsDict = ["textLabel1":textLabel1,"textLabel2":textLabel2,
                         "backButton":backButton]
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[backButton]-20-[textLabel1]-[textLabel2]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:subViewsDict))
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[textLabel1]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:subViewsDict))
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[textLabel2]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:subViewsDict))
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[backButton]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:subViewsDict))
    }
    
    func backButtonPressed() -> Void {
        print("Back button pressed")
        let mainVC = ScrollViewController()
        present(mainVC, animated: false, completion: nil)
    }
    
    func getText1() -> String {
        
        let text = "TINDER, INC. PRIVACY POLICY\n\nLast Updated: 5/8/2017 \n\nTinder, Inc. (“Tinder,” “we,” and “us”) respects the privacy of its users (“you”) and has developed this Privacy Policy to demonstrate its commitment to protecting your privacy. This Privacy Policy describes the information we collect, how that information may be used, with whom it may be shared, and your choices about such uses and disclosures. We encourage you to read this Privacy Policy carefully when using our application or services or transacting business with us. By using our website, application or other online services (our “Service”), you are accepting the practices described in this Privacy Policy.\n\nIf you have any questions about our privacy practices, please refer to the end of this Privacy Policy for information on how to contact us.\n\nInformation we collect about you\n\nIn General. We may collect Personal Information, including Sensitive Data, and other information. “Personal Information” means individually identifiable information that would allow us to determine the actual identity of, and contact, a specific living person. Sensitive Data includes information, comments or content (e.g. photographs, video, profile, lifestyle) that you optionally provide that may reveal your ethnic origin, nationality, religion and/or sexual orientation. By providing Sensitive Data to us, you consent to the collection, use and disclosure of Sensitive Data as permitted by applicable privacy laws. We may also collect your geolocation information with your consent. We may collect this information through a website, mobile application, or other online services. By using the Service, you are authorizing us to gather, parse and retain data related to the provision of the Service. When you provide personal information through our Service, the information may be sent to servers located in the United States and countries around the world.\n\nInformation you provide. In order to register as a user with Tinder, you will be asked to sign in using your Facebook login. If you do so, you authorize us to access certain Facebook account information, such as your public Facebook profile (consistent with your privacy settings in Facebook), your email address, interests, likes, gender, birthday, education history, relationship interests, current city, photos, personal description, friend list, and information about and photos of your Facebook friends who might be common Facebook friends with other Tinder users. You will also be asked to allow Tinder to collect your location information from your device when you download or use the Service. In addition, we may collect and store any personal information you provide while using our Service or in some other manner. This may include identifying information, such as your name, address, email address and telephone number, and, if you transact business with us, financial information. You may also provide us photos, a personal description and information about your gender and preferences for recommendations, such as search distance, age range and gender. If you chat with other Tinder users, you provide us the content of your chats, and if you contact us with a customer service or other inquiry, you provide us with the content of that communication.\n\nInformation from other sources.Tinder is part of The Match Group family of businesses, which as of the date of this policy includes websites and apps such as OurTime.com, BlackPeopleMeet.com, OkCupid, Twoo, POF, Meetic, LoveScout24, Match and ParPerfeito. We may obtain both personal and non-personal information about you from other Match businesses, business partners and other third parties.\nUse of technologies to collect information. We use various technologies to collect information from your device and about your activities on our Service.\n\nInformation collected automatically. We automatically collect information from your browser or device when you visit our Service. This information could include your IP address, device ID and type, your browser type and language, the operating system used by your device, access times, your mobile device’s geographic location while our application is actively running, and the referring website address.\n\nCookies and use of cookie and similar data. When you visit our Service, we may assign your device one or more cookies or other technologies that facilitate personalization to facilitate access to our Service and to personalize your experience. Through the use of a cookie, we also may automatically collect information about your activity on our Service, such as the pages you visit, the time and date of your visits and the links you click. If we advertise, we (or third parties) may use certain data collected on our Service to show you Tinder advertisements on other sites or applications.\n\nPixel tags. We embed pixel tags (also called web beacons or clear GIFs) on web pages, ads, and emails. These tiny, invisible graphics are used to access cookies and track user activities (such as how many times a page is viewed). We use pixel tags to measure the popularity of our features and services. Ad companies also use pixel tags to measure the number of ads displayed and their performance (such as how many people clicked on an ad).\n\nMobile device IDs. If you're using our app, we use mobile device IDs (the unique identifier assigned to a device by the manufacturer), or Advertising IDs (for iOS 6 and later), instead of cookies, to recognize you. We do this to store your preferences and track your use of our app. Unlike cookies, device IDs cannot be deleted, but Advertising IDs can be reset in “Settings” on your iPhone. Ad companies also use device IDs or Advertising IDs to track your use of the app, track the number of ads displayed, measure ad performance and display ads that are more relevant to you. Analytics companies use device IDs to track information about app usage.\n\nInformation collected by third-parties for advertising purposes.We may allow service providers, advertising companies and ad networks, and other third parties to display advertisements on our Service and elsewhere. These companies may use tracking technologies, such as cookies or web beacons, to collect information about users who view or interact with their advertisements. We do not provide any non-masked or non-obscured personal information to third parties. Some of these third-party advertising companies may be advertising networks that are members of the Network Advertising Initiative, which offers a single location to opt out of ad targeting from member companies (www.networkadvertising.org). Opting out will not decrease the number of advertisements you see. To opt-out of cookies that may be set by third party data or advertising partners, please go tohttp://www.aboutads.info/choices/.\n\nHow we use the information we collect\n\nIn General. We may use information that we collect about you to:\ndeliver and improve our products and services, and manage our business;\n\nmanage your account and provide you with customer support;\n\nperform research and analysis about your use of, or interest in, our or others’ products, services, or content;\n\ncommunicate with you by email, postal mail, telephone and\\or mobile devices about products or services that may be of interest to you either from us or other third parties;\n\ndevelop, display, and track content and advertising tailored to your interests on our Service and other sites, including providing our advertisements to you when you visit other sites;\n\nwebsite or mobile application analytics;\n\nverify your eligibility and deliver prizes in connection with contests and sweepstakes;\n\nenforce or exercise any rights in ourTerms of Use; and\n\nperform functions or services as otherwise described to you at the time of collection.\n\nJob applicants. If your Personal Information is submitted when applying for a position with our company, the information will be used solely in connection with considering and acting upon your application. We may retain your Personal Information, but only for the purpose of considering your application for current or future available positions. This information, which may include your name and contact information, prior education and experience, and other information you provide to us, may be shared with third-party service providers retained by us to collect, maintain and analyze candidate submissions for job postings.\n\nIn all circumstances, we may perform these functions directly or use a third party vendor to perform these functions on our behalf who will be obligated to use your personal information only to perform services for us. Also, if you access our Service from a third party social platform, such as Facebook, we may share non-personal information with that platform to the extent permitted by your agreement with it and its privacy settings.\n\nWith whom we share your information\n\nInformation Shared with Other Users.When you register as a user of Tinder, your Tinder profile will be viewable by other users of the Service. Other users (and in the case of any sharing features available on Tinder, the individuals or apps with whom a Tinder user may choose to share you with) will be able to view information you have provided to us directly or through Facebook, such as your Facebook photos, any additional photos you upload, your first name, your age, approximate number of miles away, your personal description, and information you have in common with the person viewing your profile, such as common Facebook friends and likes. If you swipe right or use voting buttons to say “yes” to a person, you will be able to chat with that person if they swipe right or use voting buttons to say “yes” to you, e.g., when you have a “match.” If you chat with your match, of course your match will see the content of your chat.\nPersonal information. We do not share your personal information with others except as indicated in this Privacy Policy or when we inform you and give you an opportunity to opt out of having your personal information shared. We may share personal information with:\n\nService providers. We may share information, including personal and financial information, with third parties that perform certain services on our behalf. These services may include fulfilling orders, providing customer service and marketing assistance, performing business and sales analysis, ad tracking and analytics, member screenings, supporting our Service functionality, and supporting contests, sweepstakes, surveys and other features offered through our Service. These service providers may have access to personal information needed to perform their functions but are not permitted to share or use such information for any other purposes.\n"

        return text
    }
    
    func getText2() -> String {
        
        let text = "Other Match Group businesses.The Match Group’s businesses include the online dating websites and apps Match.com, OkCupid, OurTime.com, BlackPeopleMeet.com, Twoo, Meetic, POF, LoveScout24, ParPerfeito and others. We may share information we collect, including your profile and personal information such as your name and contact information, photos, interests, activities and transactions on our Service with other Match Group companies.\n\nOther Situations. We may disclose your information, including personal information:\n\nIn response to a subpoena or similar investigative demand, a court order, or a request for cooperation from a law enforcement or other government agency; to establish or exercise our legal rights; to defend against legal claims; or as otherwise required by law. In such cases, we may raise or waive any legal objection or right available to us.\n\nWhen we believe disclosure is appropriate in connection with efforts to investigate, prevent, or take other action regarding illegal activity, suspected fraud or other wrongdoing; to protect and defend the rights, property or safety of our company, our users, our employees, or others; to comply with applicable law or cooperate with law enforcement; or to enforce ourTerms of Use or other agreements or policies.\n\nIn connection with a substantial corporate transaction, such as the sale of our business, a divestiture, merger, consolidation, or asset sale, or in the unlikely event of bankruptcy.\n\nAggregated and\\or non-personal information. We may use and share non-personal information we collect under any of the above circumstances. We may also share it with other Match Group companies and third parties to develop and deliver targeted advertising on our Service and on websites or applications of third parties, and to analyze and report on advertising you see. We may combine non-personal information we collect with additional non-personal information collected from other sources. We also may share aggregated, non-personal information, or personal information in hashed, non-human readable form, with third parties, including advisors, advertisers and investors, for the purpose of conducting general business analysis, advertising, marketing, or other business purposes. For example, we may engage a data provider who may collect web log data from you (including IP address and information about your browser or operating system), or place or recognize a unique cookie on your browser to enable you to receive customized ads or content. The cookies may reﬂect de-identified demographic or other data linked to data you voluntarily have submitted to us (such as your email address), that we may share with a data provider solely in hashed, non-human readable form. We may also share your geolocation information in de-identified form with Match Group companies and third parties for the above purposes. To opt out of the sharing of your geolocation information, please discontinue use of the Tinder application.\nDo Not Track disclosure\n\nDo Not Track (“DNT”) is a privacy preference that users can set in their web browsers. DNT is a way for users to inform websites and services that they do not want certain information about their webpage visits collected over time and across websites or online services. We are committed to providing you with meaningful choices about the information we collect and that is why we provide the opt-out links above. However, we do not recognize or respond to any DNT signals, as the Internet industry works toward defining exactly what DNT means, what it means to comply with DNT, and a common approach to responding to DNT.\n\nThird-party websites\n\nThere are a number of places on our Service where you may click on a link to access other websites that do not operate under this Privacy Policy. For example, if you click on an advertisement on our Service, you may be taken to a website that we do not control. These third- party websites may independently solicit and collect information, including personal information, from you and, in some instances, provide us with information about your activities on those websites. We recommend that you consult the privacy statements of all third-party websites you visit by clicking on the “privacy” link typically located at the bottom of the webpage you are visiting.\n\nHow you can access and correct your information\n\nIf you have a Tinder account, you have the ability to review and update your personal information within the Service by opening your account and going to settings. Applicable privacy laws may allow you the right to access and\\or request the correction of errors or omissions in your personal information that is in our custody or under our control. Our Privacy Officer will assist you with the access request. This includes:\n\nIdentification of personal information under our custody or control; and\n\nInformation about how personal information under our control may be or has been used by us.\n\nWe will respond to requests within the time allowed by all applicable privacy laws and will make every effort to respond as accurately and completely as possible. Any corrections made to personal information will be promptly sent to any organization to which it was disclosed.\n\nIn certain exceptional circumstances, we may not be able to provide access to certain personal information we hold. For security purposes, not all personal information is accessible and amendable by the Privacy Officer. If access or corrections cannot be provided, we will notify the individual making the request within 30 days, in writing, of the reasons for the refusal.\nData retention\n\nWe keep your information only as long as we need it for legitimate business purposes and as permitted by applicable legal requirements. If you close your account, we will retain certain data for analytical purposes and recordkeeping integrity, as well as to prevent fraud, enforce our Terms of Use, take actions we deem necessary to protect the integrity of our Service or our users, or take other actions otherwise permitted by law. In addition, if certain information has already been provided to third parties as described in this Privacy Policy, retention of that information will be subject to those third parties’ policies.\n\nYour choices about collection and use of your information\n\nYou can choose not to provide us with certain information, but that may result in you being unable to use certain features of our Service because such information may be required in order for you to register as user; purchase products or services; participate in a contest, promotion, survey, or sweepstakes; ask a question; or initiate other transactions.\n\nOur Service may also deliver notifications to your phone or mobile device. You can disable these notifications by going into “App Settings” on the app or by changing the settings on your mobile device.\n\nYou can also control information collected by cookies. You can delete or decline cookies by changing your browser settings. Click “help” in the toolbar of most browsers for instructions.\n\nHow we protect your personal information\n\nWe take security measures to help safeguard your personal information from unauthorized access and disclosure. However, no system can be completely secure. Therefore, although we take steps to secure your information, we do not promise, and you should not expect, that your personal information, chats, or other communications will always remain secure. Users should also take care with how they handle and disclose their personal information and should avoid sending personal information through insecure email. Please refer to the Federal Trade Commission's website athttp://www.ftc.gov/bcp/menus/consumer/data.shtmfor information about how to protect yourself against identity theft.\n\nYou agree that we may communicate with you electronically regarding security, privacy, and administrative issues, such as security breaches. We may post a notice on our Service if a security breach occurs. We may also send an email to you at the email address you have provided to us. You may have a legal right to receive this notice in writing. To receive free written notice of a security breach (or to withdraw your consent from receiving electronic notice), please notify us at privacy@gotinder.com.\n\nInformation you provide about yourself while using our Service\n\nWe provide areas on our Service where you can post information about yourself and others and communicate with others. Such postings are governed by ourTerms of Use. Also, whenever you voluntarily disclose personal information on publicly-viewable pages, that information will be publicly available and can be collected and used by others. For example, if you post your email address, you may receive unsolicited messages. We cannot control who reads your posting or what other users may do with the information you voluntarily post, so we encourage you to exercise discretion and caution with respect to your personal information.\n\nChildren's privacy\n\nAlthough our Service is a general audience Service, we restrict the use of our service to individuals age 18 and above. We do not knowingly collect, maintain, or use personal information from children under the age of 18.\n\nOnward transfer and consent to international processing\n\nWe are a growing corporation with users and operations in multiple countries, including the European Union. We have developed data practices designed to assure information is appropriately protected but we cannot always know where personal information may be accessed or processed. While our primary data centers are in the United States, we may transfer personal information or other information to our offices outside of the United States. In addition, we may employ other companies and individuals to perform functions on our behalf. If we disclose personal information to a third party or to our employees outside of the United States, we will seek assurances that any information we may provide to them is safeguarded adequately and in accordance with this Privacy Policy and the requirements of applicable privacy laws.\n\nIf you are visiting from the European Union or other regions with laws governing data collection and use, please note that you are agreeing to the transfer of your personal data, including sensitive data, by Tinder from your region to countries which do not have data protection laws that provide the same level of protection that exists in countries in the European Economic Area, including the United States. By providing your personal information, you consent to any transfer and processing in accordance with this Policy.\n\nNo Rights of Third Parties\n\nThis Privacy Policy does not create rights enforceable by third parties or require disclosure of any personal information relating to users of the website.\n\nChanges to this Privacy Policy\n\nWe will occasionally update this Privacy Policy to reflect changes in the law, our data collection and use practices, the features of our Service, or advances in technology. When we post changes to this Privacy Policy, we will revise the “last updated” date at the top of this Privacy Policy, which will be posted on the Services under “Settings” and also on gotinder.com, and you should regularly check for the most recent version, which is the version that applies. If we make any material changes to this Privacy Policy, we will notify you of the changes by reasonable means, which could include notifications through the Services or via email. Please review the changes carefully. Your continued use of the Services following the posting of changes to this policy will mean you consent to and accept those changes. If you do not consent to such changes you can delete your account by following the instructions under Settings.\n\nHow to contact us\n\nIf you have any questions about this Privacy Policy, please contact us by email or postal mail as follows:\n\nPrivacy Officer\nTinder, Inc.\n8750 North Central Expressway, Suite 1400\nDallas, TX 75231\nprivacy@gotinder.com"
        
        return text
    }
    
}
