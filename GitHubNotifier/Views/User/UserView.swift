//
//  UserView.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/11/21.
//

import SwiftUI

struct UserView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        AsyncImage(url: URL(string: appState.user?.avatarUrl ?? "")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
        } placeholder: {
            Image("default_userpic")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .clipShape(Circle())
        .frame(width: 30, height: 30)

        Text(appState.user?.name ?? "GitHub username")
            .font(.callout)
            .foregroundColor(.primary)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
