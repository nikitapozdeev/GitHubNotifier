//
//  NotificationListView.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/11/21.
//

import SwiftUI

struct NotificationsListView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        List(appState.notifications) { notification in
            NotificationItemView(notification: notification)
        }
    }
}

struct NotificationsListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsListView()
    }
}
