//
//  PassionView.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 06/04/22.
//

import SwiftUI

struct PassionView: View {
    
    @ObservedObject var vm = PassionViewModel()
    @Binding var isPresented: Bool
    @Binding var nameClicked: String
    @Binding var photoClicked: String
    @Binding var descriptionClicked: String
    @Binding var colorClicked: String
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(vm.passionsArray, id: \.self) { passion in
                        PassionItemView(urlString: passion.photoPassion)
                            .sheet(isPresented: $isPresented) {
                                PassionSheetView(name: nameClicked, urlPhoto: photoClicked, description: descriptionClicked, accentColor: colorClicked)
                            }
                            .onTapGesture {
                                nameClicked = passion.namePassion
                                photoClicked = passion.photoPassion
                                descriptionClicked = passion.passionDescription
                                colorClicked = passion.accentColor
                                self.isPresented.toggle()
                            }
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
        PassionView(isPresented: .constant(false), nameClicked: .constant(""), photoClicked: .constant(""), descriptionClicked: .constant(""), colorClicked: .constant(""))
    }
}
