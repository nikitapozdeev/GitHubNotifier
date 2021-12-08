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
            HStack {
                Text("Token:")
                TextField("", text: $token)
            }
            
            HStack {
                Text("Refresh rate:")
                TextField("", text: $syncRate.value)
            }
            
            Divider()
            
            HStack {
                Button("Save") {
                    appState.currentView = .notifications
                }.keyboardShortcut(.defaultAction)

                
                Button("Cancel") {
                    appState.currentView = .notifications
                }.keyboardShortcut(.cancelAction)
            }
        }
        .padding([.horizontal, .vertical])
        .frame(width: 250, height: 500, alignment: Alignment.top)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
