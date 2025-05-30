//
//  GraphRouterApp.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 06/04/2025.
//

import SwiftUI

@main
struct GraphRouterApp: App {
    let routerCoordinator = RouterCoordinator(tabRouter: .init())

    var body: some Scene {
        WindowGroup {
            TabRootView(router: routerCoordinator.tabRouter!)
                .withAppBaseRouter(routerCoordinator.sheetRouter)
                .environment(\.routerCoordinator, routerCoordinator)
        }
    }
}
