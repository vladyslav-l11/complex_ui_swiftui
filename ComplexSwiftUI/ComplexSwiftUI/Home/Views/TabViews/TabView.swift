//
//  TabView.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 19.06.2022.
//

import SwiftUI

struct TabView: View {
    
    let image: UIImage?
    let imageSelected: UIImage?
    @Binding var isSelected: Bool
    private let action: () -> Void
    
    init(image: UIImage?, imageSelected: UIImage?, isSelected: Binding<Bool>, action: @escaping () -> Void) {
        self.image = image
        self.imageSelected = imageSelected
        self._isSelected = isSelected
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            VStack {
                if let image = isSelected ? imageSelected : image {
                    Image(uiImage: image)
                        .frame(width: 27, height: 27)
                        .padding(.bottom, 4)
                }
                if let elipseImage = UIImage(named: "icBlueElipse"), isSelected {
                    Image(uiImage: elipseImage)
                        .frame(width: 4, height: 4)
                }
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(image: UIImage(named: "icHouse"), imageSelected: UIImage(named: "icHouseSelected"), isSelected: .constant(false)) {}
    }
}
