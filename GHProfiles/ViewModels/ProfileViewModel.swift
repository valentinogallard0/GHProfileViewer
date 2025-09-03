//
//  ProfileViewModel.swift
//  GHProfiles
//
//  Created by Valentino De Paola Gallardo on 02/09/25.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var repos: [Repositorio] = []
    @Published var followers: [Followers] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let api = GitHubAPIService()
    private let defaultsKey = "LastSearchedUser"
    
    init(){
        if let savedUsername = UserDefaults.standard.string(forKey: defaultsKey) {
            Task{
                await loadProfile(for: savedUsername)
            }
        }
    }
    
    func loadProfile(for username: String) async{
        isLoading = true
        errorMessage = nil
        
        do{
            let fetchedUser = try await api.fetchUser(username: username)
            let fetchedRepos = try await api.fetchRepos(username: username)
            let fetchedFollowers = try await api.fetchFollowers(username: username)
            
            self.user = fetchedUser
            self.repos = fetchedRepos
            self.followers = fetchedFollowers
            
            UserDefaults.standard.set(username, forKey: defaultsKey)
        } catch{
            self.errorMessage = error.localizedDescription
            self.user = nil
            self.repos = []
            self.followers = []
        }
        isLoading = false
    }
}
