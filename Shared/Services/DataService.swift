//
//  DataService.swift
//  you-are-special
//
//  Created by Michael Craun on 10/14/21.
//

import Foundation

struct DataService {
    static let shared = DataService()
    
    private var defaults: UserDefaults { UserDefaults(suiteName: "com.craunicproductions.you-are-special") ?? .standard }
    
    func getValueFor(key: Key) -> String? {
        guard let value = defaults.string(forKey: key.rawValue) else {
            print("DataService could not fetch value for key: \(key)")
            return nil
        }
        return value
    }
    
    func set(value: String, for key: Key) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    enum Key: String {
        case version
    }
}

