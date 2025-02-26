//
//  Model.swift
//  DogApp
//
//  Created by manan jain on 25/02/25.
//

import Foundation

struct DogApp: Codable {
    let name: String
    let life_span: String
    let breed_group: String?
    let temperament: String?
    let bred_for: String?
    let origin: String?
    let weight, height: Dimensions
    let country_code: String?
    let image: Image?
}

struct Dimensions: Codable {
    let imperial, metric: String
}

struct Image: Codable {
    let id: String
    let width, height: Int
    let url: String
}

typealias DogBreeds = [DogApp]


struct MockData {
    static let sampleDogApp = DogApp(
        name: "Affenpinscher",
        life_span: "10 - 12 years",
        breed_group: "Toy",
        temperament: "Stubborn, Curious, Playful, Adventurous, Active, Fun-loving",
        bred_for: "Small rodent hunting, lapdog",
        origin: "Germany, France",
        weight: Dimensions(imperial: "6 - 13", metric: "3 - 6"),
        height: Dimensions(imperial: "9 - 11.5", metric: "23 - 29"),
        country_code: "DE",
        image: Image(id: "BJa4kxc4X", width: 1600, height: 1199, url: "https://cdn2.thedogapi.com/images/BJa4kxc4X.jpg")
    )
}

