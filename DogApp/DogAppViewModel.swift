//
//  DogAppViewModel.swift
//  DogApp
//
//  Created by manan jain on 25/02/25.
//

import SwiftUI

final class DogAppViewModel: ObservableObject {
    @Published var dogbreed: [DogApp] = []
    @Published var isLoading = false
    
    
    func fetchBreeds() {

        NetworkManager.share.fetchBreeds { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let dogApp):
                    self.dogbreed = dogApp
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
            
        }
    }
}
