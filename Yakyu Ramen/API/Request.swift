//  Request.swift
//  Yakyu Ramen
//  Created by Gabriel on 9/21/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import Foundation

class Request {
    
    func requestApi(apiUrl: String, queryItems: [URLQueryItem]? = nil, authorization: String? = nil, completion: @escaping (Data) -> () ){
        guard var urlComponents = URLComponents(string: apiUrl) else {return}

        if let paramsQueryItems = queryItems {
            urlComponents.queryItems = paramsQueryItems
        }

        

        guard let url = urlComponents.url else {return}
        var getRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)

        if let authorization = authorization {
          getRequest.setValue(authorization, forHTTPHeaderField: "Authorization")
        }

        


        getRequest.httpMethod = "GET"
        getRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        getRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        

        URLSession.shared.dataTask(with: getRequest, completionHandler: { (data, response, error) -> Void in

            if error != nil { print("GET Request: Communication error: \(error!)") }

            if data != nil {

                guard let jsonData = data else {return}

                completion(jsonData)

//                do {

//                    // usar essa logica de decode aqui

//                    //        let jsonDecoder = JSONDecoder()

//                    //        guard let decodedInfo = jsonDecoder.decode(SearchResults<Restaurant>.self, from: getRequest).businesses else { return}

//                    let resultObject = try JSONSerialization.jsonObject(with: data!, options: [])

//                    DispatchQueue.main.async(execute: {

//                        //print("Results from GET :\n\(resultObject)")

//                         completion(resultObject)

//

//

//                    })

//                } catch {

//                    DispatchQueue.main.async(execute: {

//                        print("Unable to parse JSON response")

//                    })

//                }

            } else {

                DispatchQueue.main.async(execute: {

                    print("Received empty response.")

                })

            }

        }).resume()

        

    }

    

    

}
