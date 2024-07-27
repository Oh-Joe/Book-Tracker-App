//
//  WIPApp.swift
//  WIP
//
//  Created by Antoine Moreau on 2024/7/23.
//

import SwiftUI

@main
struct WIPApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
