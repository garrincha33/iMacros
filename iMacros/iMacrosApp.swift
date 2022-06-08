//
//  iMacrosApp.swift
//  iMacros
//
//  Created by Richard Price on 08/06/2022.
//

import SwiftUI

@main
struct iMacrosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
