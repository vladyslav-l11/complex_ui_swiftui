//
//  UIImage+Init.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 09.06.2022.
//

import UIKit

extension Optional where Wrapped == UIImage {
    var nonNil: UIImage {
        self ?? .init()
    }
}

extension Optional where Wrapped == UIColor {
    var nonNil: UIColor {
        self ?? .init()
    }
}
