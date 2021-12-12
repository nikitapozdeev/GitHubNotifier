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
            NotifactionsHeaderView()
            Divider()
            NotificationsListView()
            Divider()
            StatusBarView()
        }
        .frame(width: 250, height: 500, alignment: Alignment.top)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
