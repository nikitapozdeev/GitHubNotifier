//
//  GitHubNotifierApp.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/6/21.
//

import SwiftUI

@main
struct GitHubNotifierApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate   
    var body: some Scene {
        Settings {
            AnyView(MenuView())
        }
    }
}

