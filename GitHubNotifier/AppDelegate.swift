//
//  AppDelegate.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/6/21.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var gitHubService = GitHubService()
    var settingsService = SettingsService()
    
    var statusItem: NSStatusItem?
    var popover = NSPopover()
    
    @ObservedObject var appState = AppState()
    
    func applicationDidFinishLaunching(_ notification: AppKit.Notification) {
        let menuView = MenuView()
            .environmentObject(appState)
        
        self.popover.behavior = .transient
        self.popover.animates = true
        self.popover.contentViewController = NSViewController()
        self.popover.contentViewController?.view = NSHostingView(rootView: menuView)
        self.popover.contentViewController?.view.window?.makeKey()
               
        self.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if let menuButton = self.statusItem?.button {
            menuButton.image = NSImage(systemSymbolName: "exclamationmark.bubble.fill", accessibilityDescription: nil)
            menuButton.action = #selector(MenuButtonToggle)
        }
        
        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
            self.synchronizeChanges()
        }

    }
    
    func synchronizeChanges() {
        Task {
            do {
                appState.startSynchronization()
                appState.user = try await gitHubService.fetchUser()
                appState.notifications = try await gitHubService.fetchNotifications()
            } catch {
                print("Request failed with error: \(error)")
            }
            appState.finishSynchronization()
        }
    }
    
    @objc func MenuButtonToggle(_ sender: AnyObject?) {
        guard let menuButton = self.statusItem?.button else {
            return
        }
        
        self.popover.show(
            relativeTo: menuButton.bounds,
            of: menuButton,
            preferredEdge: NSRectEdge.minY
        )
    }
}
