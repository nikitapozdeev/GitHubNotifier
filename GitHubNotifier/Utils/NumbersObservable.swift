//
//  NumbersObservable.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/7/21.
//

import Foundation

class NumbersObservable: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
