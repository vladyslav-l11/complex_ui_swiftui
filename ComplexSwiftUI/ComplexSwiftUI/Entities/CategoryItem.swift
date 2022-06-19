//
//  CategoryItem.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 09.06.2022.
//

import UIKit

struct CategoryItem: Identifiable {
    let id = UUID()
    let name: String
    let rating: Double
    let image: UIImage?
}
