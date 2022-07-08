//
//  ContentView.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 02.06.2022.
//

import SwiftUI

struct HomeView: View {
    
    private enum C {
        static let searchButtonSize: CGFloat = 27
    }
    
    let viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ListPlaceView(userName:  viewModel.user.name, title: "Wanna plan your next trip?", placeList: viewModel.placeList)
                    ListCategoryView(categories: viewModel.categoryList) .padding(.top, 40)
                    ListCategoryItemView(categoryItems: viewModel.categoryItemList)
                        .padding(.top, 40)
                }
                .overlay(Button(action: {}) {
                    Image(uiImage: UIImage(named: "icSearch").nonNil)
                }.frame(width: C.searchButtonSize,
                        height: C.searchButtonSize)
                            .offset(x: -20, y: 40), alignment: .topTrailing)
            }
            .ignoresSafeArea()
            .overlay(ListTabView(tabs: viewModel.tabs)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 14), alignment: .bottom)
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
