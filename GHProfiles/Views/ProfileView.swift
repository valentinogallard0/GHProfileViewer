//
//  ProfileView.swift
//  GHProfiles
//
//  Created by Valentino De Paola Gallardo on 02/09/25.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @State private var usernameInput = ""
    @State private var showFollowers = false
    @State private var showRepos = false
    @State private var showImage = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
    
                // Buscador
                HStack {
                    TextField("GitHub username", text: $usernameInput)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .padding(.vertical, 8)
                    
                    Button {
                        Task {
                            await viewModel.loadProfile(for: usernameInput)
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title3)
                            .padding(10)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal)
                
                // Loading
                if viewModel.isLoading {
                    ProgressView("Cargando perfil...")
                        .padding()
                }
                
                // Usuario encontrado
                else if let user = viewModel.user {
                    VStack(spacing: 16) {
                        // Imagen
                        AsyncImage(url: URL(string: user.avatar_url)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                                .onTapGesture {
                                    showImage = true
                                }
                        } placeholder: {
                            ProgressView()
                        }
                        
                        // Nombre
                        Text(user.name ?? user.login)
                            .font(.title2)
                            .bold()
                        
                        // Seguidores
                        Button {
                            showFollowers = true
                        } label: {
                            Label("\(user.followers) seguidores", systemImage: "person.2.fill")
                        }
                        .buttonStyle(.bordered)
                        
                        // Repos
                        if !viewModel.repos.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Repositorios")
                                    .font(.headline)
                                
                                ForEach(viewModel.repos.prefix(2), id: \.name) { repo in
                                    HStack {
                                        Image(systemName: "folder.fill")
                                            .foregroundColor(.blue)
                                        Text(repo.name)
                                            .font(.subheadline)
                                    }
                                }
                                
                                Button("Ver todos") {
                                    showRepos = true
                                }
                                .font(.subheadline)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(radius: 4)
                    .padding(.horizontal, 50)
                }
                
                // Error
                else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                Spacer()
            }
            .navigationTitle("GitHub Profile Viewer")
            .sheet(isPresented: $showFollowers) {
                FollowersSheet(followers: viewModel.followers)
            }
            .sheet(isPresented: $showRepos) {
                RepoListView(repos: viewModel.repos)
            }
            .sheet(isPresented: $showImage) {
                ImageSheet(imageURL: viewModel.user?.avatar_url ?? "")
            }
        }
    }
}

#Preview {
    ProfileView()
}
