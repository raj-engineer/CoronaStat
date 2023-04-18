//
//  ContentView.swift
//  CoronaStat
//
//  Created by Rajesh Rajesh on 17/04/23.
//

import SwiftUI

struct CountryView: View {
    
    @StateObject private var viewModel = CountryViewModel()
    
    var body: some View {
        NavigationStack{
            List(viewModel.countryEntity.countryNames,id: \.self) { names in
                NavigationLink(destination: DetailView(value: names)){
                    Text(names)
                }
            }.navigationTitle(ScreenTitle.Home)
                .onAppear {
                    viewModel.fetchList()
                }.alert(isPresented: $viewModel.isEnabled) {
                    AlertHelper.shared.showAlert()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView()
    }
}
