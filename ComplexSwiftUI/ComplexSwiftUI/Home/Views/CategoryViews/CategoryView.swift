//
//  CategoryView.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 07.06.2022.
//

import SwiftUI

struct CategoryView: View {
    
    private enum C {
        static let padding: CGFloat = 14
        static let radius: CGFloat = 21
        static let height: CGFloat = 58
        static let selectedForeground = UIColor.white
        static let selectedBackground = UIColor(named: "blue1").nonNil
        static let unselectedForeground = UIColor(named: "gray1").nonNil
        static let unselectedBackground = UIColor.white
    }
    
    let name: String
    let image: UIImage?
    let imageSelected: UIImage?
    @Binding var isSelected: Bool
    private let action: () -> Void
    
    init(name: String, image: UIImage?, imageSelected: UIImage?, isSelected: Binding<Bool>, action: @escaping () -> Void) {
        self.name = name
        self.image = image
        self.imageSelected = imageSelected
        self._isSelected = isSelected
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                if let image = isSelected ? imageSelected : image {
                    Image(uiImage: image)
                }
                Text(name)
                    .foregroundColor(Color(uiColor: isSelected ? C.selectedForeground : C.unselectedForeground))
            }
            .padding(.all, C.padding)
        }
        .frame(height: C.height)
        .background(RoundedRectangle(cornerRadius: C.radius).foregroundColor(Color(uiColor: isSelected ? C.selectedBackground : C.unselectedBackground)))
        .shadow(radius: 0.5)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(name: "Resaurants", image: UIImage(named: "icFork"), imageSelected: UIImage(named: "icForkSelected"), isSelected: .constant(true)) {}
    }
}
