//
//  CourseItemView.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 06/04/22.
//

import SwiftUI

struct CourseItemView: View {
    
    var nameCourse: String
    var author: String
    var linkCourse: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 150)
                .padding()
                .foregroundColor(Color("Black"))
            ZStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(nameCourse)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.purple)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding()
                        Text(author)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .foregroundColor(Color("White"))
                    }
                    .padding(30)
                    Spacer()
                    Link(destination: URL(string: linkCourse)!) {
                        Image(systemName: "link")
                            .foregroundColor(.purple)
                            .padding(35)
                    }
                }
            }
        }
        .frame(height: 150)
    }
}

struct CourseItemView_Previews: PreviewProvider {
    static var previews: some View {
        CourseItemView(nameCourse: "SwiftUI Animations - Animate anything with SwiftUI", author: "Stephen DeStafano", linkCourse: "https://www.google.it")
            .previewLayout(.sizeThatFits)
    }
}
