//
//  GitHubService.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/6/21.
//

import Foundation

class GitHubService {
    var session = URLSession.shared
    var userAvatarUrl: String?

    func fetchUser() async throws -> User {
        let url = URL(string: "https://api.github.com/user")!
        let githubToken = EnvironmentService.getEnvironmentVar("GITHUB_TOKEN")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("token \(githubToken!)", forHTTPHeaderField: "Authorization")
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        
        // Use the async variant of URLSession to fetch data
        // Code might suspend here
        let (data, _) = try await session.data(for: request)
        
        // Parse the JSON data
        return try JSONDecoder().decode(User.self, from: data)
    }
    
    func fetchNotifications() async throws -> [Notification] {
        let url = URL(string: "https://api.github.com/notifications")!
        let githubToken = EnvironmentService.getEnvironmentVar("GITHUB_TOKEN")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("token \(githubToken!)", forHTTPHeaderField: "Authorization")
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        
        // Use the async variant of URLSession to fetch data
        // Code might suspend here
        let (data, _) = try await session.data(for: request)
        
        // Parse the JSON data
        return try JSONDecoder().decode([Notification].self, from: data)
    }
}

struct EnvironmentService {
    static func getEnvironmentVar(_ name: String) -> String? {
        if let value = ProcessInfo.processInfo.environment[name] {
            return value
        }
        
        return nil
    }
}
