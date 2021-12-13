//
//  SettingsView.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/7/21.
//

import SwiftUI
import Foundation

struct SettingsView: View {
    @EnvironmentObject var appState: AppState
    
    @State private var token: String = ""
    @ObservedObject private var syncRate = NumbersObservable()
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Text("Token:")
                        TextField("", text: $token)
                    }
                }
                Section {
                    HStack {
                        Text("Refresh rate:")
                        TextField("", text: $syncRate.value)
                    }
                }
            }
            Divider()
            HStack {
                Button("Save", action: saveSettings)
                    .keyboardShortcut(.defaultAction)
                Button("Cancel", action: cancelChanges)
                    .keyboardShortcut(.cancelAction)
            }
        }
        .padding([.horizontal, .vertical])
    }
    
    func saveSettings() {
        appState.currentView = .notifications
    }
    
    func cancelChanges() {
        appState.currentView = .notifications
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
