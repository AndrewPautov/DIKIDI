//
//  API Caller.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 09.10.2021.
//
import Foundation
import SwiftUI
import Combine

struct APICall {
    static func getAndrewData() {
        let url = URL(string: "https://api-beauty.test.dikidi.ru/home/info?")
        let APIkey = "maJ9RyT4TJLt7bmvYXU7M3h4F797fUKofUf3373foN94q4peAM"
        guard let url = url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIkey, forHTTPHeaderField: "Authorization")
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request, completionHandler: {data, response, error -> Void in
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: [JSONSerialization.WritingOptions.withoutEscapingSlashes])
                let string = (String(data: jsonData, encoding: String.Encoding.utf8))
                guard let string = string else {return}
                let newString = string.filter{$0 != "\\"}
                
            } catch {
                print(error)
            }
        })
        task.resume()
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URLRequest, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, nil)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func dikidiTask(with url: URLRequest, completionHandler: @escaping (Dikidi?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}


class ImageCall: ObservableObject {
    
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    func imageManager(_ completionHeadler: ((ImageModel) -> ())? = nil) {
        
        APICall.getAndrewData()
        
        let url = URL(string: "https://api-beauty.test.dikidi.ru/home/info?")
        let APIkey = "maJ9RyT4TJLt7bmvYXU7M3h4F797fUKofUf3373foN94q4peAM"
        guard let url = url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIkey, forHTTPHeaderField: "Authorization")
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
    
            let task = URLSession.shared.dikidiTask(with: request) { dikidi, response, error in
                if let dikidi = dikidi {
                    DispatchQueue.main.async {
                        if let url = URL(string: dikidi.data.image) {
                            self.data = try! Data(contentsOf: url)
                        }
                    }
                } else {

                }
            }
        task.resume()
    }

    func examplesManager(_ completionHeandler: ((ImageModel) -> ())? = nil) {
        
        APICall.getAndrewData()
        
        let url = URL(string: "https://api-beauty.test.dikidi.ru/home/info?")
        let APIkey = "maJ9RyT4TJLt7bmvYXU7M3h4F797fUKofUf3373foN94q4peAM"
        guard let url = url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIkey, forHTTPHeaderField: "Authorization")
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
    
            let task = URLSession.shared.dikidiTask(with: request) { dikidi, response, error in
                if let dikidi = dikidi {
                    DispatchQueue.main.async {
                        if let url = URL(string: dikidi.data.blocks.examples) {
                            self.data = try! Data(contentsOf: url)
                        }
                    }
                } else {

                }
            }
        
        task.resume()
    }
}
