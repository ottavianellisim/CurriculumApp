//
//  PassionItemView.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 21/04/22.
//

import SwiftUI

struct PassionItemView: View {
    
    let urlString: String
    
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.purple, lineWidth: 1)
                .frame(maxWidth: .infinity, minHeight: 150, maxHeight: 150)
                .padding()
                .foregroundColor(.clear)
                .background(
                    AsyncImage(url: URL(string: urlString)) { phase in
                        if let image = phase.image {
                            image // Displays the loaded image.
                                .resizable()
                                .frame(maxWidth: .infinity, minHeight: 150, maxHeight: 150)
                                .cornerRadius(20)
                                .padding()
                        } else if phase.error != nil {
                            Color.red // Indicates an error.
                        } else {
                            ProgressView()
                        }
                    }
                )
        }
    }
}

struct PassionItemView_Previews: PreviewProvider {
    static var previews: some View {
        PassionItemView(urlString: "")
            .previewLayout(.sizeThatFits)
    }
}
