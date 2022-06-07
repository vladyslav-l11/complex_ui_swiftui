//
//  HomeViewModel.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 02.06.2022.
//

import UIKit

final class HomeViewModel {
    let placeList = [
        Place(name: "Name1", country: "Country1", city: "City1", image: UIImage(named: "icWood") ?? .init(), distance: 6, description: "descr", hotelsCount: 8, restaurantsCount: 7),
        Place(name: "Name2", country: "Country2", city: "City2", image: UIImage(named: "icSky") ?? .init(), distance: 6, description: "descr", hotelsCount: 7, restaurantsCount: 8),
        Place(name: "Name3", country: "Country3", city: "City3", image: UIImage(named: "icPark") ?? .init(), distance: 6, description: "descr", hotelsCount: 8, restaurantsCount: 7),
        Place(name: "Name4", country: "Country4", city: "City4", image: UIImage(named: "icWood") ?? .init(), distance: 6, description: "descr", hotelsCount: 8, restaurantsCount: 7),
        Place(name: "Name5", country: "Country5", city: "City5", image: UIImage(named: "icPark") ?? .init(), distance: 6, description: "descr", hotelsCount: 8, restaurantsCount: 7)
    ]
}
