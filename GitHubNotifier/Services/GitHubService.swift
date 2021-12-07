//
//  GitHubService.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/6/21.
//

import Foundation
import OctoKit

class GitHubService {
    let octokit: Octokit?
    var userAvatarUrl: String?
    
    init() {
        let githubToken = EnvironmentService.getEnvironmentVar("GITHUB_TOKEN")
        let config = TokenConfiguration(githubToken)
        octokit = Octokit(config)
    }
    
    func authenticate() {
        octokit?.me() { response in
            switch response {
            case .success(let user):
                print(user.login as Any)
                
                self.userAvatarUrl = user.avatarURL
                self.fetchRepositories()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchRepositories() {
        octokit?.repositories() { response in
            switch response {
            case .success(let repositories):
                repositories.forEach { repository in
                    print(repository.name as Any)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchPullRequests() {
      
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
