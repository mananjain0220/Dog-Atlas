//
//  ContentView.swift
//  DogApp
//
//  Created by manan jain on 25/02/25.
//

import SwiftUI

struct ContentView: View {
   
    @StateObject var viewModel = DogAppViewModel()
    
    var body: some View {

        NavigationView {
            List(viewModel.dogbreed, id: \.name) { breed in
                NavigationLink(destination: DogBreedDetailView(specificDog: breed)) {
                       DogBreedListCell(dogBreed: breed)
                   }
            }
            .navigationTitle("Dog Atlas")
        }.onAppear {
            viewModel.fetchBreeds()
        }
    }
}


#Preview {
    ContentView()
}
