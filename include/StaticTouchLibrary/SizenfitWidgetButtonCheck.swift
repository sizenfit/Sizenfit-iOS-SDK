//
//  SizenfitWidgetButtonCheck.swift
//  SizeNFit
//
//  Created by apple on 12/13/18.
//  Copyright © 2018 SizeNFit. All rights reserved.
//

import Foundation

public class SizenfitWidgetButtonCheck : NSObject{
    
    @objc public var productCode: NSString = ""
    @objc public var profileType: NSString = ""
    @objc public var productType: NSString = ""
    @objc public var userName : NSString = ""
    @objc public var website: NSString = ""
    
    @objc func assignVal(productCode: NSString , profileType: NSString,
                         productType: NSString , website: NSString ,userName : NSString){
        self.productCode = productCode
        self.productType = productType
        self.profileType = profileType
        self.website = website
        self.userName = userName
        CheckForButton.productCode = productCode
        CheckForButton.productType = productType
        CheckForButton.profileType = profileType
        CheckForButton.website = website
        CheckForButton.userName = userName
        CheckForButton.checkButton()
        print("Called dead Dddddddddddd")
        
    }
    
//    @objc func assignVal1(productCode: NSString , profileType: NSString,
//                         productType: NSString , website: NSString){
//        self.productCode = productCode
//        self.productType = productType
//        self.profileType = profileType
//        self.website = website
//        CheckForButton.productCode = productCode
//        CheckForButton.productType = productType
//        CheckForButton.profileType = profileType
//        CheckForButton.website = website
//        print("Called Other")
//    }
}
