//
//  CarData.swift
//  CarsList
//
//  Created by Никита Коголенок on 15.06.23.
//

import UIKit

// MARK: - CarDatum
struct CarDatum: Codable {
    let brand: String
    let model: String
    let description: String
    let images: [String]

    enum CodingKeys: String, CodingKey {
        case brand
        case model
        case description
        case images
    }
}

typealias CarData = [CarDatum]
