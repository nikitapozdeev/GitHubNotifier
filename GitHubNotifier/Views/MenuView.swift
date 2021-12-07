//
//  MenuView.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/6/21.
//

import SwiftUI

struct MenuView: View {
    @Namespace var animation
    var body: some View {
        VStack {
            HStack {
                Image("default_userpic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text("GitHub username")
                    .font(.callout)
                    .foregroundColor(.primary)
                
                Spacer(minLength: 0)
                
                Button(action: {}, label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.primary)
                })
                    .buttonStyle(PlainButtonStyle())
                
                Button(action: {}, label: {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.primary)
                })
                    .buttonStyle(PlainButtonStyle())
            }
            .padding([.horizontal, .vertical])
            
            Divider()
        }
        .frame(width: 250, height: 500, alignment: Alignment.top)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
