//
//  PassionSheetView.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 21/04/22.
//

import SwiftUI

struct PassionSheetView: View {
    
    let name: String
    let urlPhoto: String
    let description: String
    let accentColor: String
    @State private var isDragStarted: Bool = false
    @State private var draggedOffset = CGSize.zero
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: urlPhoto)) { phase in
                        if let image = phase.image {
                            image // Displays the loaded image.
                                .resizable()
                                .frame(width: geo.size.width, height: 250)
                                .cornerRadius(10, corners: [.topRight, .topLeft])
                        } else if phase.error != nil {
                            Color.red // Indicates an error.
                        } else {
                            ProgressView()
                                .padding()
                        }
                    }
                    HStack {
                        Text(name)
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(Color(accentColor))
                            .padding()
                        Spacer()
                    }
                    VStack {
                        HStack {
                            Text(description)
                                .font(.body)
                                .italic()
                                .foregroundColor(Color(accentColor))
                                .opacity(0.5)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

struct PassionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        PassionSheetView(name: "Golden State Warriors", urlPhoto: "", description: "", accentColor: "")
    }
}
