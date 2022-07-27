//
//  PlaceInfoView.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 28.06.2022.
//

import SwiftUI

struct PlaceInfoView: View {
    
    private enum C {
        static let cornerRadius: CGFloat = 45
        static let blurRadius: CGFloat = 3
        static let descriptionHeight: CGFloat = 66
    }
    
    let place: Place
    
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.custom("Metropolis-Black", size: 24))
                    .foregroundColor(Color(UIColor(named: "gray1") ?? .init()))
                    .frame(alignment: .leading)
                    .padding(.bottom, 5)
                Text("\(place.city), \(place.country)")
                    .font(.custom("Metropolis-SemiBold", size: 13))
                    .foregroundColor(Color(UIColor(named: "gray1") ?? .init()))
                    .padding(.bottom, 11)
                    ScrollView {
                        Text(place.description)
                            .font(.custom("Metropolis-SemiBold", size: 14))
                            .foregroundColor(Color(UIColor(named: "gray3") ?? .init()))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }.frame(height: C.descriptionHeight)
                
                HStack(spacing: 14) {
                    Group {
                        Text("\(place.hotelsCount) Hotels")
                            .font(.custom("Metropolis-Medium", size: 14))
                            .foregroundColor(Color(UIColor(named: "gray1") ?? .init()))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 11)
                            .background(RoundedRectangle(cornerRadius: 14).foregroundColor(Color(uiColor: UIColor(named: "blueTen1") ?? .init())))
                    }
                    .frame(width: .infinity, height: 37)
                    Group {
                        Text("\(place.restaurantsCount) Restaurants")
                            .font(.custom("Metropolis-Medium", size: 14))
                            .foregroundColor(Color(UIColor(named: "gray1") ?? .init()))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 11)
                            .background(RoundedRectangle(cornerRadius: 14).foregroundColor(Color(uiColor: UIColor(named: "blueTen1") ?? .init())))
                    }
                    .frame(width: .infinity, height: 37)
                }
                .padding(.leading, -6)
                .padding(.vertical, 12)
                
                HStack {
                    Image(uiImage: UIImage(named: "icPointer") ?? .init())
                        .frame(width: 20, height: 20)
                    Text("\(place.distance) Km from here")
                        .font(.custom("Metropolis-SemiBold", size: 16))
                        .foregroundColor(Color(UIColor(named: "gray2") ?? .init()))
                }.padding(.vertical, 4)
                
                Button(action: {}) {
                    Text("Book Flight for My Trip")
                        .font(.custom("Metropolis-SemiBold", size: 17))
                        .foregroundColor(.white)
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 67)
                    .background(RoundedRectangle(cornerRadius: 17).foregroundColor(Color(uiColor: UIColor(named: "blue1").nonNil)))
                    .padding(.top, 10)
                    .padding(.horizontal, -4)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 28)
        }
        .frame(width: UIScreen.main.bounds.width,
               height: 380,
               alignment: .leading)
        .background(RoundedCorners(cornerRadius: C.cornerRadius, corners: [.topRight, .topLeft])
                        .foregroundStyle(.thinMaterial))
    }
}

struct PlaceInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceInfoView(place: Place(name: "Name1", country: "Country1", city: "City1", image: UIImage(named: "icWood").nonNil, distance: 6, description: "descdghsfjhsdgfjhsdgfjhsdfghjdsgfhdsgfhjsdgfjhdsgfhjsdgfhjdsgjfhsdghjfgsdhjfsgdhjfgsdhjfgsdhjfgsdhjgfsdjhfgsdjhfghjsdgfjdhsgfsdhjgfhjsdgfhjsdgfjhsdgfhjsdghjfgsdjhfgdshgfhjsdgfhjsdgfjhsdghjfsdghjfgdshjfgsdhjfgsdhjfgshjdfgsjhfsgjhfdsghjfgsdhjfgsdjhfgsdhjfgdshjfgsdhjgfsdhjfgsjhfgsdhjfgdsjhr", hotelsCount: 8, restaurantsCount: 7))
    }
}
