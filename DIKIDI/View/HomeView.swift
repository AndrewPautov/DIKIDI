//
//  HomeView.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 09.10.2021.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var dikidiDataCall: DikidiDataCall
    @State var image: UIImage = UIImage()
    @State var exapmles: UIImage = UIImage()
    @State var thumb: UIImage = UIImage()
    
    init() {
        dikidiDataCall = DikidiDataCall()
        dikidiDataCall.getDikidiData()
    }

    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Image(uiImage: image)
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: 700, height: 340)
                       .offset(y: -50)
                       .onReceive(dikidiDataCall.didChangeHeaderImage) { data in
                           image = UIImage(data: data) ?? UIImage()
                       }
                    Text("Онлайн-записи и\n бронирование услуг")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 22, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .offset(x: 0, y: 20)
                }.edgesIgnoringSafeArea(.top)

                Text("Коллекция работ")
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .offset(x: -95, y: -50)
                Image(uiImage: exapmles)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 450, height: 228)
                    .offset(y: -55)
                    .onReceive(dikidiDataCall.didChangeExampleImage) { data in
                    exapmles = UIImage(data: data) ?? UIImage()
                    }
                HStack {
                    Text("Посмотрите фото работ и выберите \nкуда можно записаться")
                        .foregroundColor(.gray)
                        .font(.system(size: 11))
                        .offset(x: -16)
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(UIColor.lightGray))
                            .frame(width: 100, height: 30)
                        Text("Продолжить")
                            .font(.system(size: 13))
                            .foregroundColor(.blue)

                    }.padding().offset(x: 35)

                }.offset(y: -65)
            }
            Divider().offset(y: -70)
            
            // MARK: - Catalog
            Text("Каталог")
                .fontWeight(.bold)
                .font(.system(size: 23))
                .offset(x: -146, y: -65)
            
            Text("\(dikidiDataCall.catalog.count)")
                .fontWeight(.bold)
                .font(.system(size: 23))
                .offset(x: -146, y: -65)
            
            List(dikidiDataCall.catalog, id: \.id) { category in
                CatalogCategoryCell(category: category)
                Text("\(dikidiDataCall.catalog.count)")
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .offset(x: -146, y: -65)
            }.onReceive(dikidiDataCall.didChangeCatalog) { category in
                CatalogCategoryCell(category: category[0])
                Text("\(dikidiDataCall.catalog.count)")
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .offset(x: -146, y: -65)
            }

//            ForEach(dikidiDataCall.catalog, ) { _ in
//                ZStack{
//                    RoundedRectangle(cornerRadius: 11)
//                        .fill(Color.gray)
//                        .frame(width: 380, height: 120)
//                    RoundedRectangle(cornerRadius: 11)
//                        .fill(Color.white)
//                        .frame(width: 375, height: 115)
//                    Image(uiImage: thumb)
//                        .cornerRadius(11)
//                        .offset(x: -130)
//                        .onReceive(dikidiDataCall.didChangeCatalogImages) { catalogImages in
//                            thumb = UIImage(data: catalogImages["1714"]!) ?? UIImage()
//                        }
//                    HStack {
//                        RoundedRectangle(cornerRadius: 11)
//                            .fill(Color.blue)
//                            .frame(width: 120, height: 120)
//                        Spacer()
//                        VStack {
//
//                            Text("Adress")
//                                .offset(x: -204, y: -3)
//                                .font(.system(size: 13))
//                            Text("Schedule")
//                                .offset(x: -198, y: -2)
//                                .font(.system(size: 13))
//                            HStack(spacing: 2) {
//                                Text("0.0")
//                                    .font(.system(size: 13))
//                                ForEach(0 ..< 5) { _ in
//                                    Image(systemName: "star")
//                                        .font(.system(size: 10))
//                                }
//                            }.offset(x: -180)
//                        }
//                    }
//                }.offset(y: -65)
//            }
        }.ignoresSafeArea()
    }
}
