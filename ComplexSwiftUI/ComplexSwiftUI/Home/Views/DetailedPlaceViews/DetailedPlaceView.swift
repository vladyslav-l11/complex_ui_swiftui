//
//  DetailedPlaceView.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 28.06.2022.
//

import SwiftUI

struct DetailedPlaceView: View {
    
    private enum C {
        static let dotSize: CGFloat = 4
        static let bigDotSize: CGFloat = 14
        static let offsetDots: CGFloat = 22
        static let backButtonSize: CGFloat = 27
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var selectedPlace: Place
    @State var offsetDots: CGFloat = 0
    let homeViewModel: HomeViewModel
    
    @State private var minOffsetIndex: Int = 1
    @State private var maxOffsetIndex: Int = 9
    private let places: [Place]
    
    var currentIndex: Int {
        places.firstIndex(of: selectedPlace) ?? 0
    }
    
    init(selectedPlace: Place) {
        self._selectedPlace = State<Place>(initialValue: selectedPlace)
        homeViewModel = HomeViewModel.shared
        places = homeViewModel.placeList
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.init()) {
                    TabView(selection: $selectedPlace) {
                        ForEach(places.indices) { index in
                            GeometryReader { _ in
                                Image(uiImage: places[index].image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width,
                                           height: UIScreen.main.bounds.height*0.7,
                                           alignment: .center)
                                    .clipped()
                                    .overlay(LinearGradient(gradient: Gradient(colors:[.black.opacity(0.5), .black.opacity(0.4), .black.opacity(0.3),.black.opacity(0.3), .black.opacity(0.2), .black.opacity(0.1),.clear]), startPoint: .top, endPoint: .bottom).frame(height: 80),
                                                alignment: .top)
                            }
                            .overlay(PlaceInfoView(place: places[index]), alignment: .bottom)
                            .tag(places[index])
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .overlay(Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(uiImage: UIImage(named: "icArrowLeft").nonNil)
                    }
                                .frame(width: C.backButtonSize,
                                       height: C.backButtonSize,
                                       alignment: .topLeading)
                                .offset(x: 20, y: 48),
                             alignment: .topLeading)
                    .overlay(HStack(alignment: .center, spacing: 18) {
                        ForEach(places.indices) { index in
                            if index == currentIndex {
                                Image(uiImage: UIImage(named: "icBigDot").nonNil)
                                    .frame(width: C.bigDotSize, height: C.bigDotSize)
                            } else {
                                Image(uiImage: UIImage(named: "icDot").nonNil)
                                    .frame(width: C.dotSize, height: C.dotSize)
                            }
                        }
                    }
                                .frame(width: 250, height: C.bigDotSize, alignment: .leading)
                                .offset(x: offsetDots)
                                .clipped()
                                .offset(y: -400)
                                .animation(.default), alignment: .bottom)
                    .onAppear {
                        if currentIndex > maxOffsetIndex {
                            let count = currentIndex - maxOffsetIndex
                            offsetDots = offsetDots - (CGFloat(count)) * C.offsetDots
                            minOffsetIndex = minOffsetIndex + count
                            maxOffsetIndex = maxOffsetIndex + count
                        }
                    }
                    .onChange(of: selectedPlace) { _ in
                        guard currentIndex >= 1 && currentIndex < places.count-1 else { return }
                        
                        if currentIndex > maxOffsetIndex {
                            offsetDots = offsetDots - C.offsetDots
                            minOffsetIndex = minOffsetIndex + 1
                            maxOffsetIndex = maxOffsetIndex + 1
                        } else if currentIndex < minOffsetIndex {
                            offsetDots = offsetDots + C.offsetDots
                            minOffsetIndex = minOffsetIndex - 1
                            maxOffsetIndex = maxOffsetIndex - 1
                        }
                    }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}

struct DetailedPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedPlaceView(selectedPlace: Place(name: "Name1", country: "Country1", city: "City1", image: UIImage(named: "icWood").nonNil, distance: 6, description: "descdghsfjhsdgfjhsdgfjhsdfghjdsgfhdsgfhjsdgfjhdsgfhjsdgfhjdsgjfhsdghjfgsdhjfsgdhjfgsdhjfgsdhjfgsdhjgfsdjhfgsdjhfghjsdgfjdhsgfsdhjgfhjsdgfhjsdgfjhsdgfhjsdghjfgsdjhfgdshgfhjsdgfhjsdgfjhsdghjfsdghjfgdshjfgsdhjfgsdhjfgshjdfgsjhfsgjhfdsghjfgsdhjfgsdjhfgsdhjfgdshjfgsdhjgfsdhjfgsjhfgsdhjfgdsjhrjdfshkjfdshkjfhdsjkfhsdjkhfjsdhfjksdhjfhsdkjfhsdkjfhsdjhfkjsdhfjsdhfkjsdhfjksdhfkjsdhfkjhsdjkfhsdkjfhsdkjhfkjsdhjfsdjfhsdjkfhdskjfhsdjkfhjksdfhjksdfhjkdsfhsdjkfhsdjhfhgdshjfgsdhjfgsjhfgsdhfgsdhfgshfgsdhjfgsdhjfgsdjhfgsdhjfgsdhjgfsdjhfgsdjhgfjhsdgfjhsdgfhjsdgfhjsdghjfgsdjhfgsdhjfgsdhjfgsdhjfgsjdhgfshdjfgshjdfgsdhjfgshjdgfhjsdgfhjsdgfhjsdgfhjgsdhjfgsdhjfgsdjhfgsdhjfghjsdfgsdhjfgsdhjgfsdhjgfsdhjgfhsdgfhsdgfjhsdgfjhsdgfjhsdgfhjdsghjfgsdhjfgsdhjfgsdhjfgshfgsdhfsdghfsdghfjsdgfhsdgfhjsdgfhsdgfhsdgfdshjfgshjdfgsdhjfgsdhjfgdshjfghdjsgfsdhjgfhjsdgfhjsdgfhsdgfhsdjfgshjdgsfjhsdgfhjsdgfhsdgfhjsdgfhjsdgfhdsgfhdsjgfsdhjfgyyyyyeyyeyeyfsdbjhfbsdhjfbshjbfsdbfhjsbdjhfbdshfbhsdjbfhjsdbfhjbsdhjfsdbhfbdshjfbsdhfbshdfbjhsdfbjsdbfsjhdkfbsdjhbfhjsdbfjhsdbfhjsdbhjfbsjhbfhjsdbhfjsdhjfsbfhjsbfjhdbfjhsbhjfdsbjhfsbdjhfbsdjhfbsdhbfjhsdbfjsdjfhsbdjhfsbdjhfbsdfbsdhfbsjhsdbfhjsdbfjhsdbfjhsdbfhjsdbfhjbsdjhfbshjdbfjhsdbfhjsbhfbsdjhfbsdhfbsjhbdfhdbshjfsdbhfsbjhfbshjfdbjhfsbdjfhsdbjhfbshfbsdjhbsfhjdsbhjfbdshjfsbhjfbsjhfbdhsdbfhsdbjfhbsdhfbsdjhfbsdhjfbshjbfsdhbfshfbdsjhfbshdfbhsdfbjsdhfbsdhfbsdhfbhsdjfbsdhfbsdhfjsdbfhsjdbfhsdjbfhbjsdfkjshdfjhsdfjshdjfhsdjfkhsdfhjsdhfkjsdhfjsdhfjksdhkfjsdjfhsjdkfsdjfshdkjfhsjkfhskjdsfjkdsfhkjdsfsdfsfsdfsdfsdfsdfsdfssfddsfsdfsdfsdfsdfsdfsdfsdfsdfsdfdsfsdfsdfsdfsdfsdfsdfsdsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfdsfsdfsdfsdsdfdsfsdfsdfsdfsdfsdfsdfdsfsdfdsfsdfsdfsdfdsfsdfsdfdssdfdsfsdfsdfsdfdsfsdfdsfdsfs", hotelsCount: 8, restaurantsCount: 7))
    }
}
