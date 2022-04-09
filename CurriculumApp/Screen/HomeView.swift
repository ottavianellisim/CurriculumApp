//
//  HomeView.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 06/04/22.
//

import SwiftUI

struct HomeView: View {
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
            PassionView()
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
