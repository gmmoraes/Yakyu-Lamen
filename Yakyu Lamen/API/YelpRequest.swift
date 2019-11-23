//
//  yelpRequest.swift
//  Yakyu Lamen
//
//  Created by Gabriel on 9/7/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import Foundation

class YelpRequest {
    
    static let sharedInstance = YelpRequest()
    //obs estrutra do request ta certa, mas precisa passar location ou latitude (ver como é feito no viewDidLoad do ... com o
    //StoresTableViewController
    
//   34.392126  132.484640     {
//            error =     {
//                code = "VALIDATION_ERROR";
//                description = "Please specify a location or a latitude and longitude";
//            };
//    }
    func requestApi(location: String){
        let getURL = URL(string: "https://api.yelp.com/v3/businesses/search")!
        var getRequest = URLRequest(url: getURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        
        

//Usar o url componente no lugar da get url (ver como) pq aceita parameter
        let urlComponents = NSURLComponents(string: "https://api.yelp.com/v3/businesses/search")!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "term", value: "ramen"),
            URLQueryItem(name: "location", value: location),
            URLQueryItem(name: "limit", value: "50")
            ]
        
        
        getRequest.setValue("Bearer uyLqdyV33s7KBJ4IPy89H9f2b3p3XpnDkRXy0ybJlAlaPSe_7Pd2JLgtT-NV-Lh4RnLwyv-XEfEGE3IJL_qlAAEeuosPEq93DSdCmwtBS7CjWNSH9ZqviYjIixwMXHYx", forHTTPHeaderField: "Authorization")
        getRequest.timeoutInterval = 10
        getRequest.httpMethod = "GET"
        getRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        getRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: getRequest, completionHandler: { (data, response, error) -> Void in
            if error != nil { print("GET Request: Communication error: \(error!)") }
            if data != nil {
                do {
                    // usar essa logica de decode aqui
                    //        let jsonDecoder = JSONDecoder()
                    //        guard let decodedInfo = jsonDecoder.decode(SearchResults<Restaurant>.self, from: getRequest).businesses else { return}
                    let resultObject = try JSONSerialization.jsonObject(with: data!, options: [])
                    DispatchQueue.main.async(execute: {
                        print("Results from GET https://httpbin.org/get?bar=foo :\n\(resultObject)") })
                } catch {
                    DispatchQueue.main.async(execute: {
                        print("Unable to parse JSON response")
                    })
                }
            } else {
                DispatchQueue.main.async(execute: {
                    print("Received empty response.")
                })
            }
        }).resume()
        
    }
    

}
