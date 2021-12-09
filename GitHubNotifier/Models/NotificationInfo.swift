//
//  NotificationInfo.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/9/21.
//

struct NotificationInfo: Codable {
    let title: String
    let url: String
    let latestCommentUrl: String
    let type: String
}
