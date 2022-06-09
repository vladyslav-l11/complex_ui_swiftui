//
//  Category.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 08.06.2022.
//

import UIKit

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let image: UIImage?
    let selectedImage: UIImage?
}
