//
//  Place.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 02.06.2022.
//

import UIKit

struct Place: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let country: String
    let city: String
    let image: UIImage
    let distance: Int
    let description: String
    let hotelsCount: Int
    let restaurantsCount: Int
}
