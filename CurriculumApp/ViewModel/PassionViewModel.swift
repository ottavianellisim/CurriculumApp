//
//  PassionViewModel.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 20/04/22.
//

import Foundation

class PassionViewModel: ObservableObject {
    
    @Published var passionsArray: [PassionModel] = []
    
    func fetchJSON() {
        
        guard let url = Bundle.main.url(forResource: "passions", withExtension: "json") else {
            fatalError("Failed to locate json in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load json from bundle.")
        }
        
        let decoder = JSONDecoder()
        if let results = try? decoder.decode([PassionData].self, from: data) {
            for i in 0..<results.count {
                let name = results[i].name
                let photo = results[i].photo
                let description = results[i].description
                let accentColor = results[i].accentColor
                let newPassion = PassionModel(namePassion: name, photoPassion: photo, passionDescription: description, accentColor: accentColor)
                self.passionsArray.append(newPassion)
            }
        }
    }
    
}
