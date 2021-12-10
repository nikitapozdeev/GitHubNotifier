//
//  MenuView.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/6/21.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            view(for: appState.currentView)
        }
     }
    
    @ViewBuilder
    func view(for route: Views?) -> some View {
        switch route {
        case .some(.notifications):
            NotificationsView().environmentObject(appState)
        case .some(.settings):
            SettingsView().environmentObject(appState)
        default:
            SettingsView().environmentObject(appState)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
