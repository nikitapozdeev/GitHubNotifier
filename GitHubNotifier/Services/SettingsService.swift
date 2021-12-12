//
//  SettingsService.swift
//  GitHubNotifier
//
//  Created by Nikita Pozdeev on 12/15/21.
//

import Foundation

class SettingsService {
    var storageKey = "settings"
    let defaults = UserDefaults.standard
    
    func getSettings() -> Settings {
        if let savedSettings = defaults.object(forKey: storageKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedSettings = try? decoder.decode(Settings.self, from: savedSettings) {
                return loadedSettings
            }
        }
        return Settings(token: "", syncRate: 5)
    }
    
    func setSettings(settings: Settings) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(settings) {
            defaults.set(encoded, forKey: storageKey)
        }
    }
}
