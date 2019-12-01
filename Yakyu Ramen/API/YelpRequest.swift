//
//  yelpRequest.swift
//  Yakyu Ramen
//  Created by Gabriel on 9/7/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import Foundation

class YelpRequest: Request {

    static let sharedInstance = YelpRequest()
    let yelpUrl =  "https://api.yelp.com/v3/businesses/search"
    var queryItems = [

                    URLQueryItem(name: "term", value: "ramen"),

                    //URLQueryItem(name: "location", value: location),

                    URLQueryItem(name: "limit", value: "50")

                    ]

    let authorization = "Bearer uyLqdyV33s7KBJ4IPy89H9f2b3p3XpnDkRXy0ybJlAlaPSe_7Pd2JLgtT-NV-Lh4RnLwyv-XEfEGE3IJL_qlAAEeuosPEq93DSdCmwtBS7CjWNSH9ZqviYjIixwMXHYx"

    

    override init() {

        super.init()

    }

    

    func configureLocation(location:String, completion: @escaping ([Restaurant]) -> () ){

        let newUrlQuery = URLQueryItem(name: "location", value: location)

        queryItems.append(newUrlQuery)

        requestApi(apiUrl: yelpUrl, queryItems: queryItems, authorization: authorization){ (resultObject) -> () in

            let jsonDecoder = JSONDecoder()


            do {

                

            let response = try jsonDecoder.decode(SearchResults<Restaurant>.self, from: resultObject).businesses

                completion(response)

            } catch {

                DispatchQueue.main.async(execute: {

                    print("Unable to parse JSON response")

                })

            }

            

        }

    }

}
