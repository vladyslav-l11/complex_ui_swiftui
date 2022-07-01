//
//  DetailedPlaceView.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 28.06.2022.
//

import SwiftUI

struct DetailedPlaceView: View {
    
    private enum C {
        static let backButtonSize: CGFloat = 27
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let place: Place
    
    var body: some View {
        NavigationView {
            GeometryReader { _ in
                    Image(uiImage: place.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width,
                               height: UIScreen.main.bounds.height*0.7,
                               alignment: .center)
                        .overlay(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.5), .black.opacity(0.4), .black.opacity(0.3),         .black.opacity(0.3), .black.opacity(0.2), .black.opacity(0.1), .clear]), startPoint: .top, endPoint: .bottom)
                                    .frame(height: 80),
                                    alignment: .top)
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(uiImage: UIImage(named: "icArrowLeft").nonNil)
                    }.frame(width: C.backButtonSize, height: C.backButtonSize)
                }
            }
            .overlay(PlaceInfoView(place: place), alignment: .bottom)
        }
    }
}

struct DetailedPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedPlaceView(place: Place(name: "Name1", country: "Country1", city: "City1", image: UIImage(named: "icWood").nonNil, distance: 6, description: "descdghsfjhsdgfjhsdgfjhsdfghjdsgfhdsgfhjsdgfjhdsgfhjsdgfhjdsgjfhsdghjfgsdhjfsgdhjfgsdhjfgsdhjfgsdhjgfsdjhfgsdjhfghjsdgfjdhsgfsdhjgfhjsdgfhjsdgfjhsdgfhjsdghjfgsdjhfgdshgfhjsdgfhjsdgfjhsdghjfsdghjfgdshjfgsdhjfgsdhjfgshjdfgsjhfsgjhfdsghjfgsdhjfgsdjhfgsdhjfgdshjfgsdhjgfsdhjfgsjhfgsdhjfgdsjhrjdfshkjfdshkjfhdsjkfhsdjkhfjsdhfjksdhjfhsdkjfhsdkjfhsdjhfkjsdhfjsdhfkjsdhfjksdhfkjsdhfkjhsdjkfhsdkjfhsdkjhfkjsdhjfsdjfhsdjkfhdskjfhsdjkfhjksdfhjksdfhjkdsfhsdjkfhsdjhfhgdshjfgsdhjfgsjhfgsdhfgsdhfgshfgsdhjfgsdhjfgsdjhfgsdhjfgsdhjgfsdjhfgsdjhgfjhsdgfjhsdgfhjsdgfhjsdghjfgsdjhfgsdhjfgsdhjfgsdhjfgsjdhgfshdjfgshjdfgsdhjfgshjdgfhjsdgfhjsdgfhjsdgfhjgsdhjfgsdhjfgsdjhfgsdhjfghjsdfgsdhjfgsdhjgfsdhjgfsdhjgfhsdgfhsdgfjhsdgfjhsdgfjhsdgfhjdsghjfgsdhjfgsdhjfgsdhjfgshfgsdhfsdghfsdghfjsdgfhsdgfhjsdgfhsdgfhsdgfdshjfgshjdfgsdhjfgsdhjfgdshjfghdjsgfsdhjgfhjsdgfhjsdgfhsdgfhsdjfgshjdgsfjhsdgfhjsdgfhsdgfhjsdgfhjsdgfhdsgfhdsjgfsdhjfgyyyyyeyyeyeyfsdbjhfbsdhjfbshjbfsdbfhjsbdjhfbdshfbhsdjbfhjsdbfhjbsdhjfsdbhfbdshjfbsdhfbshdfbjhsdfbjsdbfsjhdkfbsdjhbfhjsdbfjhsdbfhjsdbhjfbsjhbfhjsdbhfjsdhjfsbfhjsbfjhdbfjhsbhjfdsbjhfsbdjhfbsdjhfbsdhbfjhsdbfjsdjfhsbdjhfsbdjhfbsdfbsdhfbsjhsdbfhjsdbfjhsdbfjhsdbfhjsdbfhjbsdjhfbshjdbfjhsdbfhjsbhfbsdjhfbsdhfbsjhbdfhdbshjfsdbhfsbjhfbshjfdbjhfsbdjfhsdbjhfbshfbsdjhbsfhjdsbhjfbdshjfsbhjfbsjhfbdhsdbfhsdbjfhbsdhfbsdjhfbsdhjfbshjbfsdhbfshfbdsjhfbshdfbhsdfbjsdhfbsdhfbsdhfbhsdjfbsdhfbsdhfjsdbfhsjdbfhsdjbfhbjsdfkjshdfjhsdfjshdjfhsdjfkhsdfhjsdhfkjsdhfjsdhfjksdhkfjsdjfhsjdkfsdjfshdkjfhsjkfhskjdsfjkdsfhkjdsfsdfsfsdfsdfsdfsdfsdfssfddsfsdfsdfsdfsdfsdfsdfsdfsdfsdfdsfsdfsdfsdfsdfsdfsdfsdsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfdsfsdfsdfsdsdfdsfsdfsdfsdfsdfsdfsdfdsfsdfdsfsdfsdfsdfdsfsdfsdfdssdfdsfsdfsdfsdfdsfsdfdsfdsfs", hotelsCount: 8, restaurantsCount: 7))
    }
}
