//
//  DikidiDataCall.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 23.10.2021.
//

import Foundation
import SwiftUI
import Combine

class DikidiDataCall: ObservableObject {
    
    var didChangeHeaderImage = PassthroughSubject<Data, Never>()
    var didChangeExampleImage = PassthroughSubject<Data, Never>()
    var didChangeCatalog = PassthroughSubject<[Catalog], Never>()
    var didChangeCatalogImages = PassthroughSubject<[String: Data], Never>()
    
    var headerImage = Data() {
        didSet {
            didChangeHeaderImage.send(headerImage)
        }
    }
    
    var exampleImage = Data() {
        didSet {
            didChangeExampleImage.send(exampleImage)
        }
    }
    
    var catalog: [Catalog] = []
    {
        didSet {
            didChangeCatalog.send(catalog)
        }
    }
    
    var catalogImages: [String: Data] = [:] {
        didSet {
            didChangeCatalogImages.send(catalogImages)
        }
    }
    

    func getDikidiData() {
        imageManager()
        examplesManager()
        catalogManager()
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
    
    func catalogManager(_ completionHeandler: (([Catalog]) -> Void)? = nil) {
        guard let request = getRequest() else { return }
        URLSession.shared.dikidiTask(with: request) { [weak self] dikidi, _, _ in
            guard let self = self else { return }
            if let dikidi = dikidi {
                DispatchQueue.main.async {
                    let catalogRow = dikidi.data.blocks.catalog
                    for catalogCategory in catalogRow {
                        self.catalog.append(catalogCategory)
                    }
                    self.catalogImageManager()
                    guard let completionHeandler = completionHeandler else {return}
                    completionHeandler(self.catalog)
                }
            }
        }.resume()
    }
    
    func catalogImageManager(_ completionHeandler: ((ImageModel) -> Void)? = nil) {
        guard let request = getRequest() else { return }
        URLSession.shared.dikidiTask(with: request) { [weak self] dikidi, _, _ in
            guard let self = self else { return }
            if let dikidi = dikidi {
                DispatchQueue.main.async {
                    for catalogDataIndex in 7..<dikidi.data.blocks.catalog.count {
                        let catalogDataId = dikidi.data.blocks.catalog[catalogDataIndex].id
                        let catalogDataImageUrl = dikidi.data.blocks.catalog[catalogDataIndex].image.thumb
                        if let url = URL(string: catalogDataImageUrl) {
                            self.catalogImages[catalogDataId] = try! Data(contentsOf: url)
                        }
                    }
                }
            }
        }.resume()
    }
}
