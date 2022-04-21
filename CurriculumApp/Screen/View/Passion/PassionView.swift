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
                    ForEach(vm.passionsArray, id: \.self) { passion in
                        PassionItemView(urlString: passion.photoPassion)
                    }
                }
            }
            .navigationTitle("Passions")
            .onAppear {
                vm.fetchJSON()
            }
            .onDisappear {
                vm.passionsArray = []
            }
        }
    }
    
}

struct PassionView_Previews: PreviewProvider {
    static var previews: some View {
        PassionView()
    }
}
