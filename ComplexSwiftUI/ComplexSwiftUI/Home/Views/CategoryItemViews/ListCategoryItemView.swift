//
//  ListCategoryItemView.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 09.06.2022.
//

import SwiftUI

struct ListCategoryItemView: View {
    
    let categoryItems: [CategoryItem]
    
    var body: some View {
        LazyHStack(alignment: .top) {
            VStack {
                ForEach(0...categoryItems.count, id: \.self) { index in
                    if index < categoryItems.count && index % 2 == 0 {
                        let categoryItem = categoryItems[index]
                        CategoryItemView(name: categoryItem.name, rating: categoryItem.rating, image: categoryItem.image)
                            .padding(.bottom)
                    }
                }
            }.padding(.trailing, 10)
            VStack {
                ForEach(1...categoryItems.count, id: \.self) { index in
                    if index < categoryItems.count && index % 2 != 0 {
                        let categoryItem = categoryItems[index]
                        CategoryItemView(name: categoryItem.name, rating: categoryItem.rating, image: categoryItem.image)
                            .padding(.bottom)
                    }
                }
            }.padding(.leading, 10)
        }
    }
}

struct ListCategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListCategoryItemView(categoryItems: [
            CategoryItem(name: "Ritz", rating: 4.2, image: UIImage(named: "icFastFood1")),
            CategoryItem(name: "KFC", rating: 2.2, image: UIImage(named: "icFastFood2")),
            CategoryItem(name: "Street Cafe", rating: 4.0, image: UIImage(named: "icFastFood3"))
        ])
    }
}
