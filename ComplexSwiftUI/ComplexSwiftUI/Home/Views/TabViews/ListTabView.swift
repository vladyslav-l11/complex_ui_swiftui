//
//  ListTabView.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 19.06.2022.
//

import SwiftUI

struct ListTabView: View {
    
    private enum C {
        static let radius: CGFloat = 23
        static let height: CGFloat = 80
        static let blurRadius: CGFloat = 5
    }
    
    let tabs: [Tab]
    @State private var itemSelected: Int = 0
    
    var body: some View {
        HStack(alignment: .top, spacing: UIScreen.main.bounds.width/4-40) {
            ForEach(0..<tabs.count) { index in
                let tab = tabs[index]
                TabView(image: tab.image, imageSelected: tab.selectedImage, isSelected: .constant(itemSelected == index)) {
                    itemSelected = index
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
            }
        }
        .ignoresSafeArea()
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: C.height)
        .background(RoundedRectangle(cornerRadius: C.radius)
                        .blur(radius: C.blurRadius)
                        .shadow(radius: 0.1)
                        .foregroundColor(.white)
                        .opacity(0.9))
    }
}

struct ListTabView_Previews: PreviewProvider {
    static var previews: some View {
        ListTabView(tabs: [
            Tab(image: UIImage(named: "icHouse"), selectedImage: UIImage(named: "icHouseSelected")),
            Tab(image: UIImage(named: "icLove"), selectedImage: UIImage(named: "icLoveSelected")),
            Tab(image: UIImage(named: "icDate"), selectedImage: UIImage(named: "icDateSelected")),
            Tab(image: UIImage(named: "icChat"), selectedImage: UIImage(named: "icChatSelected"))
        ])
    }
}
