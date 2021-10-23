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
    static func getData() {
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
        let task = session.dataTask(with: request, completionHandler: {data, _, error -> Void in

            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])  
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: [JSONSerialization.WritingOptions.withoutEscapingSlashes])
                let string = (String(data: jsonData, encoding: String.Encoding.utf8))
                guard let string = string else {return}
                let newString = string.filter {$0 != "\\"}

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
    var didChangeExampleImage = PassthroughSubject<Data, Never>()
    var didChangeCatalogImage = PassthroughSubject<Data, Never>()
    var didChangeCatalogImage1 = PassthroughSubject<Data, Never>()
    //var didChangedName = PassthroughSubject<Data, Never>()

    var headerImage = Data() {
        didSet {
            didChange.send(headerImage)
        }
    }
    
    var exampleImage = Data() {
        didSet {
            didChangeExampleImage.send(exampleImage)
        }
    }
    
    var catalogImage = Data() {
        didSet {
            didChangeCatalogImage.send(catalogImage)
        }
    }
    
    var catalogImage1 = Data() {
        didSet {
            didChangeCatalogImage1.send(catalogImage1)
        }
    }
    
//    var nameString = Data() {
//        didSet {
//            didChangedName.send(nameString)
//        }
//    }

    func getImages() {
        imageManager()
        examplesManager()
        workshopsManager()
        workshops1Manager()
        //nameManager()
    }

   private func getRequest() -> URLRequest? {
        let url = URL(string: "https://api-beauty.test.dikidi.ru/home/info?")
        let APIkey = "maJ9RyT4TJLt7bmvYXU7M3h4F797fUKofUf3373foN94q4peAM"
        
        guard let url = url else { return nil}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIkey, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
       
       return request
    }
    
    func imageManager(_ completionHeadler: ((ImageModel) -> Void)? = nil) {
        guard let request = getRequest() else { return }
        URLSession.shared.dikidiTask(with: request) { [weak self] dikidi, _, _ in
            guard let self = self else {return}
            if let dikidi = dikidi {
                DispatchQueue.main.async {
                    if let url = URL(string: dikidi.data.image) {
                        self.headerImage = try! Data(contentsOf: url)
                    }
                }
            }
        }.resume()
    }

    func examplesManager(_ completionHeandler: ((ImageModel) -> Void)? = nil) {
        guard let request = getRequest() else { return }
        URLSession.shared.dikidiTask(with: request) {[weak self]  dikidi, _, _ in
            guard let self = self else { return }
            if let dikidi = dikidi {
                DispatchQueue.main.async {
                    if let url = URL(string: dikidi.data.blocks.examples) {
                        self.exampleImage = try! Data(contentsOf: url)
                    }
                }
            }
        }.resume()
    }
    
    func workshopsManager(_ completionHeandler: ((ImageModel) -> Void)? = nil) {
        guard let request = getRequest() else { return }
        URLSession.shared.dikidiTask(with: request) { [weak self] dikidi, _, _ in
            guard let self = self else { return }
            if let dikidi = dikidi {
                DispatchQueue.main.async {
                    if let url = URL(string: dikidi.data.blocks.catalog[0].image.thumb) {
                        self.catalogImage = try! Data(contentsOf: url)
                    }
                }
            }
        }.resume()
    }
    
    func workshops1Manager(_ completionHeandler: ((ImageModel) -> Void)? = nil) {
        guard let request = getRequest() else { return }
        URLSession.shared.dikidiTask(with: request) { [weak self] dikidi, _, _ in
            guard let self = self else { return }
            if let dikidi = dikidi {
                DispatchQueue.main.async {
                    if let url = URL(string: dikidi.data.blocks.catalog[1].image.thumb) {
                        self.catalogImage1 = try! Data(contentsOf: url)
                    }
                }
            }
        }.resume()
    }
    
    
    
//    func nameManager(_ completionHeandler: ((Text) -> Void)? = nil) {
//        guard let request = getRequest() else { return }
//        URLSession.shared.dikidiTask(with: request) { [weak self] dikidi, _, _ in
//            guard let self = self else { return }
//            if let dikidi = dikidi {
//                DispatchQueue.main.async {
//                    if let url = URL(string: dikidi.data.blocks.catalog[0].name) {
//                        self.catalogImage = try! Data(contentsOf: url)
//                    }
//                }
//            }
//        }.resume()
//    }
}
