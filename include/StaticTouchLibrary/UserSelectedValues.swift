//
//  UserSelectedValues.swift
//  Manyavar
//
//  Created by apple on 10/24/18.
//  Copyright © 2018 Applanding Solutions. All rights reserved.
//
import UIKit
import Foundation

public class UserSelectedValues : NSObject {
    @objc public static var height: NSInteger = 0
    @objc public static var weight: NSInteger = 0
    @objc public static var fitprefer: NSInteger = 0
    @objc public static var shape: NSInteger = 0
    @objc public static var nextScreen : NSInteger = 0
    
    @objc public static var selectedBrand : NSString = ""
    @objc public static var selectedStyle : NSString = ""
    @objc public static var selectedSize : NSString = ""
    
    @objc public static var brandsStyleSize : NSArray = [[:]]
    @objc public static var styleSize : NSArray = [[:]]
    @objc public static var countBrandStyleSize : NSInteger = 0
    @objc public static var brandsArray : NSArray = []
    @objc public static var styleArray : NSArray = []
    @objc public static var sizeArray : NSArray = []
    @objc public static var brandCount : NSInteger = 0
    @objc public static var styleCount : NSInteger = 0
    @objc public static var sizeCount : NSInteger = 0
    @objc public static var brandsArrayData : NSString = "No"
    @objc public static var styleArrayData : NSString = "No"

    
    @objc public static var techSpecDetail : NSArray = [[:]]
    @objc public static var countTechSpec : NSInteger = 0
    @objc public static var currentCountTechSpec : NSInteger = 0
    
    @objc public static var selectedShapeRow : NSInteger = -1
    @objc public static var finalRating: NSInteger = 0
    @objc public static var finalSize: NSString = ""
    
    @objc public static var fitpreferStr : NSString = ""
    @objc public static var shapeStr: NSString = ""
    
    @objc public static var productSizeTS: NSString = ""
    @objc public static var chestTS: NSString = ""
    @objc public static var hipTS: NSString = ""
    @objc public static var waistTS: NSString = ""
    @objc public static var shoulderTS: NSString = ""
    @objc public static var chestCmTS: NSString = ""
    @objc public static var hipCmTS: NSString = ""
    @objc public static var waistCmTS: NSString = ""
    @objc public static var shoulderCmTS: NSString = ""
    
    @objc public static var waitForSizes : NSString = "Yes"
    
    @objc public static var viewUsedToCalculate : NSString = ""
    
    @objc public static var sharedPrefrenceBrand : NSString = ""
    @objc public static var sharedPrefrenceStyle : NSString = ""
    @objc public static var sharedPrefrenceSize : NSString = ""
    
    @objc public static var sizeSelectedCountPos : NSInteger = -1
    @objc public static var styleSelectedCountPos : NSInteger = -1
    
     @objc public static var styleTag : NSInteger = -1
     @objc public static var sizeTag : NSInteger = -1
    
    @objc public static var finalData : NSArray = [[:]]
    
    @objc public static var profileType : NSString = "Men"
    @objc public static var profileName : NSString = ""
}
