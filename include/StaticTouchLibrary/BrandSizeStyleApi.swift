//
//  BrandFlowApi.swift
//  Manyavar
//
//  Created by apple on 10/29/18.
//  Copyright © 2018 Applanding Solutions. All rights reserved.
//

import Foundation


public class BrandSizeStyleApi : NSObject{
    @objc func getBrands(){
        self.getRequest(params:[ "clothingType": "Kurta",
                                 "enterpriseDomain":"www.manyavar.com" ,
                                 "profileType": "2"])
    }
    
    @objc func getSizes() {
        let finalDataStyles = UserSelectedValues.styleSize as! [[String:Any]]
        let x = finalDataStyles.count
        
        print("Count for styles" , x)
        UserSelectedValues.styleCount = x
        var sizeArr : Array = [String]()
        
        let style = finalDataStyles[UserSelectedValues.styleTag]["style"] as! String
        print("style from Outest Loop:- ", style)
            
        let styleSelected = UserSelectedValues.selectedStyle as String
        print("Selected Style from Outest Loop:- ", styleSelected)
            
        if(styleSelected == style){
                
            print("Updating SIZE List for the selected style:- ", styleSelected);
            let finalDataSizes = finalDataStyles[UserSelectedValues.styleTag]["sizes"] as? NSArray
                
            let y = finalDataSizes!.count
            print("Count for sizes" , y)
            UserSelectedValues.sizeCount = y
            for k in  0 ... (y-1){
                    let sizeL = finalDataSizes![k] as! String
                    print("Size from Inner Loop:- ", sizeL)
                    sizeArr.append(sizeL)
            }
            UserSelectedValues.sizeArray = sizeArr as NSArray
        }
        UserSelectedValues.styleArrayData = "Present"
        UserSelectedValues.waitForSizes = "No"
        
//        for j in 0 ... (x-1) {
//            let style = finalDataStyles[j]["style"] as! String
//            print("style from Outest Loop:- ", style)
//
//            let styleSelected = UserSelectedValues.selectedStyle as String
//            print("Selected Style from Outest Loop:- ", styleSelected)
//
//            if(styleSelected == style){
//
//                print("Updating SIZE List for the selected style:- ", styleSelected);
//                let finalDataSizes = finalDataStyles[j]["sizes"] as? NSArray
//
//                let y = finalDataSizes!.count
//                print("Count for sizes" , y)
//                UserSelectedValues.sizeCount = y
//                for k in  0 ... (y-1){
//                    let sizeL = finalDataSizes![k] as! String
//                    print("Size from Inner Loop:- ", sizeL)
//                    sizeArr.append(sizeL)
//                }
//                UserSelectedValues.sizeArray = sizeArr as NSArray
//            }
//            UserSelectedValues.styleArrayData = "Present"
//            UserSelectedValues.waitForSizes = "No"
//        }
    }
    
    @objc func getStyles() {
        
        let finalData = UserSelectedValues.brandsStyleSize as! [[String:Any]]
        let a = UserSelectedValues.countBrandStyleSize
        
        for i in 0 ... (a-1) {
            
//            print ("Complete Data",finalData[i])
            let brandName = finalData[i]["name"] as! String
//            print("Brand from Outest Loop:- ", brandName)
            let brandSelected = UserSelectedValues.selectedBrand as String
            
            if(brandSelected == brandName){
                print("MatchFound")
                let finalDataStyles = finalData[i]["styles"] as? [[String:Any]]
//                print("Fetched Styles" , finalDataStyles as Any)
                UserSelectedValues.styleSize = finalDataStyles! as NSArray
                self.getStyle()
                break
            }else{
                print("No Match Found")
            }
        }
    }
    
