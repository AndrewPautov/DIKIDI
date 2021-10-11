//
//  ContentView.swift
//  DIKIDI
//
//  Created by Андрей Паутов on 08.10.2021.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "house")
                Text("Главная")
            }
            Purcheses().tabItem {
                Image(systemName: "bag")
                Text("Акции")
            }
            Text("Мои записи").tabItem {
                Image(systemName: "book")
                Text("Мои записи")
            }
            Text("Чаты").tabItem {
                Image(systemName: "message")
                Text("Чаты")
            }
            Text("Ещё").tabItem {
                Image(systemName: "gear")
                Text("Ещё")
            }

        }
    }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
