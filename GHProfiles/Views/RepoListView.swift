//
//  RepoListView.swift
//  GHProfiles
//
//  Created by Valentino De Paola Gallardo on 02/09/25.
//

import SwiftUI

struct RepoListView: View {
    
    let repos: [Repositorio]
    
    var body: some View {
        NavigationView{
            List(repos, id: \.name){ repo in
                VStack(alignment: .leading, spacing: 6){
                    Text(repo.name)
                        .font(.headline)
                    
                    if let description = repo.description{
                        Text(description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    HStack{
                        if let language = repo.language{
                            Text("🧠\(language)")
                        }
                        if repo.fork{
                            Text("Forked")
                        }
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Repositorios")
        }
    }
}

