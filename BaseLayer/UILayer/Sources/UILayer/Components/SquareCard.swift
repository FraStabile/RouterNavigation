//
//  SwiftUIView.swift
//
//
//  Created by Francesco Stabile on 23/04/24.
//

import SwiftUI
public struct SquareCardModel {
    var imageUrl: String
    var title: String
    public init(imageUrl: String, title: String) {
        self.imageUrl = imageUrl
        self.title = title
    }
}

public struct SquareCard: View {
    var model: SquareCardModel
    
    public init(model: SquareCardModel) {
        self.model = model
    }
    
    public var body: some View {
        VStack {
            AsyncImage(url: URL(string: model.imageUrl)) { image in
                image
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
                ProgressView()
            }
            Text(model.title)
                .font(.title)
                .bold()
        }
        
    }
}

#Preview {
    SquareCard(model: SquareCardModel(imageUrl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", title: "Rick Sanchez"))
}
