//
//  Api.swift
//  Manyavar
//
//  Created by apple on 10/24/18.
//  Copyright © 2018 Applanding Solutions. All rights reserved.
//

import Foundation


public class HeightWeightCalculationApi : NSObject{
    
    @objc func getHeightWeightRating(){
        let measurementCriteria : [String:Any] = [:]
        let parameters: [String : Any] = [ "profileName": "guest",
                                           "profileType": 2,
                                           "website":"" ,
                                           "brandName": "",
                                           "productType": "Kurta",
                                           "productSize": "",
                                           "styleName": "",
                                           "updateFlag": 0,
                                           "productCode": "Men / KURTA / KURTA JACKET",
                                           "measurementCriteria": measurementCriteria,
                                           "measurementCriteria1" : [UserSelectedValues.shape,
                                                                     UserSelectedValues.height,
                                                                     UserSelectedValues.weight,
                                                                     UserSelectedValues.fitprefer]
        ]
        
        guard let url = URL(string: "https://www.sizenfit.com/api/fitting/saveHeightWeightSample") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if response != nil {
                //                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    let json1 = json as! [String:Any]
                    print(json)
                    
                    let dataStoreDictionary2 = json1["data"] as? [String:Any]
                    //                    print("yahhoo1",dataStoreDictionary2)
                    
//                    let dataStoreDictionary3 = dataStoreDictionary2!["sizeListArray"] as? [String:Any]
                    //                    print("yahhoo2",dataStoreDictionary3)
                    
                    let finalData = dataStoreDictionary2!["sizeListArray"] as? [String:Any]
                    //                    print("yahhoo3",finalData)
                    
                    let shoulder = finalData!["shoulder"] as? Double
                    let shape = finalData!["shape"] as? Int
                    let fitprefer = finalData!["fitprefer"] as? Int
                    let bust = finalData!["bust"] as? Double
                    let height = finalData!["height"] as? Int
                    let weight = finalData!["weight"] as? Int
                    let waist = finalData!["waist"] as? Double
                    let hip = finalData!["hip"] as? Double
                    let length = finalData!["length"] as? Double
                    let chest = finalData!["chest"] as? Double
                    
                    
                    //                    print("height",height)
                    //                    print("weight",weight)
                    
                    
                    
                    let measurementCriteria : [String:Any] = [
                        "height": height!,
                        "weight": weight!,
                        "shape": shape!,
                        "fitprefer": fitprefer!,
                        "chest": chest!,
                        "hip": hip!,
                        "bust": bust!,
                        "waist": waist!,
                        "length": length!,
                        "shoulder": shoulder!,
                        ]
                    
                    let parameters: [String : Any] = [ "profileName": "guest",
                                                       "profileType": 2,
                                                       "website":"" ,
                                                       "brandName": "",
                                                       "productType": "Kurta",
                                                       "productSize": "",
                                                       "styleName": "",
                                                       "updateFlag": 0,
                                                       "productCode": "Men / KURTA / KURTA JACKET",
                                                       "measurementCriteria": measurementCriteria,
                                                       "measurementCriteria1" : [UserSelectedValues.shape,
                                                                                 UserSelectedValues.height,
                                                                                 UserSelectedValues.weight,
                                                                                 UserSelectedValues.fitprefer],
                                                       "userName": "snfuser1540460435197@device.com"
                    ]
                    
                    guard let url = URL(string: "https://www.sizenfit.com/api/fitting/saveFittingSample") else { return }
                    
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else { return }
                    request.httpBody = httpBody
                    
                    let session = URLSession.shared
                    session.dataTask(with: request) { (data, response, error) in
                        if response != nil {
                            //                            print(response)
                        }
                        
                        if let data = data {
                            do {
                                let json = try JSONSerialization.jsonObject(with: data, options: [])
                                
                                let json1 = json as! [String:Any]
                                print("Finally Stored",json)
                                
                                let suc = json1["status"] as! String
                                //                                print(suc)
                                
                                let eq = (suc == "success")
                                //                                print (eq)
                                
                                if (eq) {
                                    print("yaya")
                                    //snfuser1540793038874@device.com  GUEST
                                    self.getRequest(params:[ "productCode": "Men / KURTA / KURTA JACKET",
                                                             "profileName":"guest" ,
                                                             "productUrl": "",
                                                             "userName": "snfuser1540460435197@device.com",
                                                             "website": "www.maanyavar.com"])
                                }else{
                                    print("Couldn't save fitting sample profie")
                                }
                            } catch {
                                print(error)
                            }
                        }
                        
                        }.resume()
                } catch {
                    print(error)
                }
            }
            
            }.resume()
    }
    
    @objc func getRequest(params: [String:String]) {
        
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
                    //                    print("yahhoo1",dataStoreDictionary2)
                    
                    let dataStoreDictionary3 = dataStoreDictionary2!["widgetStatus"] as? [String:Any]
                    //                    print("yahhoo2",dataStoreDictionary3)
                    
                    let finalData1 = dataStoreDictionary3!["data"] as? [String:Any]
                    //                    print("yahhooz",finalData1)
                    
                    let finalData = finalData1!["scoreDetails"] as? [[String:Any]]
                    //                    print("yahhoo3",finalData)
                    
                    
                    //                    print(finalData![0])
                    //                    print(finalData?.count)
                    
                    let a = finalData!.count
                    
                    var sizeFinal = "" , scoreFinal = 0.0;
                    
                    for i in 0 ... (a-1) {
                        
                        //                        print (finalData![i])
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
                    
//                    print("Displaying Next Screen")
                    UserSelectedValues.nextScreen = 1
                    UserSelectedValues.viewUsedToCalculate = "HeightWeight"
                    UserSelectedValues.profileName = "guest"
                    CheckForButton.statusCode = 5
                } catch {
                    print(error)
                }
            }
            }.resume()
    }

}
