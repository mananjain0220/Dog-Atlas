//
//  DogBreedListCell.swift
//  DogApp
//
//  Created by manan jain on 25/02/25.
//

import SwiftUI

struct DogBreedListCell: View {
    let dogBreed: DogApp
    
    var body: some View {
        HStack {
            DogBreedImageView(dogBreed: dogBreed)
                .frame(width: 120, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .leading, spacing: 10) {
                Text(dogBreed.name)
                    .font(.title3)
                    .fontWeight(.medium)
                Text(dogBreed.life_span)
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                
            }
            
        }
    }
}

#Preview {
    DogBreedListCell(dogBreed: MockData.sampleDogApp)
}
