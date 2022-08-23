//
//  SwiftUI_PracticeApp.swift
//  SwiftUI Practice
//
//  Created by Shailesh Aher on 22/08/22.
//

import SwiftUI

@main
struct SwiftUI_PracticeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
