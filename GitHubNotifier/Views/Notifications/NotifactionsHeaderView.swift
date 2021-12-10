//
//  NotifactionsHeaderView.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/11/21.
//

import SwiftUI

struct NotifactionsHeaderView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        HStack {
            Image("default_userpic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            
            Text("GitHub username")
                .font(.callout)
                .foregroundColor(.primary)
            
            Spacer(minLength: 0)
            
            Button(action: {
                appState.currentView = .settings
            }, label: {
                Image(systemName: "gearshape.fill")
                    .foregroundColor(.primary)
            })
                .buttonStyle(PlainButtonStyle())
            
            Button(action: {}, label: {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.primary)
            })
                .buttonStyle(PlainButtonStyle())
        }
        .padding([.horizontal, .vertical])
    }
}

struct NotifactionsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NotifactionsHeaderView()
    }
}
