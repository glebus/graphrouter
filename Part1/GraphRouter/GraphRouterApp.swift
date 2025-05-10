//
//  GraphRouterApp.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 06/04/2025.
//

import SwiftUI

@main
struct GraphRouterApp: App {
    @StateObject var router = BaseRouter()

    var body: some Scene {
        WindowGroup {
            RootView(router: router)
                .withBaseAppRouter(router)
        }
    }
}
