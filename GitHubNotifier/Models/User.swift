//
//  User.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/11/21.
//

struct User: Codable {
    let id: Int
    let avatarUrl: String
    let bio: String?
    let blog: String
    let company: String?
    let email: String
    let followers: Int
    let following: Int
    let htmlUrl: String
    let login: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case avatarUrl = "avatar_url"
        case bio
        case blog
        case company
        case email
        case followers
        case following
        case htmlUrl = "html_url"
        case login
        case name
    }
}
