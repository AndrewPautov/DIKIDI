//
//  HomeView.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 09.10.2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 0).fill(Color.blue).frame(width: 420, height: 270)
                    Text("Онлайн-записи и бронирование услуг").offset(x: 0, y: 20)
                }
                
                Text("Коллекция работ").font(.system(size: 23)).offset(x: -100)
                RoundedRectangle(cornerRadius: 15).fill(Color.blue).frame(width: 380, height: 250)
                
                HStack {
                    Text("Посмотрите фото работ и выберите куда можно записаться").offset(x: 12).font(.system(size: 13))
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).fill(Color.gray).frame(width: 100, height: 30)
                        Text("Продолжить").font(.system(size: 13))
                        
                    }.padding()

                }
            }
        }
        .ignoresSafeArea()
    }
}
// ыцшаеГШ
