//
//  FollowersSheet.swift
//  GHProfiles
//
//  Created by Valentino De Paola Gallardo on 02/09/25.
//

import SwiftUI

struct FollowersSheet: View {
    
    let followers: [Followers]
    
    var body: some View {
        NavigationView{
            List(followers, id: \.login){ follower in
                HStack(spacing: 15){
                    AsyncImage(url: URL(string: follower.avatar_url)){ image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                            .frame(width: 50, height: 50)
                    }
                    Text(follower.login)
                        .font(.headline)
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Seguidores")
        }
    }
}

#Preview {
    FollowersSheet(followers: [ Followers(login: "valentinogallard0", avatar_url: "https://avatars.githubusercontent.com/u/67544777?v=4"), Followers(login: "valentinogallard0", avatar_url: "https://avatars.githubusercontent.com/u/67544777?v=4")])
}

