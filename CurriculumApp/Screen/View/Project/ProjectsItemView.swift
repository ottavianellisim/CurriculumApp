//
//  ProjectsItemView.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 09/04/22.
//

import SwiftUI

struct ProjectsItemView: View {
    
    let nameProject: String
    let description: String
    let skills: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 400, height: 150)
                .padding()
                .foregroundColor(Color("Black"))
            ZStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(nameProject)
                            .bold()
//                            .multilineTextAlignment(.leading)
//                            .lineLimit(2)
                            .foregroundColor(.purple)
                            .padding()
                        Text(description)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .padding()
                            .foregroundColor(Color("White"))
                    }
                    .padding(30)
                    Spacer()
                }
            }
        }
        .frame(height: 150)
    }
}

struct ProjectsItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsItemView(nameProject: "Today", description: "App that allows you to view the main historical events that occurred on a specific date.", skills: "Parsing API")
            .preferredColorScheme(.dark)
    }
}
