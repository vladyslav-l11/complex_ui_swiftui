//
//  ListPlaceView.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 02.06.2022.
//

import SwiftUI

struct ListPlaceView: View {
    
    let userName: String
    let title: String
    let placeList: [Place]
    
    var body: some View {
        ZStack {
            ForEach(placeList.reversed()) { place in
                if let index = placeList.firstIndex(of: place) {
                    PlaceView(image: place.image, name: place.name, city: place.city, country: place.country, shouldShowShadow: index == 0)
                        .offset(x: .zero, y: -(-CGFloat(index*12)))
                        .opacity(index == placeList.startIndex
                                 ? 1
                                 : (index == placeList.startIndex + 1
                                    ? 0.5
                                    : (index == placeList.startIndex + 2
                                       ? 0.3
                                       : 0)))
                }
            }.overlay(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.6), .black.opacity(0.5), .black.opacity(0.5), .black.opacity(0.4), .black.opacity(0.3), .clear]), startPoint: .top, endPoint: .bottom)
                        .frame(height: 55),
                             alignment: .top)
                .overlay(VStack(alignment: .leading) {
                Text("Hello, \(userName)")
                    .font(.custom("Metropolis-Medium", size: 17))
                    .padding(.bottom, 2
                    )
                Text(title)
                    .font(.custom("Metropolis-Black", size: 29))
            }.padding(.leading, 24)
                        .padding(.trailing, 48)
                        .padding(.top, 48
                                )
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading),
                     alignment: .topLeading)
        }
    }
}

struct ListPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListPlaceView(userName: "User", title: "Wanna plan your next trip?", placeList: [
                Place(name: "Name1", country: "Country1", city: "City1", image: UIImage(named: "icWood").nonNil, distance: 6, description: "descr", hotelsCount: 8, restaurantsCount: 7),
                Place(name: "Name2", country: "Country2", city: "City2", image: UIImage(named: "icSky").nonNil, distance: 6, description: "descr", hotelsCount: 7, restaurantsCount: 8),
                Place(name: "Name3", country: "Country3", city: "City3", image: UIImage(named: "icPark").nonNil, distance: 6, description: "descr", hotelsCount: 8, restaurantsCount: 7),
                Place(name: "Name4", country: "Country4", city: "City4", image: UIImage(named: "icWood").nonNil, distance: 6, description: "descr", hotelsCount: 8, restaurantsCount: 7),
                Place(name: "Name5", country: "Country5", city: "City5", image: UIImage(named: "icPark").nonNil, distance: 6, description: "descr", hotelsCount: 8, restaurantsCount: 7)
            ])
        }
    }
}
