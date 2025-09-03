//
//  ImageSheet.swift
//  GHProfiles
//
//  Created by Valentino De Paola Gallardo on 02/09/25.
//

import SwiftUI

struct ImageSheet: View {
    let imageURL: String

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                AsyncImage(url: URL(string: imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding()
                } placeholder: {
                    ProgressView()
                }
                Spacer()
            }
            .navigationTitle("Foto de perfil")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

