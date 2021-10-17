//
//  API Caller.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 09.10.2021.
//
import Foundation
import SwiftUI

struct APICall {
    func getAndrewData() {
        let url = URL(string: "https://api-beauty.test.dikidi.ru/home/info?")
        let APIkey = "maJ9RyT4TJLt7bmvYXU7M3h4F797fUKofUf3373foN94q4peAM"
        guard let url = url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIkey, forHTTPHeaderField: "Authorization")
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // executing the call
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request, completionHandler: {data, response, error -> Void in
            
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: [JSONSerialization.WritingOptions.withoutEscapingSlashes])
                let string = (String(data: jsonData, encoding: String.Encoding.utf8))
                guard let string = string else {return}
                let newString = string.filter{$0 != "\\"}
                print(newString)
                
            } catch {
                print(error)
            }
        })
        task.resume()
        getAndrewData()
    

    }
}

class ImageCall {
    func imageManager(completionHeadler: @escaping (Image) -> ()) {
        let url = URL(string: "https://api-beauty.test.dikidi.ru/home/info?")
        let APIkey = "maJ9RyT4TJLt7bmvYXU7M3h4F797fUKofUf3373foN94q4peAM"
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue(APIkey, forHTTPHeaderField: "Authorization")
        
            let task = URLSession.shared.dikidiTask(with: request) { dikidi, response, error in
                if let dikidi = dikidi {
                //completionHeadler((dikidi.data?.blocks?.catalog?[0].image! ?? "")!)
                    }
                }
                task.resume()
        }
}
