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
                    Button() {
                        print("The button was tapped")
                    } label: {
                        Image(systemName: "paperplane.circle")
                    }
                    .font(.system(size: 25))
                    .offset(x: 180, y: -120)
                    .foregroundColor(.white)
                    
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
                
                Divider().offset(y: -70)
                
                HStack {
                    Text("Каталог")
                        .fontWeight(.bold)
                        .font(.system(size: 23))
                        .offset(x: -134, y: -65)
                    
                    Text("\(dikidiDataCall.catalog.count)")
                        .fontWeight(.bold)
                        .font(.system(size: 23))
                        .offset(x: -134, y: -65)
                        .foregroundColor(.gray)
                    
                    List(dikidiDataCall.catalog, id: \.id) { category in
                        CatalogCategoryCell(category: category, dikidiDataCall: dikidiDataCall)
                    }.onReceive(dikidiDataCall.didChangeCatalog) { category in
                        CatalogCategoryCell(category: category[0], dikidiDataCall: dikidiDataCall)
                    }
                }
            }
        }.ignoresSafeArea()
    }
}
