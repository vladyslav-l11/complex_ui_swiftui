//
//  ContentView.swift
//  ComplexSwiftUI
//
//  Created by Vladyslav Lysenko on 02.06.2022.
//

import SwiftUI

struct HomeView: View {
    
    let viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            ListPlaceView(userName: "Vlad", title: "Wanna plan your next trip?", placeList: viewModel.placeList)
        }.ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
