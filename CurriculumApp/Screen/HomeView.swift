//
//  HomeView.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 06/04/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var isPresented: Bool = false
    @State var nameClicked: String = ""
    @State var photoClicked: String = ""
    @State var descriptionClicked: String = ""
    
    var body: some View {
        TabView {
            CourseView()
                .tabItem {
                    Image(systemName: "swift")
                    Text("Projects / Course")
                }
            CurriculumView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Curriculum")
                }
            PassionView(isPresented: $isPresented, nameClicked: $nameClicked, photoClicked: $photoClicked, descriptionClicked: $descriptionClicked)
                .tabItem {
                    Image(systemName: "logo.playstation")
                    Text("Passion")
                }
        }
        .tint(.accentColor)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
