//
//  ConventionDemoApp.swift
//  ConventionDemo
//
//  Created by Jeffrey on 09/03/2026.
//

import SwiftUI
import SwiftData

@main
struct ConventionDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Guest.self, Exhibitor.self])
    }
}
