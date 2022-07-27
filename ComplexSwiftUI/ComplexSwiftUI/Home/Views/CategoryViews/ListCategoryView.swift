//
//  ListCategoryView.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 08.06.2022.
//

import SwiftUI

struct ListCategoryView: View {
    
    let categories: [Category]
    @State private var itemSelected: Int = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 15) {
                ForEach(categories.indices) { index in
                    let category = categories[index]
                    CategoryView(name: category.name, image: category.image, imageSelected: category.selectedImage, isSelected: .constant(itemSelected == index)) {
                        itemSelected = index
                    }
                }
            }
            .safeAreaInset(edge: .leading) {}
            .safeAreaInset(edge: .trailing) {}
        }
    }
}

struct ListCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ListCategoryView(categories: [
            Category(name: "Restaurants", image: UIImage(named: "icFork"), selectedImage: UIImage(named: "icForkSelected")),
            Category(name: "Hotels", image: UIImage(named: "icHome"), selectedImage: UIImage(named: "icHomeSelected")),
            Category(name: "Tickets", image: UIImage(named: "icFlight"), selectedImage: UIImage(named: "icFlightSelected"))
        ])
    }
}
