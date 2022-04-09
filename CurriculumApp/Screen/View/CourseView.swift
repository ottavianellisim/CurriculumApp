//
//  CourseView.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 07/04/22.
//

import SwiftUI

struct CourseView: View {
    
    @ObservedObject var vm = CourseViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.purple]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.purple]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(vm.Courses, id: \.self) { course in
                        CourseItemView(nameCourse: course.nameCourse, author: course.authorName, linkCourse: course.linkCourse)
                            .padding(1)
                    }
                }
            }
            .navigationTitle("Udemy Course")
            .onAppear {
                vm.fetchJSON()
            }
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
