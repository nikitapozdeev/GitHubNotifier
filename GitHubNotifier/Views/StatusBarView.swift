//
//  StatusBarView.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/12/21.
//

import SwiftUI

struct StatusBarView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        HStack {
            if (appState.lastSyncTimestamp != nil) {
                Text("Last sync: \(appState.lastSyncTimestamp!)")
                    .font(.callout)
                    .foregroundColor(.primary)
            } else {
                Text("Last sync: not synced")
                    .font(.callout)
                    .foregroundColor(.primary)
            }
            
            Spacer(minLength: 0)
            
            if (appState.isSynchronizing) {
                ProgressView() {
                   // and if you want to be explicit / future-proof...
                   
                }
                    .progressViewStyle(CircularProgressViewStyle())
                    //.frame(width: 5, height: 5, alignment: .center)
            }
        }
        .padding(.horizontal)
        
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView()
    }
}
