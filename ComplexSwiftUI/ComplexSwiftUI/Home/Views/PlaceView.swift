//
//  PlaceView.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 02.06.2022.
//

import SwiftUI

struct PlaceView: View {
    
    private enum C {
        static let cornerRadius: CGFloat = 50
    }
    
    let image: UIImage
    let name: String
    let city: String
    let country: String
    
    var body: some View {
        GeometryReader { _ in
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 450, alignment: .center)
                .mask(RoundedCorners(cornerRadius: C.cornerRadius, corners: [.bottomRight, .bottomLeft]))
                .overlay(VStack(alignment: .leading) {
                    Text(name)
                        .font(.custom("Metropolis-Black", size: 24))
                    Text("\(city), \(country)")
                        .font(.custom("Metropolis-SemiBold", size: 13))
                    }
                    .padding(.leading, 24)
                    .padding(.trailing, 48)
                    .padding(.bottom, 28)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading), alignment: .bottomLeading)
                .ignoresSafeArea()
        }
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

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlaceView(image: UIImage(named: "icWood") ?? .init(), name: "Name", city: "City", country: "Country")
        }
    }
}
