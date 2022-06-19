//
//  HomeViewModel.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 02.06.2022.
//

import UIKit

final class HomeViewModel {
    let user = User(name: "Vlad")
    let placeList = [
        Place(name: "Name1", country: "Country1", city: "City1", image: UIImage(named: "icWood").nonNil, distance: 6, description: "descr", hotelsCount: 8, restaurantsCount: 7),
        Place(name: "Name2", country: "Country2", city: "City2", image: UIImage(named: "icSky").nonNil, distance: 6, description: "descr", hotelsCount: 7, restaurantsCount: 8),
        Place(name: "Name3", country: "Country3", city: "City3", image: UIImage(named: "icPark").nonNil, distance: 6, description: "descr", hotelsCount: 8, restaurantsCount: 7),
        Place(name: "Name4", country: "Country4", city: "City4", image: UIImage(named: "icWood").nonNil, distance: 6, description: "descr", hotelsCount: 8, restaurantsCount: 7),
        Place(name: "Name5", country: "Country5", city: "City5", image: UIImage(named: "icPark").nonNil, distance: 6, description: "descr", hotelsCount: 8, restaurantsCount: 7)
    ]
    let categoryList = [
        Category(name: "Restaurants", image: UIImage(named: "icFork"), selectedImage: UIImage(named: "icForkSelected")),
        Category(name: "Hotels", image: UIImage(named: "icHome"), selectedImage: UIImage(named: "icHomeSelected")),
        Category(name: "Tickets", image: UIImage(named: "icFlight"), selectedImage: UIImage(named: "icFlightSelected"))
    ]
    let categoryItemList = [
        CategoryItem(name: "Ritz-Carlton", rating: 4.2, image: UIImage(named: "icFastFood1")),
        CategoryItem(name: "KFC", rating: 3.9, image: UIImage(named: "icFastFood2")),
        CategoryItem(name: "StreetSide Cafe", rating: 4.0, image: UIImage(named: "icFastFood3"))
    ]
}
