//
//  HomeView.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 09.10.2021.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var imageCall: ImageCall
    @State var image: UIImage = UIImage()
    @State var exapmles: UIImage = UIImage()

    init() {
        imageCall = ImageCall()
        imageCall.getImages()
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
                       .onReceive(imageCall.didChange) { data in
                           image = UIImage(data: data) ?? UIImage()
                       }
                    Text("Онлайн-записи и бронирование услуг")
                        .offset(x: 0, y: 20)
                }.edgesIgnoringSafeArea(.top)

                Text("Коллекция работ")
                    .font(.system(size: 23))
                    .offset(x: -100, y: -50)
                RoundedRectangle(cornerRadius: 15).fill(Color.blue).frame(width: 380, height: 210)
                Image(uiImage: exapmles)
                    .onReceive(imageCall.didChangeExampleImage) { data in
                    exapmles = UIImage(data: data) ?? UIImage()
                }
                HStack {
                    Text("Посмотрите фото работ и выберите куда можно записаться").offset(x: 12).font(.system(size: 13))

                    ZStack {
                        RoundedRectangle(cornerRadius: 5).fill(Color.gray).frame(width: 100, height: 30)
                        Text("Продолжить").font(.system(size: 13))

                    }.padding()

                }
            }
            Divider()

            Text("Каталог").font(.system(size: 23)).offset(x: -147)
            ZStack {
                RoundedRectangle(cornerRadius: 11).fill(Color.gray).frame(width: 380, height: 120)
                HStack {
                    RoundedRectangle(cornerRadius: 11).fill(Color.blue).frame(width: 120, height: 120).offset(x: 18)
                    Spacer()
                    VStack {
                        Text("profi_nails")
                            .offset(x: -185, y: -5)
                        Text("Adress")
                            .offset(x: -204, y: -3)
                            .font(.system(size: 13))
                        Text("Schedule")
                            .offset(x: -198, y: -2)
                            .font(.system(size: 13))
                        HStack(spacing: 2) {
                            Text("0.0").font(.system(size: 13))
                            ForEach(0 ..< 5) { _ in
                                Image(systemName: "star").font(.system(size: 10))
                            }
                        }.offset(x: -180)
                    }

                }

            ZStack {
                            RoundedRectangle(cornerRadius: 11).fill(Color.gray).frame(width: 380, height: 120)
                            HStack {
                                RoundedRectangle(cornerRadius: 11).fill(Color.blue).frame(width: 120, height: 120).offset(x: 18)

                                Spacer()
                                VStack {
                                    Text("profi_nails")
                                        .offset(x: -185, y: -5)
                                    Text("Adress")
                                        .offset(x: -204, y: -3)
                                        .font(.system(size: 13))
                                    Text("Schedule")
                                        .offset(x: -198, y: -2)
                                        .font(.system(size: 13))
                                    HStack(spacing: 2) {
                                        Text("0.0").font(.system(size: 13))
                                        ForEach(0 ..< 5) { _ in
                                            Image(systemName: "star").font(.system(size: 10))
                                        }
                                    }.offset(x: -180)
                                }
                            }
                        }
            }.ignoresSafeArea()
    }
}

}
