//
//  File.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/8/21.
//

import Foundation

enum Views {
    case notifications,
         settings
}

class AppState: ObservableObject {
    @Published var currentView: Views
    @Published var notifications: [Notification]
    
    init() {
        self.currentView = Views.notifications
        self.notifications = []
    }
}
