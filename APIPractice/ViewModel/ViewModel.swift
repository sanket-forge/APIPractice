//
//  ViewModel.swift
//  APIPractice
//
//  Created by Sanket Khatua on 23/06/25.
//

import Foundation

class ViewModel: ObservableObject {
    
    // Observable Property
    @Published var model: [Model] = []
    
    func fetch() {
        
        // Main base URL or URl creation
        guard let url = URL(string: "Your desired URL.") else { return }
        
        // Fetch the data or network request
        let task = URLSession.shared.dataTask(with: url) { Data, _, error in
            
            // Data check
            guard let data = Data, error == nil else { return }
            
            // Data will be decoded from JSON or JSON decoding
            do {
                
                let model = try JSONDecoder().decode([Model].self, from: data)
                
                // For updation of the UI
                DispatchQueue.main.async {
                    
                    self.model = model
                }
            }
            catch {
                
                print(error)
            }
        }
        task.resume()
    }
}


