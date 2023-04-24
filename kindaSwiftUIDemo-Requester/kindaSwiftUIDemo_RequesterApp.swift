//
//  kindaSwiftUIDemo_RequesterApp.swift
//  kindaSwiftUIDemo-Requester
//
//  Created by Alex Nagy on 24.04.2023.
//

import SwiftUI
import kindaSwiftUI

@main
struct kindaSwiftUIDemo_RequesterApp: App {
    var body: some Scene {
        WindowGroup {
            KindaSwiftUIContentView {
                NavigationStack {
                    ContentView()
                }
            }
        }
    }
}
