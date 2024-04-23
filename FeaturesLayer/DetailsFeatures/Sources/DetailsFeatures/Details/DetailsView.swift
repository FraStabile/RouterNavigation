//
//  SwiftUIView.swift
//
//
//  Created by Francesco Stabile on 22/04/24.
//

import SwiftUI
import NetworkLayer
import UILayer
public struct DetailsView: View {
    @ObservedObject var viewModel: DetailsViewModel
    public var body: some View {
        VStack(
            alignment: .leading,
            spacing: 10
        ) {
            AsyncImage(
                url: URL(
                    string: viewModel.model?.image ?? ""
                )
            ) { image in
                image
                    .resizable()
                    .frame(
                        maxWidth: 200,
                        maxHeight: 200
                    )
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 20
                        )
                    )
                
            } placeholder: {
                ProgressView()
            }
            Text(
                "Ciao sono \(viewModel.model?.name ?? "")"
            )
            Text(
                "Specie \(viewModel.model?.species ?? "")"
            )
            Text(
                "Gender:  \(viewModel.model?.gender ?? "")"
            )
            Text(
                "Status: \(viewModel.model?.status ?? "")"
            )
            Text("Episodi in cui compare personaggio: ")
                .padding()
            List(
                viewModel.model?.episode ?? [],
                id: \.self
            ) { ep in
                Text(
                    ep.components(separatedBy: "/").last ?? ""
                )
            }
            .listStyle(.plain)
            
        }
        .padding()
        .onAppear(perform: {
            Task {
                await viewModel.getItem()
            }
        })
        
    }
}

public struct DetailsView_Preview: View {
    let mock = RickAndMortyRepositoryMock()
    init() {
        mock.mockGetCharDetail { _ in
            RickAndMortyChar(
                id: 1,
                name: "Summer Smith",
                status: "Alive",
                species: "Human",
                type: "",
                gender: "Female",
                origin: RickAndMortyChar.Location(
                    name: "Earth (Replacement Dimension)",
                    url: "https://rickandmortyapi.com/api/location/20"
                ),
                location: RickAndMortyChar.Location(
                    name: "Earth (Replacement Dimension)",
                    url: "https://rickandmortyapi.com/api/location/20"
                ),
                image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
                episode: [
                    "https://rickandmortyapi.com/api/episode/1",
                    "https://rickandmortyapi.com/api/episode/2"],
                url: "https://rickandmortyapi.com/api/character/3",
                created: ""
            )
        }
    }
    public var body: some View {
        DetailsView(
            viewModel: DetailsViewModel(
                with: 3,
                service: mock
            )
        )
    }
}
#Preview {
    DetailsView_Preview()
}
