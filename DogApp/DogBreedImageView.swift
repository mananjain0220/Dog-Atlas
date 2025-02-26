//
//  DogBreedImageView.swift
//  DogApp
//
//  Created by manan jain on 25/02/25.
//

import SwiftUI

struct DogBreedImageView: View {
    let dogBreed: DogApp
    var body: some View {
        AsyncImage(url: URL(string: dogBreed.image?.url ?? "")) {
            phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("Image failed to load")
            } else {
                ProgressView()
            }
        }
    }
}

#Preview {
    DogBreedImageView(dogBreed: MockData.sampleDogApp)
}
