//
//  ProjectsView.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 09/04/22.
//

import SwiftUI

struct ProjectsView: View {
    var body: some View {
        VStack {
            ProjectsItemView(nameProject: "Today", description: "App that allows you to view the main historical events that occurred on a specific date.", skills: "Parsing APIb")
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
