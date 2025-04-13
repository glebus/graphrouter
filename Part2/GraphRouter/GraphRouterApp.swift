//
//  GraphRouterApp.swift
//  GraphRouter
//
//  Created by Gleb Ustymenko on 06/04/2025.
//

import SwiftUI

@main
struct GraphRouterApp: App {
    @StateObject var router = TabRouter()

    var body: some Scene {
        WindowGroup {
            TabRootView()
                .environmentObject(router)
                .withAppBaseRouter()
                .environmentObject(router as BaseRouter)
        }
    }
}
