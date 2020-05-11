//
//  APIRequests.swift
//  Cats by Evens Taian
//
//  Created by Evens Taian on 11/05/20.
//  Copyright © 2020 Evens Taian. All rights reserved.
//
import Foundation

private func getConfiguration() -> URLSessionConfiguration {
    
    let config = URLSessionConfiguration.default
    config.httpAdditionalHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : "Client-ID 1ceddedc03a5d71"]
    return config
}

func getSession() -> URLSession{
    return URLSession(configuration: getConfiguration())
}

class APIRequests : APISettings {
    
    class func getCats(onComplete: @escaping (Data) -> Void){
        
        var request = URLRequest(url: Constants.baseURL!)
        request.httpMethod = "GET"
        
        let dataTask = getSession().dataTask(with: request) { (data, response, error) in
            if error == nil {
                onComplete(data!)
            }else{
                print(error!)
            }
        }
        dataTask.resume()
    }
}
