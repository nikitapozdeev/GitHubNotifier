//
//  NotificationsView.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/8/21.
//

import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
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
            
            Divider()
        }
        .frame(width: 250, height: 500, alignment: Alignment.top)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
