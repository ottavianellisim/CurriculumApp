//
//  CurriculumView.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 06/04/22.
//

import SwiftUI

struct CurriculumView: View {
    
    @ObservedObject var vm = CourseViewModel()
    
    var body: some View {
        Text("Curriculum")
    }
}

struct CurriculumView_Previews: PreviewProvider {
    static var previews: some View {
        CurriculumView()
    }
}
