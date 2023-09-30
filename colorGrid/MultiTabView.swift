//
//  MultiTabView.swift
//  colorGrid
//
//  Created by Amit Gupta on 9/16/23.
//

import SwiftUI

import SwiftUI

class RefreshManager: ObservableObject {
    @Published var refreshTab: Int
    
    init(refreshTab:Int){
        self.refreshTab=refreshTab
    }
}

struct MultiTabView: View {
    var body: some View {
        TabView{
            ShowGridFromFileView()
                .tabItem{
                    Label("From file",systemImage: "keyboard")
                }
            BasicGridView()
                .tabItem{
                    Label("Random Source",systemImage: "list.number")
                }
            WebView(url:URL(string:"https://aiclub.world/privacy")!)
                .tabItem{
                    Label("Web page",systemImage: "eyes.inverse")
                }

        }
    }
}

struct Tab1View: View {
    var body: some View {
        Text("Page 1")
    }
}

struct Tab2View: View {
    var body: some View {
        Text("Page 2")
    }
}

struct Tab3View: View {
    @AppStorage("lat") var lat=0.0
    @AppStorage("lon") var lon=0.0
    var body: some View {
        ZStack {
            Color.blue.opacity(0.20).ignoresSafeArea()
            WebView(url:URL(string:"https://forecast.weather.gov/MapClick.php?textField1=\(lat)&textField2=\(lon)")!)
        }
    }
}

struct MultiTabView_Previews: PreviewProvider {
    static var previews: some View {
        MultiTabView()
    }
}
