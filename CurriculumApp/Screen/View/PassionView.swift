//
//  PassionView.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 06/04/22.
//

import SwiftUI

struct PassionView: View {
    
    @ObservedObject var vm = PassionViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(vm.Passions, id: \.self) { passion in
                        HStack {
                            Text(passion.namePassion)
                            AsyncImage(url: URL(string: passion.photoPassion)) { phase in
                                if let image = phase.image {
                                    image // Displays the loaded image.
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                } else if phase.error != nil {
                                    Color.red // Indicates an error.
                                } else {
                                    Color.blue // Acts as a placeholder.
                                }
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("Passions")
            .onAppear {
                vm.fetchJSON()
            }
            .onDisappear {
                vm.Passions = []
            }
        }
    }
    
}

struct PassionView_Previews: PreviewProvider {
    static var previews: some View {
        PassionView()
    }
}
