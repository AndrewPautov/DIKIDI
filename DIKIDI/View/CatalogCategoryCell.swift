//
//  CatalogCategoryCell.swift
//  DIKIDI
//
//  Created by Lev Zhuravlev on 25.10.2021.
//

import SwiftUI

struct CatalogCategoryCell: View {
        
    var category: Catalog
    @ObservedObject var dikidiDataCall: DikidiDataCall
    @State var thumb: UIImage = UIImage()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 11)
                .fill(Color.gray)
                .frame(width: 380, height: 120)
            RoundedRectangle(cornerRadius: 11)
                .fill(Color.white)
                .frame(width: 375, height: 115)
            Image(uiImage: thumb)
                .cornerRadius(11)
                .offset(x: -130)
                .onReceive(dikidiDataCall.didChangeCatalogImages) { data in
                    thumb = UIImage(data: data[category.id]!) ?? UIImage()
                }
                
            HStack {
                RoundedRectangle(cornerRadius: 11)
                    .fill(Color.blue)
                    .frame(width: 120, height: 120)
                Spacer()
                VStack {

                    Text(category.name)
                        .offset(x: -204, y: -3)
                        .font(.system(size: 13))
                    Text("Schedule")
                        .offset(x: -198, y: -2)
                        .font(.system(size: 13))
                    HStack(spacing: 2) {
                        Text("0.0")
                            .font(.system(size: 13))
                        ForEach(0 ..< 5) { _ in
                            Image(systemName: "star")
                                .font(.system(size: 10))
                        }
                    }.offset(x: -180)
                }
            }
        }.offset(y: -65)
    }
}
