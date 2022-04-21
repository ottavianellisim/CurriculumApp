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
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 1)
                .frame(width: 350, height: 150)
                .foregroundColor(.clear)
                .background(
                    AsyncImage(url: URL(string: urlString)) { phase in
                        if let image = phase.image {
                            image // Displays the loaded image.
                                .resizable()
                                .frame(width: 350, height: 150)
                                .cornerRadius(20)
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
