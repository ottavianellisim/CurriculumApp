//
//  CourseViewModel.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 07/04/22.
//

import Foundation

class CourseViewModel: ObservableObject {
    
    @Published var Courses: [CourseModel] = []
    
    func fetchJSON() {
        
        let url = Bundle.main.url(forResource: "courses", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        if let results = try? decoder.decode([CourseData].self, from: data) {
            for i in 0..<results.count {
                let name = results[i].name
                let author = results[i].author
                let link = results[i].linkCourse
                let newCourse = CourseModel(nameCourse: name, authorName: author, linkCourse: link)
                self.Courses.append(newCourse)
            }
        }
    }
}
