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
        view(for: appState.currentView)
            .frame(width: 250, height: 500, alignment: Alignment.top)
    }
    
    @ViewBuilder
    func view(for route: Views?) -> some View {
        switch route {
        case .some(.notifications):
            NotificationsView()
        case .some(.settings):
            SettingsView()
        default:
            SettingsView()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
