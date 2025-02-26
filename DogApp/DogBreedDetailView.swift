//
//  DogBreedDetailView.swift
//  DogApp
//
//  Created by manan jain on 25/02/25.
//

import SwiftUI

struct DogBreedDetailView: View {
    let specificDog: DogApp
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.adaptive(minimum: 200))
            ]
    var body: some View {
        VStack {
            DogBreedImageView(dogBreed: specificDog)
            
            Text(specificDog.name)
                .font(.title)
                .fontWeight(.bold)
                .navigationTitle(specificDog.name)
            
            LazyVGrid(columns: gridItems,spacing: 5) {
                
                GridCardView(values: [("Bred For", specificDog.bred_for  ?? "Not Available")])
                
                GridCardView(values: [("Life Span", specificDog.life_span)])
            
                GridCardView(values: [("Bred For", specificDog.breed_group  ?? "Not Available")])
                GridCardView( values: [("Temperament", specificDog.temperament ?? "Not Available")])
            }
            
        }
    }
}

#Preview {
    DogBreedDetailView(specificDog: MockData.sampleDogApp)
}
