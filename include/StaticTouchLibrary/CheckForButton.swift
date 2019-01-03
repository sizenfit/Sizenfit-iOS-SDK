//
//  CheckForButton.swift
//  SizeNFit
//
//  Created by apple on 12/13/18.
//  Copyright © 2018 SizeNFit. All rights reserved.
//

import Foundation

public class CheckForButton : NSObject{
    @objc public static var productCode: NSString = ""
    @objc public static var profileType: NSString = ""
    @objc public static var productType: NSString = ""
    @objc public static var website: NSString = ""
    @objc public static var userName : NSString = ""
    @objc public static var statusCode : NSInteger = 0
    
    @objc static func callApi() -> NSInteger{
        print("Calling Api")
        self.getRequest(params:[ "productCode": productCode as String,
                                 "profileName":UserSelectedValues.profileName as String ,
                                 "productUrl": "",
                                 "userName": userName as String,
                                 "website": website as String])
        print("Called Api")
        return 1;
    }
    
    @objc static func checkButton(){
//        self.getRequest(params:[ "productCode": "Men / KURTA / KURTA JACKET",
//                                 "profileName":"",
//                                 "productUrl": "",
//                                 "userName": "snfuser1540460435197@device.com",
//                                 "website": "www.manyavar.com"])
        
        self.getRequest(params:[ "productCode": productCode as String,
                                 "profileName":UserSelectedValues.profileName as String ,
                                 "productUrl": "",
                                 "userName": userName as String,
                                 "website": website as String])
    }
    
    
    static func getRequest(params: [String:String]) {
        
        let urlComp = NSURLComponents(string: "https://www.sizenfit.com/api/fitting/widgetDisplay")!
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
                    print("get Api Data" , json)
                    let json1 = json as! [String:Any]
                    
                    let dataStoreDictionary2 = json1["data"] as? [String:Any]
//                    print("yahhoo1",dataStoreDictionary2 as Any)
                    
                    let dataStoreDictionary3 = dataStoreDictionary2!["widgetStatus"] as? [String:Any]
//                    print("yahhoo2",dataStoreDictionary3 as Any)
                    
                    let statusCode1 = dataStoreDictionary3!["code"] as? Int
//                    print("Final Code To check" , statusCode1 ?? 0)
                    CheckForButton.statusCode = statusCode1!
                    statusCode = statusCode1!
                    
                    if(statusCode == 4 || statusCode == 5){
                        let finalData1 = dataStoreDictionary3!["data"] as? [String:Any]
                        //                    print("yahhooz",finalData1)
                        
                        let finalData = finalData1!["scoreDetails"] as? [[String:Any]]
                        //                    print("yahhoo3",finalData)
                        
                        
                        //                    print(finalData![0])
                        //                    print(finalData?.count)
                        
                        let a = finalData!.count
                        
                        var sizeFinal = "" , scoreFinal = 0.0;
                        
                        for i in 0 ... (a-1) {
                            let size = finalData![i]["productSize"] as! String
                            let score = finalData![i]["overallFitScore"] as! Double
                            
                            if(score > scoreFinal){
                                UserSelectedValues.selectedShapeRow = i
                                scoreFinal = score;
                                sizeFinal = size;
                            }
                        }
                        
                        print("Recommended:- " , sizeFinal , " Score:- " , Int(scoreFinal*10 + 50))
                        
                        UserSelectedValues.finalSize = sizeFinal as NSString
                        UserSelectedValues.finalRating = Int(scoreFinal*10 + 50)
                        UserSelectedValues.finalData = finalData! as NSArray
                        UserSelectedValues.nextScreen = 1
//                        UserSelectedValues.viewUsedToCalculate = "Brand"
                        UserSelectedValues.profileName = "guest"
                        CheckForButton.statusCode = 5
                    }
                    
                    
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
}
