//
//  LOCATIONApp.swift
//  LOCATION
//
//  Created by Rita Marrano on 18/04/23.
//

import SwiftUI

@main
struct LOCATIONApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
