//
//  you_are_specialApp.swift
//  Shared
//
//  Created by Michael Craun on 10/14/21.
//

import Firebase
import SwiftUI

@main
struct you_are_specialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        FirebaseApp.configure()
    }
}
