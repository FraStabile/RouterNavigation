//
//  SwiftUIView.swift
//
//
//  Created by Francesco Stabile on 23/04/24.
//

import SwiftUI
import UILayer
import NetworkLayer
struct HomeView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.items?.results ?? [], id: \.id) { item in
                    SquareCard(model: SquareCardModel(imageUrl: item.image, title: item.name))
                        .padding()
                        .onTapGesture {
                            viewModel.nextTapped(item: item.id)
                        }
                }
            }
            .padding(.horizontal)
            .frame(width: .infinity)
        }
        .onAppear(perform: {
            Task {
                await viewModel.getAllChar()
            }
        })
    }
}

private struct HomeView_Preview: View {
    let serviceMock = RickAndMortyRepositoryMock()
    init() {
        serviceMock.mockGetAllChars {
            RickAndMortyChars(info: Info(count: 1, pages: 10, next: ""), results: [Result(id: 1, name: "Bho", status: .alive, species: Species(rawValue: "") ?? .alien, type: "", gender: Gender(rawValue: "") ?? .male, origin: Location(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [], url: "", created: "")])
        }
    }
    var body: some View {
        HomeView(viewModel: HomeViewModel(service: serviceMock))

    }
}

#Preview {
    HomeView_Preview()
}
