//
//  API Caller.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 09.10.2021.
//

import Foundation

    func getAndrewData() {
        let url = URL(string: "https://api-beauty.test.dikidi.ru/home/info?")
        let APIkey = "maJ9RyT4TJLt7bmvYXU7M3h4F797fUKofUf3373foN94q4peAM"
        guard let url = url else {
            return
        }
            
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIkey, forHTTPHeaderField: "Authorization")

        // executing the call
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request, completionHandler: {data, response, error -> Void in
                
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print(error)
            }
        })
        task.resume()
    }

