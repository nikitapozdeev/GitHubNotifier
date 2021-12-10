//
//  NotificationItemView.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/11/21.
//

import SwiftUI

struct NotificationItemView: View {
    var notification: Notification
    
    var body: some View {
        HStack {

            Text(notification.id)

            Spacer()
        }
    }
}

struct NotificationItemView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationItemView(notification: Notification(
            id: "id",
            reason: "reason",
            unread: true,
            updatedAt: "updated date",
            lastReadAt: "last read date",
            url: "url"
        ))
    }
}
