import Foundation


public class TechSpecListDetailApi : NSObject{
    
    @objc func getData(){
//        print("product_code" , productCode)
        
        getTechSpecDetail(params:[ "productCode": "Men / KURTA / KURTA JACKET"])
    }
    
    @objc func sortData(){
        
        let i = UserSelectedValues.currentCountTechSpec
        let finalData = UserSelectedValues.techSpecDetail as! [[String:Any]]
        
//        print (finalData[i])
        
        let productSize = finalData[i]["productSize"] as! String
            
//        _ = finalData[i]["productDetailsId"] as! Double
        
        let criteria = finalData[i]["criteria"] as! [String:Any]
//                                                print("criteria", criteria)
        
        let chest = criteria["chest"] as! NSNumber
        let waist = criteria["waist"] as! NSNumber
        let hip = criteria["hip"] as! NSNumber
        let shoulder = criteria["shoulder"] as! NSNumber
        
        let chest1 = criteria["chest"] as! Double
        let waist1 = criteria["waist"] as! Double
        let hip1 = criteria["hip"] as! Double
        let shoulder1 = criteria["shoulder"] as! Double
        
        let chestcm = round(chest1 * 2.54) as NSNumber
        let waistcm = round(waist1 * 2.54) as NSNumber
        let hipcm = round(hip1 * 2.54) as NSNumber
        let shouldercm = round(shoulder1 * 2.54) as NSNumber
//        print("Data For i:- " , productSize ," " , chest," " , waist," " , hip," " , shoulder)
        UserSelectedValues.productSizeTS = productSize as NSString
        UserSelectedValues.chestTS = chest.stringValue as NSString
        UserSelectedValues.waistTS = waist.stringValue as NSString
        UserSelectedValues.hipTS = hip.stringValue as NSString
        UserSelectedValues.shoulderTS = shoulder.stringValue as NSString
        
        UserSelectedValues.chestCmTS = chestcm.stringValue as NSString
        UserSelectedValues.waistCmTS = waistcm.stringValue as NSString
        UserSelectedValues.hipCmTS = hipcm.stringValue as NSString
        UserSelectedValues.shoulderCmTS = shouldercm.stringValue as NSString
        
    }
    
    @objc func getTechSpecDetail(params: [String:String]) {
        let urlComp = NSURLComponents(string: "https://www.sizenfit.com/admin/api/admin/getTechSpecList")!
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
                    
                    let finalData = dataStoreDictionary2!["techSpecList"] as? [[String:Any]]
                    
                    let productIdentifierId = finalData![0]["productIdentifierId"] as! CLong
//                    print("yahhooz",productIdentifierId)
                    
                    let urlComp = NSURLComponents(string: "https://www.sizenfit.com/admin/api/admin/getTechSpecDetail?productIdentifierId=\(productIdentifierId)")!
                    
//                    print("https://www.sizenfit.com/admin/api/admin/getTechSpecDetail?productIdentifierId=\(productIdentifierId)")
                    
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
                                
                                let json1 = json as! [String:Any]
//                                print("TechSpecDetail:- " , json1)
                                
                                let dataStoreDictionary2 = json1["data"] as? [String:Any]
//                                print("yahhoo1",dataStoreDictionary2)
                                
                                let finalData = dataStoreDictionary2!["productDetails"] as? [[String:Any]]
//                                print("yahoo2", finalData as Any)
//                                print("length" , finalData?.count as Any)
//
//                                print(finalData?.count as Any)
                                
                                let a = finalData!.count
                                
                                UserSelectedValues.countTechSpec = a
                                UserSelectedValues.techSpecDetail = finalData! as NSArray
                                
//                                for i in 0 ... (a-1) {
//                                    print (finalData![i])
//
//                                    var productSize = finalData![i]["productSize"] as! String
//
//                                    var productDetailsId = finalData![i]["productDetailsId"] as! Double
//
//                                    let criteria = finalData![i]["criteria"] as! [String:Any]
//                                    print("criteria", criteria)
//
//                                    var chest = criteria["chest"] as! Double
//                                    var waist = criteria["waist"] as! Double
//                                    var hip = criteria["hip"] as! Double
//                                    var shoulder = criteria["shoulder"] as! Double
//
//                                    print("Data For i:- " , productSize ," " , chest," " , waist," " , hip," " , shoulder)
//                                }
                                
//                                print(UserSelectedValues.techSpecDetail)
                                
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
       
}
