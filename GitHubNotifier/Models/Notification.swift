//
//  Notification.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/9/21.
//

import Foundation

struct Notification: Codable, Identifiable {
    let id: String
    //var repository: Repository
    //let subject: NotificationInfo
    let reason: String
    let unread: Bool
    let updatedAt: String
    let lastReadAt: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        //case repository
        //case subject
        case reason
        case unread
        case updatedAt = "updated_at"
        case lastReadAt = "last_read_at"
        case url
    }
}
