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
            UserView()
            
            Spacer(minLength: 0)
            
            Button(action: {
                appState.currentView = .settings
            }, label: {
                Image(systemName: "gearshape.fill")
                    .foregroundColor(.primary)
            })
                .help("Settings")
                .buttonStyle(PlainButtonStyle())
            
            Button(action: {}, label: {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.primary)
            })
                .help("User info")
                .buttonStyle(PlainButtonStyle())
            
            Button(action: {
                NSApplication.shared.terminate(self)
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.primary)
            })
                .help("Close application")
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
