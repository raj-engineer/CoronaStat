//
//  DetailView.swift
//  CoronaStat
//
//  Created by Rajesh Rajesh on 17/04/23.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel:DetailViewModel
        init(value: String) {
            _viewModel = StateObject(wrappedValue: DetailViewModel(countryName: value))
        }
   
    var body: some View {
        ZStack{
            Color.background.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 11.0){
                Text("Quick Facts").font(Font.system(size: 65)).bold().foregroundColor(.customGrey).font(Font.system(size: 55))
                Spacer()
                Text("\(viewModel.detailEntity.confirmed ?? "0")").font(Font.system(size: 70)).bold().foregroundColor(.customGreen)
                
                Text("Total Confirmed Cases").font(.largeTitle).bold().foregroundColor(.customGrey)
                Spacer()
                Text("\(viewModel.detailEntity.deceased ?? "0")").font(Font.system(size: 70)).bold().foregroundColor(.customRed)
                
                Text("Total Deceased").font(.largeTitle).bold().foregroundColor(.customGrey)
                Spacer()
                Text("\(viewModel.detailEntity.recovered ?? "0")").font(Font.system(size: 70)).bold().foregroundColor(.customBlue)
                
                Text("Total Recovered").font(.largeTitle).bold().foregroundColor(.customGrey)
                
            }
            .padding()
        }.navigationTitle(viewModel.countryName)
            .onAppear{ viewModel.fetchDetail() }
            .alert(isPresented: $viewModel.isEnabled) {
                AlertHelper.shared.showAlert()
            }
           }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(value: "CountryName")
    }
}
