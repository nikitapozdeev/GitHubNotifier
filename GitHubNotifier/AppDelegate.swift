//
//  AppDelegate.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/6/21.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var gitHubService = GitHubService()
    
    var statusItem: NSStatusItem?
    var popover = NSPopover()
    
    @ObservedObject var appState = AppState()
    
    func applicationDidFinishLaunching(_ notification: AppKit.Notification) {
        Task {
            do {
                appState.notifications = try await gitHubService.fetchNotifications()
            } catch {
                print("Request failed with error: \(error)")
            }
        }

        
        let menuView = MenuView().environmentObject(appState)
        popover.behavior = .transient
        popover.animates = true
        popover.contentViewController = NSViewController()
        popover.contentViewController?.view = NSHostingView(rootView: menuView)
        popover.contentViewController?.view.window?.makeKey()
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        
        if let MenuButton = statusItem?.button {
            MenuButton.image = NSImage(systemSymbolName: "exclamationmark.bubble.fill", accessibilityDescription: nil)
            MenuButton.action = #selector(MenuButtonToggle)
        }
    }
    
    @objc func MenuButtonToggle() {
        if let menuButton = statusItem?.button {
            self.popover.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
        }
    }
}
