//
//  PlaceView.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 02.06.2022.
//

import SwiftUI

protocol PlaceViewDelegate: Any {
    func didSwiped(_ placeView: PlaceView)
}

struct PlaceView: View {
    
    private enum C {
        static let cornerRadius: CGFloat = 50
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
    }
    
    @GestureState private var additionalOffsetX: CGFloat = 0
    @State private var endPointX: CGFloat = 0
    @State private var isDragging = false
    let place: Place
    let shouldShowShadow: Bool
    let width: CGFloat
    var delegate: PlaceViewDelegate?
    
    var body: some View {
        NavigationLink(destination: DetailedPlaceView(place: place).navigationBarHidden(true)) {
            Image(uiImage: place.image)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: 450, alignment: .center)
                .overlay( LinearGradient(gradient: Gradient(colors: [.black.opacity(0.5), .black.opacity(0.3), .clear]), startPoint: .bottom, endPoint: .top).frame(height: shouldShowShadow ? 30 : 0),
                                alignment: .bottom)
                .mask(RoundedCorners(cornerRadius: C.cornerRadius, corners: [.bottomRight, .bottomLeft]))
                .overlay(VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.custom("Metropolis-Black", size: 24))
                    Text("\(place.city), \(place.country)")
                        .font(.custom("Metropolis-SemiBold", size: 13))
                    }
                    .padding(.leading, 24)
                    .padding(.trailing, 48)
                    .padding(.bottom, 28)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading), alignment: .bottomLeading)
                .ignoresSafeArea()
                .gesture(DragGesture()
                            .onChanged({ _ in
                    if !isDragging {
                        isDragging = true
                    }
                })
                            .updating($additionalOffsetX, body: { value, stateOffset, transaction in
                    
                    stateOffset = value.translation.width
                })
                            .onEnded({ value in
                    if value.translation.width < -(C.screenWidth/2) {
                        endPointX = -C.screenWidth
                        delegate?.didSwiped(self)
                    } else if value.translation.width >= C.screenWidth/2 {
                        endPointX = C.screenWidth
                        delegate?.didSwiped(self)
                    }
                    isDragging = false
                }))
                .animation(.default)
        }
        .offset(x: !isDragging ? endPointX : additionalOffsetX)
        .buttonStyle(FlatLinkStyle())
    }
}

struct RoundedCorners: Shape {
    var cornerRadius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlaceView(place: Place(name: "Name1", country: "Country1", city: "City1", image: UIImage(named: "icWood").nonNil, distance: 6, description: "descr", hotelsCount: 8, restaurantsCount: 7), shouldShowShadow: true, width: UIScreen.main.bounds.width)
        }
    }
}
