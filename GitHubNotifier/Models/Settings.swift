//
//  Settings.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/15/21.
//

import Foundation

struct Settings: Codable {
    let token: String
    let syncRate: Int
}