    func getStyle() {
        let finalDataStyles = UserSelectedValues.styleSize as! [[String:Any]]
        let x = finalDataStyles.count
        print("Count for styles" , x)
        UserSelectedValues.styleCount = x
        var styleArr : Array = [String]()
        var sizeArr : Array = [String]()
        let selectedStyle = UserSelectedValues.selectedStyle
        
        for j in 0 ... (x-1) {
            let style = finalDataStyles[j]["style"] as! String
            print("style from Outest Loop:- ", style)
            if(selectedStyle as String == ""){
                if(j==0){
                    let finalDataSizes = finalDataStyles[j]["sizes"] as? NSArray
                    let y = finalDataSizes!.count
                    print("Count for sizes" , y)
                    UserSelectedValues.sizeCount = y
                    for k in  0 ... (y-1){
                        let sizeL = finalDataSizes![k] as! String
                        print("Size from Inner Loop:- ", sizeL)
                        sizeArr.append(sizeL)
                    }
                    UserSelectedValues.sizeArray = sizeArr as NSArray
                }else{
                    let finalDataSizes = finalDataStyles[j]["sizes"] as? NSArray
                    let y = finalDataSizes!.count
                    for k in  0 ... (y-1){
                        let sizeL = finalDataSizes![k] as! String
                        print("Size from Inner Loop:- ", sizeL)
                    }
                }
            }else{
                if(selectedStyle as String == style){
                    let finalDataSizes = finalDataStyles[j]["sizes"] as? NSArray
                    let y = finalDataSizes!.count
                    print("Count for sizes" , y)
                    UserSelectedValues.sizeCount = y
                    UserSelectedValues.styleSelectedCountPos = j;
                    for k in  0 ... (y-1){
                        let sizeL = finalDataSizes![k] as! String
                        print("Size from Inner Loop:- ", sizeL)
                        if(UserSelectedValues.selectedSize as String == sizeL){
                            UserSelectedValues.sizeSelectedCountPos = k;
                        }
                        sizeArr.append(sizeL)
                    }
                    UserSelectedValues.sizeArray = sizeArr as NSArray
                }else{
                    let finalDataSizes = finalDataStyles[j]["sizes"] as? NSArray
                    let y = finalDataSizes!.count
                    for k in  0 ... (y-1){
                        let sizeL = finalDataSizes![k] as! String
                        print("Size from Inner Loop:- ", sizeL)
                    }
                }
            }
            
            
            
            styleArr.append(style)
            UserSelectedValues.styleArray = styleArr as NSArray
            UserSelectedValues.styleArrayData = "Present"
        }
        
        
    }
    
    func getRequest(params: [String:String]) {
        
        let urlComp = NSURLComponents(string: "https://www.sizenfit.com/api/fitting/getBrandStyles")!
        var items = [URLQueryItem]()
        
        for (key,value) in params {
            items.append(URLQueryItem(name: key, value: value))
        }
        
        items = items.filter{!$0.name.isEmpty}
        
        if !items.isEmpty {
            urlComp.queryItems = items
        }
        
        var urlRequest = URLRequest(url: urlComp.url!)
        urlRequest.httpMethod = "GET"
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        _ = session.dataTask(with: urlRequest) { (data, response, error) in
            if response != nil {
                //                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    //                    print("get Api Data" , json)
                    let json1 = json as! [String:Any]
                    
                    let dataStoreDictionary2 = json1["data"] as? [String:Any]
                    //                    print("yahhoo1",dataStoreDictionary2)
                    //
                    //                    let dataStoreDictionary3 = dataStoreDictionary2!["widgetStatus"] as? [String:Any]
                    ////                    print("yahhoo2",dataStoreDictionary3)
                    //
                    //                    let finalData1 = dataStoreDictionary3!["data"] as? [String:Any]
                    ////                    print("yahhooz",finalData1)
                    //
                    let finalData = dataStoreDictionary2!["brands"] as? [[String:Any]]
                    //                    print("yahhoo3",finalData)
                    
                    
                    //                    print(finalData![0])
                    print(finalData?.count as Any)
                    
                    let a = finalData!.count
                    print("Count for brands" , a)
                    
                    UserSelectedValues.countBrandStyleSize = a
                    UserSelectedValues.brandsStyleSize = finalData! as NSArray
                    
                    var brandArr : Array = [String]()
                    
                    for i in 0 ... (a-1) {
                        let brandName = finalData![i]["name"] as! String
                        print("Brand from Outest Loop:- ", brandName)
                        brandArr.append(brandName)
                    }
                    brandArr.sort()
                    print("All Brands" , brandArr)
                    UserSelectedValues.brandsArray = brandArr as NSArray
                    UserSelectedValues.brandsArrayData = "Present"
                    
                } catch {
                    print(error)
                }
            }
            }.resume()
    }

}
