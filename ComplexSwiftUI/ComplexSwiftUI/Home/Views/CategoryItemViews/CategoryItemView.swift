//
//  CategoryItem.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 09.06.2022.
//

import SwiftUI

struct CategoryItemView: View {
    
    private enum C {
        static let radius: CGFloat = 36
        static let viewWidth: CGFloat = (UIScreen.main.bounds.width - 70)/2
    }
    
    let name: String
    var rating: Double
    let image: UIImage?
    
    var imageSize: CGSize {
        image.nonNil.size
    }
    
    var viewHeight: CGFloat {
        2*C.viewWidth
    }
    
    var body: some View {
        Image(uiImage: image.nonNil)
            .resizable()
            .scaledToFill()
            .frame(width: C.viewWidth, height: imageSize.height)
            .offset(x: -20, y: 0)
            .cornerRadius(C.radius)
            .overlay(VStack(alignment: .leading) {
                Text(name)
                    .font(.custom("Metropolis-Medium", size: 14))
                    HStack {
                        Text(String(format: "%.1f", rating))
                            .font(.custom("Metropolis-Black", size: 20))
                        Image(uiImage: UIImage(named: "icStar").nonNil)
                            .frame(width: 20, height: 20)
                            .offset(x: -3, y: -3)
                    }
                }
                .padding(.leading, 20)
                .padding(.top, 20)
                .padding(.trailing, 20)
                .foregroundColor(.white)
                        .multilineTextAlignment(.leading), alignment: .topLeading)
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(name: "Ritz", rating: 4.2, image: UIImage(named: "icFastFood1"))
    }
}
